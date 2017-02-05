function [selectedPatch, rect] = mySelectPatch(videoMatrix)


if(ndims(videoMatrix)==4)
	fig = figure;
	imshow(videoMatrix(:, :, :, 1));
	rect = getrect(fig);
	figure;
	selectedPatch = videoMatrix(rect(1,2):rect(1,2)+rect(1,4), rect(1,1):rect(1,1)+rect(1,3), :, 1);
	imshow(selectedPatch);
else
	fig = figure;
	imshow(videoMatrix(:, :, 1));
	rect = getrect(fig);
	figure;
	selectedPatch = videoMatrix(rect(1,2):rect(1,2)+rect(1,4), rect(1,1):rect(1,1)+rect(1,3), 1);
	imshow(selectedPatch);
end

end