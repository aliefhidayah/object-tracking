function [videoMatrix] = myImportMovie(videoFilePath, videoFileName, frameStart, frameEnd)

%% Read the video into a structure
% Installation of plugin in ubuntu 14.04
% sudo add-apt-repository ppa:mc3man/trusty-media
% sudo apt-get update
% sudo apt-get -y install gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly
videoStructure = VideoReader(strcat(videoFilePath,'/',videoFileName)); % Structure containing video information
videoNumberOfFrames = videoStructure.NumberOfFrames
count = 1;
if frameStart==0 && frameEnd==-1
    frameStart = 1;
    frameEnd = videoNumberOfFrames;
end
numberOfFramesToRead = frameEnd-frameStart+1;

for i=frameStart:frameEnd
    video = read(videoStructure, i);
    if(i==frameStart) && (ndims(video)==2)
      videoMatrix = uint8(zeros(size(video,1), size(video,2), numberOfFramesToRead));
    elseif (i==frameStart) && (ndims(video)==3)
        videoMatrix = uint8(zeros(size(video,1), size(video,2), size(video,3), numberOfFramesToRead));
    end
    imshow(video); hold on;
    if(ndims(video)==3)
        videoMatrix(:, :, :, count) = video;
    else
        videoMatrix(:, :, count) = video;
    end
    count = count+1;
end

end