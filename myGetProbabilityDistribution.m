function [q] = myGetProbabilityDistribution(patch, kernel, m)

q = zeros(1, m);
[row, col] = size(patch);
m
max(max(patch))
min(min(patch))
for x=1:row
	for y=1:col 
		q(1, patch(x,y)+1) = q(1, patch(x,y)+1)+ kernel(x,y);
	end
end

C = 1/sum(sum(kernel));
q = C.*q;

end