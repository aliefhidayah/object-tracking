function [similarity] = myCalculateSimilarity(p, q)

similarity = sum(p.*q);

end