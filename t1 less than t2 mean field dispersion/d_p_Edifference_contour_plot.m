t1=2;
t2=1;
[U1,U2]=meshgrid(0:0.05:30);

    a=2*t2+U1;
    a1=-2*t2+U1;
    
    b=4*t1;
    b1=0;
    
    c=b;
    c1=b1;
    
    d=2*t2+U2;
    d1=-2*t2+U2;
    
    E1=a/2 + d/2 - (a.^2 - 2.*a.*d + d.^2 + 4.*b.*c).^(1/2)/2;
    E2=a1/2 + d1/2 - (a1.^2 - 2.*a1.*d1 + d1.^2 + 4.*b1.*c1).^(1/2)/2;

   contour(U1,U2,E1-E2,'ShowText','on')

 hold on

    