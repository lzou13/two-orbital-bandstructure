clear all
t1=1;
t2=2;
tz=0%0.5*t1;
U=0%2*t1;
if(t1>t2)
    shift=-2*t2+4*t1;
else
    shift=2*t2;
end
E1=zeros(1000);
E2=zeros(1000);
figure
hold on
for i=1:3
    if(i==1)
        kx=linspace(0,2*pi,500);
        ky=0;
    end
    if(i==2)
        kx=linspace(2*pi,0,500);
        ky=-kx+2*pi;
    end
    if(i==3)
        kx=0;
        ky=linspace(2*pi,pi,500);
    end
% [kx,ky]=meshgrid(0:0.01:2*pi)
    a=2*t2.*cos(kx)+U+shift;
    b=4*t1.*cos(kx/2).*cos(ky/2);
    c=b;
    d=2*t2.*cos(ky)+U+shift;
    x=U;
    y=x;
%     E1=(a.^2/2 + d.^2/2 - x^2 + b.*c + ((a+d).*((a-d).^2 + 4.*b.*c).^(1/2))./2).^(1/2);%-shift;
%     E2=(a.^2/2 + d.^2/2 - x^2 + b.*c - ((a+d).*((a-d).^2 + 4.*b.*c).^(1/2))./2).^(1/2);%-shift;
E1=(b.*c - (a.^4 - 2.*a.^2.*d.^2 - 2.*a.^2.*x.^2 + 2.*a.^2.*y.^2 + 4.*b.*c.*a.^2 + 8.*b.*c.*a.*d + d.^4 + 2.*d.^2.*x.^2 - 2.*d.^2.*y.^2 + 4.*b.*c.*d.^2 + x.^4 - 2.*x.^2.*y.^2 - 4.*b.*c.*x.^2 + 8.*b.*c.*x.*y + y.^4 - 4.*b.*c.*y.^2).^(1/2)/2 + a.^2/2 + d.^2/2 - x.^2/2 - y.^2/2).^(1/2);
E2=(b.*c + (a.^4 - 2.*a.^2.*d.^2 - 2.*a.^2.*x.^2 + 2.*a.^2.*y.^2 + 4.*b.*c.*a.^2 + 8.*b.*c.*a.*d + d.^4 + 2.*d.^2.*x.^2 - 2.*d.^2.*y.^2 + 4.*b.*c.*d.^2 + x.^4 - 2.*x.^2.*y.^2 - 4.*b.*c.*x.^2 + 8.*b.*c.*x.*y + y.^4 - 4.*b.*c.*y.^2).^(1/2)/2 + a.^2/2 + d.^2/2 - x.^2/2 - y.^2/2).^(1/2);

%  mesh(kx,ky,E1)
%  hold  on
%  mesh(kx,ky,E2)
    if(i==1)
        plot(kx/2/pi,E1,'b','linewidth',4)
        plot(kx/2/pi,E2,'r','linewidth',4)
    end
    if(i==2)
        plot(1+(2*pi-kx)*sqrt(2)/2/pi,E1,'b','linewidth',4)
        plot(1+(2*pi-kx)*sqrt(2)/2/pi,E2,'r','linewidth',4)
    end
    if(i==3)
        plot(1+sqrt(2)+(2*pi-ky)/2/pi,E1,'b','linewidth',4)
        plot(1+sqrt(2)+(2*pi-ky)/2/pi,E2,'r','linewidth',4)
    end
end
% % axis([0 1.5+sqrt(2) 0 20])
% box on
% grid on