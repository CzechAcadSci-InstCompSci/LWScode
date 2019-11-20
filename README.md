# LWS code version 1.0

Computation of the least weighted squares estimator

The code in Matlab allows to compute the least weighted squares (LWS) estimator proposed by Visek (2011). This is a robust estimator of parameters with a (possibly) high breakdown point. 

Feel free to use or modify the code.

## Requirements

You need the file fastlts.m to run the full code, which compares the LWS with the 
least trimmed squares (LTS) estimator. 
Available at https://jp.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/17554/versions/5/previews/fastlts.m/index.html

## Usage

 * mainLws.m
	Main file, which reads an external data file, runs the estimates for the least squares, LTS and LWS estimators,
and presents their results. It also presents the resulting LWS estimator graphically.

 * lwsCheck.m
         The function for computing the LWS estimator for the given dataset.          

## Authors
 * Jan Tichavský, The Czech Academy of Sciences, Institute of Computer Science
 * Jan Kalina, The Czech Academy of Sciences, Institute of Computer Science

## Contact

Do not hesitate to contact us (tichavsk@seznam.cz) or write an Issue.

## How to cite

Please consider citing the following:

Tichavský J, Kalina J (2019). LWS code. Available at https://github.com/Veragin/LWScode.

Víšek JÁ (2011). Consistency of the least weighted squares under heteroscedasticity. Kybernetika, 47, 179-206.

Kalina J, Tichavský J (2019). Statistical learning for recommending (robust) nonlinear regression methods. Journal of Applied Mathematics, Statistics and Informatics 15 (2). In press.

## Acknowledgement

This work was supported by the Czech Science Foundation grant 19-05704S.