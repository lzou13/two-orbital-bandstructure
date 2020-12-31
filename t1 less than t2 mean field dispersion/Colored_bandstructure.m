clear all
figure
t1=2;
t2=1;
% tz=0.5;
digits(8);
N=500;
x=zeros(N^2,1);
y=zeros(N^2,1);
E1=zeros(N^2,1);
E2=zeros(N^2,1);
Vc=zeros(N^2,1);
Vc1=zeros(N^2,1);
Vc11=zeros(N^2,1);
Vc2=zeros(N^2,1);
Vc22=zeros(N^2,1);
x=zeros(N);
y=zeros(N);
H0=[2*t2 4*t1;4*t1 2*t2];
[V0,E0]=eig(H0);
ij=1;
for i=1:N
    kx=-pi+2*pi*(i-1)/N;
    for j=1:N
        ky=-pi+2*pi*(j-1)/N;    
        x(ij)=kx;
        y(ij)=ky;
    a=2*t2*cos(kx);
    b=4*t1*cos(kx/2)*cos(ky/2);
    c=b;
    d=2*t2*cos(ky);
    H=[a b;c d];
    [V,E]=eig(H);
    
    E1(ij)=E(1,1);
    Vc1(ij)=(V(1,1)*V0(1,1)+V(2,1)*V0(2,1))^2;
    Vc11(ij)=(V(1,1)*V0(1,2)+V(2,1)*V0(2,2))^2;
    E2(ij)=E(2,2);
    Vc2(ij)=(V(1,2)*V0(1,1)+V(2,2)*V0(2,1))^2;
    Vc22(ij)=(V(1,2)*V0(1,2)+V(2,2)*V0(2,2))^2;
    ij=ij+1;
    end
end


 scatter3(x(:)/pi,y(:)/pi,E1(:),5,[Vc1(:)  Vc(:) Vc11(:) ])
  hold on
 scatter3(x(:)/pi,y(:)/pi,E2(:),5,[Vc2(:) Vc(:) Vc22(:) ])
 
% scatter3(x,y,E1);
 
% C=[abs(Vc1{:,:}(1)),abs(Vc1{:,:}(2)),0];
% [abs(Vc1{i,j}(1)),abs(Vc1{i,j}(2)),0]
%  mesh(E1,C);

% figure
% hold on
