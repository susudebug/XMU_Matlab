function [x2,y2,f_min]=td_min()
syms x y;
f=0.2*x^2+0.1*y^2+sin(x+y);
grad_f=gradient(f,[x,y])
clear;
h=0.1;x(1)=-2;y(1)=-2;
fb=5;
f(1)=fun(x(1),y(1));
n=1;
minf=5;
minx=x(1);
miny=y(1);

while abs(f(n)-fb)>0.001
    dx=fx(x(n),y(n));
    dy=fy(x(n),y(n));
    deltax=h*dx;
    deltay=h*dy;
    x(n+1)=x(n)-deltax;
    y(n+1)=y(n)-deltay;
    f(n+1)=fun(x(n+1),y(n+1));
    fb=f(n);
    if f(n+1)<minf
        minf=f(n+1);
        minx=x(n+1);
        miny=y(n+1);
    end
    n=n+1;
    if(x(n)>2*pi)||(x(n)<-2*pi)
        break;
    end
    if(y(n)>2*pi)||(y(n)<-2*pi)
        break;
    end
    if n>1000
        break;
    end
end
x2=minx;
y2=miny;
f_min=minf;

function dx=fx(x,y)
 dx=(2*x)/5+cos(x+y);
end
function dy=fy(x,y)
 dy=y/5+cos(x+y);
end
function p=fun(x,y)
 p=0.2*x^2+0.1*y^2+sin(x+y);
end
end