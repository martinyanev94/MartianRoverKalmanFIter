function [ zp ] = hx(xhat)
%checked

x1=xhat(1);
x3=xhat(3);

zp=sqrt(x1^2+x3^2);

end

