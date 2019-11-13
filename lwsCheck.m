%%% The function lwsCheck() computes the LWS estimator for the given dataset.

function [bb] = lwsCheck(data)
[N, dim] = size(data);
%%% here we use linearly decreasing weight function
%%% the user may replace this choice by another weight function
weight = ones(1, N) - ((1:N)-1)/N;
weight(1, floor(N*3/4):N) = 0;
theBestB = 0;
theBestCR = 10000000;

for i=1:100
    p = randperm(N, dim);
	A = data(p, 1:dim); 
    if(abs(det(A)) < 0.000001) ### numerical instability
        'singular, try some else';
        continue;
    end
    A1 = orth(A');
    [pomN, pomD] = size(A1);
    if(pomD < dim)
        continue;
    end
	b = -A1(2:dim, dim) / A1(1, dim);

	y = data(:, 1);
	X = data(:, 2:dim);
    residues = (y - X*b);

    J = 1:N;
	[kk, I] = sort(abs(residues));
    J(I) = J;
    newWeight = weight(J); 
    
	cr1 = newWeight*(residues.^2); 
	canContinue = true;

	while canContinue
        J = 1:N;
	    [kk, I] = sort(abs(residues));
        J(I) = J;
	    newWeight = weight(J); 
        
	    Q = X'*diag(newWeight)*X;
	    r = X'*diag(newWeight)*y;   
	    beta = Q\r;%inv(Q)*r;        %Q/r
        residues = y - X*beta;
	    b = beta;
    
	    cr2 = newWeight*(residues.^2);
	    if (cr2 >= cr1)
            	canContinue = false;
            	cr1 = 10000000;
            	if (theBestCR > cr2)
                	theBestCR = cr2;
                	theBestB = b;
            	end
            else
            	cr1 = cr2;
	    end
	end
end

if(theBestB == 0)
    vysledek = 'The input data seem not to be meaningful';
    bb = 0;
else
    vysledek = 'The best weighted regression, which was found by this subroutine';
    bb = theBestB;
    s_residuem = theBestCR;
end

