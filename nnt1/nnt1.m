%Neural Network - Test[1]


alpha = 1;
lapda = 0.01;
maxi = input("maxi: ");
m = rows(exx1);


function s = f(z) 
 %  s = 1/(1+e^(-z));
    
    s = 1./(1 + exp(-z));
end


% z2 = [exx1 .* W1(1,1) + exx2 .* W1(1,2) + b1(1), exx1 .* W1(2,1) + exx2 .* W1(2,2) + b1(1), exx1 .* W1(3,1) + exx2 .* W1(3,2) + b1(1)];

disp("W2 (begin) =");
disp(W2);
disp("W1 (begin) =");
disp(W1);

disp("b2 (begin) =");
disp(b2);
disp("b1 (begin) =");
disp(b1);

a1 = [exx1, exx2];

z2 = a1 * W1 + b1;
a2 = f(z2);

z3 = a2 * W2 + b2;
h = f(z3);
a3 = h;

disp("h (begin) =");
disp(h);





for i = 1:maxi 

a1 = [exx1, exx2];

z2 = a1 * W1 + b1;
a2 = f(z2);

z3 = a2 * W2 + b2;
h = f(z3);
a3 = h;


%delta[laagnummer]
delta3 = -(exy - h) .* (a3 .* (1 - a3));
delta2 = (delta3 * W2') .* (a2 .* (1 - a2));
delta1 = (delta2 * W1') .* (a1 .* (1 - a1));

% W3
delta3T = (delta3(:,[1]) * 0 + 1)';
delta2T = (delta2(:,[1]) * 0 + 1)';
delta1T = (delta1(:,[1,1,1]) * 0 + 1)';

gradW2 = zeros(size(W2)) + a2' * delta3;
gradW1 = zeros(size(W1)) + a1' * delta2;
gradb2 = zeros(size(b2)) + delta3T * delta3;
gradb1 = zeros(size(b1)) + delta2T * delta2;


W2 = W2 - alpha * (gradW2 * 1/m);   %+ lapda * W2);
W1 = W1 - alpha * (gradW1 * 1/m);  %+ lapda * W1);

b2 = b2 - alpha * (gradb2 * 1/m);
b1 = b1 - alpha * (gradb1 * 1/m);

end


disp("h =");
disp(h);

disp("round(h) =");
disp(round(h));

disp("J / cost =");
disp(delta3);

disp("W2 =");
disp(W2);
disp("W1 =");
disp(W1);

disp("b2 =");
disp(b2);
disp("b1 =");
disp(b1);