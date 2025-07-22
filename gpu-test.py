import mmrotate
import mmcv
import mmdet
import torch

print(f"pytorch version: {torch.__version__}")
print(f"cuda available: {torch.cuda.is_available()}")
print(f"cuda version: {torch.version.cuda}")
print()

if torch.cuda.is_available():
    print(f"gpu name:               {torch.cuda.get_device_name(0)}")
    print(f"gpu memory:             {torch.cuda.get_device_properties(0).total_memory / 1024**3:.2f} gb")
    print(f"gpu compute capability: {torch.cuda.get_device_capability(0)}")
print()

print(f"mmrotate version: {mmrotate.__version__}")
print(f"mmcv     version: {mmcv.__version__}")
print(f"mmdet    version: {mmdet.__version__}")
print()

print(f"cuda: {"available" if torch.cuda.is_available() else "unavailable" }")
print(f"device:       {torch.cuda.current_device() if torch.cuda.is_available() else 'cpu'}")
print(f"device count: {torch.cuda.device_count()}")
print()

# force a gpu operation to test
if torch.cuda.is_available():
    x = torch.randn(1000, 1000).cuda()
    y = torch.randn(1000, 1000).cuda()
    z = torch.mm(x, y)
    print(f"gpu test successful: {z.is_cuda}")
else:
    print("cuda not available - running on cpu")