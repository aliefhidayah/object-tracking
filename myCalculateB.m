function [newPatch, map, m] = myCalculateB(image, patch)

[indexedImage, map] = rgb2ind(image, 65536);
m = length(map)+1;
newPatch = rgb2ind(patch, map);

end