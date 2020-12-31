syms a b c d x y;
H=[a b 0 0 0 0 -x 0;...
    c d 0 0 0 0 0 -y;...
    0 0 a b -x 0 0 0;...
    0 0 c d 0 -y 0 0;...
    0 0 x 0 -a -b 0 0;...
    0 0 0 y -c -d 0 0;...
    x 0 0 0 0 0 -a -b;...
    0 y 0 0 0 0 -c -d]
eig(H)
[V,E]=eig(H);

fid=fopen('F:\EigenH.txt','wt')
for j=1:8
     if(j>1)
     fprintf(fid,'\n');
     end
     fprintf(fid,'%s\n','Eigenvalue:');
    fprintf(fid,'%s\n',E(j,j));
     fprintf(fid,'%s\n','Eigenvector:');
     for i=1:8
     fprintf(fid,'%s',char(V(i,j)),' ');
 end
end
fclose(fid)
