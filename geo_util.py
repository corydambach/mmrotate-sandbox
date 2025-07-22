from dataclasses import dataclass
import math
from PIL import Image
from typing import Any
import numpy as np

@dataclass
class Pnt:
    x: int
    y: int

@dataclass
class Vehicle():
    x:       int
    y:       int
    width:   int
    height:  int
    theta:   int
    arr:     np.array

@dataclass
class VehicleExport():
    center:      Pnt
    width:       int
    height:      int
    theta:       int
    polygon:     Any
    label:       str

@dataclass
class MatchExport():
    prev: VehicleExport
    curr: VehicleExport
    dist:        int
    color_dist:  int
    height_diff: int
    width_diff:  int
    theta_diff:  int

def euclidean_distance( x1, y1, x2, y2 ):
    return math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

def rbbox_to_poly( bbox ):
    xc, yc, w, h, ag = bbox[:5]
    wx, wy =  w / 2 * np.cos(ag), w / 2 * np.sin( ag )
    hx, hy = -h / 2 * np.sin(ag), h / 2 * np.cos( ag )
    p1 = (xc - wx - hx, yc - wy - hy)
    p2 = (xc + wx - hx, yc + wy - hy)
    p3 = (xc + wx + hx, yc + wy + hy)
    p4 = (xc - wx + hx, yc - wy + hy)
    poly = np.intp( np.array( [p1, p2, p3, p4] ) )
    return poly

def upscale_2x( image: Image ):
    w, h = image.size
    return (w*4, h*4)

def crop_polygon(image: Image, np_polygon):
    polygon  = [tuple(pnt) for pnt in np_polygon]
    min_x, min_y = np.min(polygon, axis=0)
    max_x, max_y = np.max(polygon, axis=0)
    # bbox = (min_x, min_y, max_x, max_y)
    # h = max_y - min_y
    # w = max_x - min_x
    left, top, right, bottom = min_x, min_y, max_x, max_y
    return image.crop( (left, top, right, bottom) )

def get_mean_color( img ):
    image_array = np.array( img )
    mean_color  = image_array.mean( axis=(0, 1) )
    return mean_color

