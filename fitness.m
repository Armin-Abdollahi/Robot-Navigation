function sol=fitness(sol,data)
global NFE
%% Calling Data
load data

if NFE==0
        xx = linspace(model.xs, model.xt, model.n+2);
        yy = linspace(model.ys, model.yt, model.n+2);
        sol.x = [xx(2:end-1) yy(2:end-1)];
end

NFE=NFE+1;
%% Calling Sol
A=sol.x;

x=A(1:n);y=A(n+1:end);




%% 
    XS=[xs x xt];
    YS=[ys y yt];
    k=numel(XS);
    TS=linspace(0,1,k);
    
    tt=linspace(0,1,100);
    xx=spline(TS,XS,tt);
    yy=spline(TS,YS,tt);
    
    dx=diff(xx);
    dy=diff(yy);
    
    L=sum(sqrt(dx.^2+dy.^2));
    
    nobs = numel(xobs); % Number of Obstacles
    Violation = 0;
    for k=1:nobs
        d=sqrt((xx-xobs(k)).^2+(yy-yobs(k)).^2);
        v=max(1-d/robs(k),0);
        Violation=Violation+mean(v);
    end
    


%%
    z=L;
    
  
    
%% Cal CH
CH=Violation;SCH=100000000*sum(CH);

%% Cal OBJ

fit0=z;



sol.fit=fit0*(1+SCH);
sol.info.x=A;
sol.SCH=SCH;
sol.info.SCH=SCH;
sol.info.CH=CH;
sol.info.fit0=fit0;
sol.info.fit=sol.fit;
sol.info.TS=TS;
sol.info.XS=XS;
sol.info.YS=YS;
sol.info.tt=tt;
sol.info.xx=xx;
sol.info.yy=yy;
sol.info.dx=dx;
sol.info.dy=dy;
sol.info.L=L;


end

