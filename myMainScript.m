clear all; close all; clc;

%% Add packages to path
% dirPath = fullfile(pwd,'/extPkg/');
% allSearchPaths = genpath(dirPath);
% addpath(allSearchPaths);

%% Get the video
[videoFileName, videoFilePath] ...
        = uigetfile({'*.mp4','MP4 Video (*.mp4)'; ...
		'*.avi;','Avi Video (*.avi)'; ...
		'*.*',  'All Files (*.*)'}, ...
		'Select a video file for object tracking', ...
		'MultiSelect', 'off');
if isequal(videoFileName,0)
	error('[ ERROR ] User did not select any video');
else
	fprintf(1, 'User selected %s\n', videoFileName);
end

[videoMatrix] = myImportMovie(videoFilePath, videoFileName, 0, -1);
myPlayMovie(videoMatrix, 0, -1);
if(ndims(videoMatrix)==4)
    firstImage = videoMatrix(:, :, :, 1);
elseif(ndims(videoMatrix)==3)
    firstImage = videoMatrix(:, :, 1);
end

[selectedPatch, rect] = mySelectPatch(videoMatrix);

kernelType = 'gaussian';
[kernel] = myKernel(kernelType, rect(1,3), rect(1,4), 1);

[newPatch, map, m] = myCalculateB(firstImage, selectedPatch);
[q] = myGetProbabilityDistribution(newPatch, kernel, m);

% myMainAlgorithm(videoMatrix, kernel, q, rect);