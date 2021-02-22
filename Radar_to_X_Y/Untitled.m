
dt=60;
t=0:dt:59940;

Nsamples=length(t);

Rsaved=zeros(Nsamples,1);
for i=1:Nsamples
sas=sqrt(X(i)^2+Y(i)^2);
 Rsaved(i)=sas;
end

plot(t,Rsaved), hold on
plot(t,R_mes)