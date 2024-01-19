syms x;
for i=1:32
    p(i)=sym (['p',num2str(i)]);
end
for i=1:32
    assume(0<=p(i) & p(i)<=1);
end
sum=0;
for i=1:32
    sum=sum+p(i)*log2(p(i));
end
f=-sum;
%约束条件
sum=0;
for i=1:32
    sum=sum+p(i);
end
g=sum-1;
%定义拉格朗日函数
F=f-x*g
%求偏导
for i=1:32
    df(i)=sym (['df',num2str(i)]);
    df(i)=diff(F,p(i),1);
end
df(33)=sym (['df',num2str(33)]);%F对λ的偏导
df(33)=diff(F,x,1);
tem=[p,x];
[p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 x]=vpasolve(df,tem);
max=round(eval(f),5)
