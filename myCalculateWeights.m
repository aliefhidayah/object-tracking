function [w] = myCalculateWeights(p, q, patch, patchHeight, patchWidth)

w = zeros(patchHeight, patchWidth);

for i=1:patchHeight
	for j=1:patchHeight
		w(i,j) = sqrt( q(patch(i,j)+1)/p(patch(i,j)+1) );
	end
end

end