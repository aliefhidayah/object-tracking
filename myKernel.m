function [kernel] = myKernel(kernelType, height, width, radius)

height = int(height);
width = int(width);
kernel = zeros(height, width);

if strcmp(kernelType, 'epanechnikov')==1
	% ( 1 - ( 2*i/(R*H) - 1/R )^2 - ( 2*j/(R*W) - 1/R )^2 )
	xDist = meshgrid(-width/2:width/2, -height/2:height/2);
	yDist = meshgrid(-height/2:height/2,-width/2:width/2)';
	kernel = 1 - xDist.^2 - yDist.^2;
	kernel(kernel<0.0) = 0.0;
elseif strcmp(kernelType, 'gaussian')==1
    sigmaX = 0.5;
    sigmaY = 0.5;
	% exp( -0.5*( (i-0.5*H)^2/sigmaH^2 + (j-0.5*W)^2/sigmaW^2) )
	xDist = meshgrid(-width/2:width/2, -height/2:height/2);
	yDist = meshgrid(-height/2:height/2,-width/2:width/2)';
	h = (xDist.^2)/sigmaX^2 + (yDist.^2)/sigmaY^2;
	kernel = exp(-0.5*h);
end

end