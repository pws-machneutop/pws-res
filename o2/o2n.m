x = load('ex2x.dat');
y = load('ex2y.dat');

%figure; 
%plot(x, y, 'o');
%ylabel('Hoogte in meters')
%xlabel('Leeftijd in jaren')

theta = zeros(size(x(1,:)))';
m = length(y);
x = [ones(m, 1), x];
alpha = 0.07;
maxi = 1500


for i = 1:maxi 

theta = theta - alpha * ((1/m) .* x' * ((x * theta) - y));

end

%hold on; 
%plot(x(:,2), x*theta, '-')
%legend('Oefenpunten', 'Linear regression')
%hold off

theta

a = theta(2,1);
b = theta(1,1);

l = input('Wat is de leeftijd? ');

lengte = a * l + b;

lengte