function [] = myMainAlgorithm(videoMatrix, kernel, q, rect)

if(ndims(videoMatrix)==4)
	numberOfFrames = size(videoMatrix, 4);
elseif(ndims(videoMatrix)==3)
	numberOfFrames = size(videoMatrix, 3);
end

for t=1:numberOfFrames-1
	fprintf(1, 'Main Algorithm Started\n');

	if(ndims(videoMatrix)==4)
		nextFrame = rgb2ind(videoMatrix(:, :, :, t+1), map);
		nextPatch = nextFrame(rect(1,2):rect(1,2)+rect(1,4), rect(1,1):rect(1,1)+rect(1,3), :);
	elseif(ndims(videoMatrix)==3)
		nextFrame = rgb2ind(videoMatrix(:, :, t+1), map);
		nextPatch = nextFrame(rect(1,2):rect(1,2)+rect(1,4), rect(1,1):rect(1,1)+rect(1,3));
	end

	[newNextPatch, map, m] = myCalculateB(nextFrame, nextPatch);
	[p] = myGetProbabilityDistribution(newNextPatch, kernel, m);

	similarity = myCalculateSimilarity(p, q);

end

end