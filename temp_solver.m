% solve the probelm with interior point method (barrier method)
clear all;

generate_training_data;
velocity_ID;

% set parameter
tol = 1e-3;
mu = 1.5;   % increase factor of t
t_0 = 2;  % initialize of t

% initialize of x
x0 = [20,10,1];

t = 0.5;

options = optimoptions('fminunc','Algorithm','quasi-newton');

E = zeros(1,T);

% iteration
for ii = 1:1e6
    
    f = @(x)objFun(x,t,dres,id_selected,v_train,ind_train,ID,T,E);
    
    [x,fval] = fminunc(f,x0,options);
    
    x0 = x;
    
    t = mu * t;
    
    if 1/t < tol
        break;
    end
    
end

ii

x
fval