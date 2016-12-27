

%De gradient descent formule       (= Vectorized implementation)
%for i = 1:10 
theta = theta - ((1/m) .* (x' * ((x .* theta) - y))) * 0.07;
theta
%i = i + 1;
%endfor


a = theta(1,1);
b = theta(1,2);

theta(1,1) = theta (2,1);
theta(1,2) = theta(1,1);
theta(2,:) = [];


f = a*x + b;

plot(x, y, 'o', x, f, '-');