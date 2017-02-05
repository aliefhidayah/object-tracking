function [] = myPlayMovie(videoMatrix, frameStart, frameEnd)

numberOfDimensions = ndims(videoMatrix);

if(numberOfDimensions==4)
    [~, ~, ~, numberOfFrames] = size(videoMatrix);
elseif(numberOfDimensions==3)
    [~, ~, numberOfFrames] = size(videoMatrix);
end
if frameStart==0 && frameEnd==-1
    frameStart = 1;
    frameEnd = numberOfFrames;
end

figure;
for i=frameStart:frameEnd
    if (numberOfDimensions==4)
        imshow(videoMatrix(:, :, :, i));
        titleOfVideo = sprintf('Current frame of video: %d of %d', i, numberOfFrames);
        title(titleOfVideo);
    elseif (numberOfDimensions==3)
        imshow(videoMatrix(:, :, i));
        titleOfVideo = sprintf('Current frame of video: %d of %d', i, numberOfFrames);
        title(titleOfVideo);
    end
end

end