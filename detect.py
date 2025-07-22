from argparse import ArgumentParser
from mmdet.apis import init_detector
import numpy as np
import torch
from mmrotate.apis import inference_detector_by_patches
import mmcv

class Args():
    pass

def parse_args():
    parser = ArgumentParser()
    parser.add_argument('img', help='Image file')
    parser.add_argument('config', help='Config file')
    parser.add_argument('checkpoint', help='Checkpoint file')
    parser.add_argument(
        '--patch_sizes',
        type=int,
        nargs='+',
        default=[1024],
        help='The sizes of patches')
    parser.add_argument(
        '--patch_steps',
        type=int,
        nargs='+',
        default=[824],
        help='The steps between two patches')
    parser.add_argument(
        '--img_ratios',
        type=float,
        nargs='+',
        default=[1.0],
        help='Image resizing ratios for multi-scale detecting')
    parser.add_argument(
        '--merge_iou_thr',
        type=float,
        default=0.1,
        help='IoU threshould for merging results')
    parser.add_argument(
        '--device', default='cuda:0', help='Device used for inference')
    parser.add_argument(
        '--palette',
        default='dota',
        choices=['dota', 'sar', 'hrsc', 'hrsc_classwise', 'random'],
        help='Color palette used for visualization')
    parser.add_argument(
        '--score-thr', type=float, default=0.3, help='bbox score threshold')
    parser.add_argument('--out-file', default=None, help='Path to output file')
    args = parser.parse_args()
    return args

def process_results(img, result, out_file=None, **kwargs):
        """Draw `result` over `img`.
        Args:
            img (str or Tensor): The image to be displayed.
            result (Tensor or tuple): The results to draw over `img`
                bbox_result or (bbox_result, segm_result).
            score_thr (float, optional): Minimum score of bboxes to be shown.
                Default: 0.3.
            out_file (str or None): The filename to write the image.
                Default: None.
        Returns:
            img (torch.Tensor): Only if not `show` or `out_file`
        """
        img = mmcv.imread(img)
        img = img.copy()
        if isinstance(result, tuple):
            bbox_result, segm_result = result
            if isinstance(segm_result, tuple):
                segm_result = segm_result[0]
        else:
            bbox_result, segm_result = result, None
        bboxes = np.vstack(bbox_result)
        labels = [
            np.full(bbox.shape[0], i, dtype=np.int32)
            for i, bbox in enumerate(bbox_result)
        ]
        labels = np.concatenate(labels)
        #CAD: we don't have segmentation masks in REDET
        # draw segmentation masks
        segms = None
        if segm_result is not None and len(labels) > 0:  # non empty
            segms = mmcv.concat_list(segm_result)
            if isinstance(segms[0], torch.Tensor):
                segms = torch.stack(segms, dim=0).detach().cpu().numpy()
            else:
                segms = np.stack(segms, axis=0)
        # if out_file specified, do not show image in window
        if out_file is not None:
            show = False

        #remove everything that isn't a small vehicle
        mask = (labels == 4) | (labels == 5)
        labels = labels[mask]
        bboxes = bboxes[mask]
        print( f"Detected {len( bboxes )} vehicles." )
        reshaped = labels.reshape( -1, 1 )
        concat = np.concatenate( (bboxes, reshaped), axis=1 )
        np.save( out_file, concat )
        return

def main(args):
    # build the model from a config file and a checkpoint file
    print( "about to init detector" )
    model = init_detector(args.config, args.checkpoint, device=args.device)
    print( "ran init_detector")

    # test a huge image by patches
    result = inference_detector_by_patches(model,
                                           args.img,
                                           args.patch_sizes,
                                           args.patch_steps,
                                           args.img_ratios,
                                           args.merge_iou_thr,
                                           bs=32)
    print( "ran inference_detector_by_patches" )
    process_results( args.img, result, out_file=args.out_file, score_thr=args.score_thr )

if __name__ == '__main__':
    args = parse_args()
    main(args)
