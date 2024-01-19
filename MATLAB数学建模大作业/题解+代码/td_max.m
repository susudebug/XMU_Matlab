function [x1,y1,f_now,z] = td_max(z1,z2)

x0 = z1;
y0 = z2;
f_now = 0.2*x0^2+0.1*y0^2+sin(x0+y0); 
z=0;                     
f_error = 1;           
h = 1.0e-8;              

while f_error>1.0e-8    

    if (x0<-2*pi)||(x0>2*pi)
        break;
    end
    if ((y0<-2*pi)||(y0>2*pi))
        break;
    end
    f_val = f_now;
    x1 = x0+h*(0.4*x0+cos(x0+y0));
    y1 = y0+h*(0.2*y0+cos(x0+y0));
    f_now = 0.2*x1^2+0.1*y1^2+sin(x1+y1);
    f_error = f_now-f_val;
    x0 = x1;
    y0 = y1;
    z = z+1;
end

end