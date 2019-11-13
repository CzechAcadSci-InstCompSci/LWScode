clear all;
### This is the main file, which should be self-explaining using this description:
### Code for computing the least squares, least trimmed squares, and least weighted squares.
### It contains the presentation of the results including graphical output.
### The input data file has to fulfil:
### - format *.txt
### - individual observations in rows
### - values separated by spaces
### - the first column corresponds to the index of the observation (i=1,...,n)
### - e.g. 2 5 5 5 in the input file corresponds to the second observation equal to (5,5,5) 
### - the second column corresponds to the response variable
### - the response is not allowed to be degenerated (i.e. with a zero variance)
### - we assume the matrix of the regressors to be regular

canContinue = false;
while(~canContinue) 
    try
        inputData = input('Please enter the name of the data file: ','s');
        data = load(inputData);
    catch
        'Error in reading the data file, please try again'
        continue;
    end
    [N, dim] = size(data);
    
    if(prod(svd(data)) ~= 0)
        canContinue = true;
    else
        'The assumption of regular matrix of the regressors is violated!!!'
    end
end

options.intercept = 0;
options.alpha = 0.75;
options.ntrial = 500;
ltsFit = fastlts(data(:, 2:dim), data(:, 1), options);

lwsFit = lwsCheck(data);
lsFit = fit(data(:, 2), data(:, 1),'poly1');

lwsFitX = linspace(0,200,800);
lwsFitY = lwsFitX*lwsFit(1) + lwsFit(2);
ltsFitY = lwsFitX*ltsFit.coefficients(1) + ltsFit.coefficients(2);
hold on
scatter(data(:, 2),data(:, 1));
plot(lwsFitX, lwsFitY, 'Color', 'black', 'LineWidth',2);
plot(lwsFitX, ltsFitY, 'Color', 'blue', 'LineWidth',1.5);
plot(lsFit);
hold off