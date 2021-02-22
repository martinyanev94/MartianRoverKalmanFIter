function [H] = Hjacob( xp )
%checked
H=zeros(1,3);

x1=xp(1);
x3=xp(3);

H(1)=x1/sqrt(x1^2+x3^2);
H(2)=0;
H(3)=x3/sqrt(x1^2+x3^2);

end

