clear all
t1=33.5;
t2=25.8;
U1=0;
U2=0;
U12=0;
if(t1>t2)
    shift=-2*t2+4*t1;
else
    shift=2*t2;
end
E1=zeros(1000);
E2=zeros(1000);
figure
hold on
%%%%%%%
%%%    2Dplot
% for i=1:3
%     if(i==1)
%         kx=linspace(0,2*pi,1000);
%         ky=0;
%     end
%     if(i==2)
%         kx=linspace(2*pi,0,1000);
%         ky=-kx+2*pi;
%     end
%     if(i==3)
%         kx=0;
%         ky=linspace(2*pi,pi,1000);
%     end
%%%%%%%%
%%%%%%%%
%%%%   3Dplot
[kx,ky]=meshgrid(-pi:0.01:pi);
%%%%
a=2*t2.*cos(kx)+U1+shift;
b=4*t1.*cos(kx/2).*cos(ky/2)+U12;
c=b;
d=2*t2.*cos(ky)+U2+shift;
E1=a/2 + d/2 - (a.^2 - 2.*a.*d + d.^2 + 4.*b.*c).^(1/2)/2;
E2=a/2 + d/2 + (a.^2 - 2.*a.*d + d.^2 + 4.*b.*c).^(1/2)/2;
%     x=U;
%     E1=(a.^2/2 + d.^2/2 - x^2 + b.*c + ((a+d).*((a-d).^2 + 4.*b.*c).^(1/2))./2).^(1/2)-shift;
%     E2=(a.^2/2 + d.^2/2 - x^2 + b.*c - ((a+d).*((a-d).^2 + 4.*b.*c).^(1/2))./2).^(1/2)-shift;
%%%%%    3Dplot
mesh(kx,ky,E1)
hold  on
mesh(kx,ky,E2)
%%%%%

%%%%%%
%%%     2Dplot
%     if(i==1)
%         plot(kx/2/pi,E1,'k','linewidth',4)
% %         plot(kx/2/pi,E2,'r','linewidth',4)
%     end
%     if(i==2)
%         plot(1+(2*pi-kx)*sqrt(2)/2/pi,E1,'k','linewidth',4)
% %         plot(1+(2*pi-kx)*sqrt(2)/2/pi,E2,'r','linewidth',4)
%     end
%     if(i==3)
%         plot(1+sqrt(2)+(2*pi-ky)/2/pi,E1,'k','linewidth',4)
% %         plot(1+sqrt(2)+(2*pi-ky)/2/pi,E2,'r','linewidth',4)
%     end
% end
% axis([0 1.5+sqrt(2) 0 20])
% box on
% grid on