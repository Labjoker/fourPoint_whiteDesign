% import 

% clear all
% lumda=(380:1:780);
% [X,Y,Z]=colorMatchFunction(lumda);
clear all
load('matlab.mat');
S=0;
q2=0;
x=X./(X+Y+Z);
y=Y./(X+Y+Z);
z=Z./(X+Y+Z);
for i=1:400
    x3=x(401-i);
    y3=y(401-i);
    for j=1:(400-i)
        x4=x(j);
        y4=y(j);   
        a = [0.174112234426342 0.734689991422002 x3 x4 0.174112234426342];
        b = [0.004963725981453 0.265310008577998 y3 y4 0.004963725981453];
        q1=polyarea(a,b);
        %xyS((i-1)*200+j,:)=[x3 x4 y3 y4 S((i-1)*200+j)];
           if q1>q2
               q2=q1;
               S=[x3 x4 y3 y4 q2];
               xx3=x3;
               yy3=y3;
               xx4=x4;
               yy4=y4;
               I=i;
               J=j;
%                plot(a,b,'LineWidth',1.1)
           end
    end
        
end
aa = [0.174112234426342 0.734689991422002 xx3 xx4 0.174112234426342];
bb = [0.004963725981453 0.265310008577998 yy3 yy4 0.004963725981453];
plot(aa,bb,'LineWidth',1.1)
hold on
plot(x,y)
I=401-I;
J=J;
