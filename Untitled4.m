clear variables
% simulation of two target avoiding each other
p = [4 4;10 4];
% v = [1 1;-1 1];

x = [5,3,1];

% x0 = [1 0];

options = optimoptions('fminunc','Algorithm','quasi-newton');

v = [1 1;
    -1 1;
    5,2];

p = [4 0;
    5 4;
    10,10];

x0 = [0.5,1];

f = @(v_desire)simu2Fun(v_desire,p,v,x);

[v_desire,fval,exitflag,output] = fminunc(f,x0,options);

v_desire

pos_1 = zeros(20,2);
pos_2 = zeros(20,2);
pos_3 = zeros(20,2);

for ii = 1:15
    
    f = @(v_desire)simu2Fun(v_desire,p,v,x);
    
    [v_desire,fval,exitflag,output] = fminunc(f,x0,options);
    
    v_desire
    
    p(1,:) = p(1,:)+v_desire;
    
    for jj = 2:length(p)
        p(jj,:) = p(jj,:)+v(jj,:);
    end
    
    v(1,:) = v_desire;
    x0 = v_desire;
    
    pos_1(ii,:) = p(1,:);
    pos_2(ii,:) = p(2,:);
    pos_3(ii,:) = p(3,:);
    
%     scatter(p1(1),p1(2));hold on
%     scatter(p2(1),p2(2));hold on
%     
%     waitforbuttonpress
    
end


% for ii = -2:0.2:20
%     for jj = -2:0.2:20
%         v1 = [ii jj];
%         v_desire = v1;
%         E = simu2Fun(v_desire,p1,p2,v1,v2,x);
%         
%         mm = int32(((ii+2)/0.2+1));
%         nn = int32(((jj+2)/0.2+1));
%         E_all(mm,nn) = E;
%     end
% end

plot(pos_1(:,1),pos_1(:,2));hold on
plot(pos_2(:,1),pos_2(:,2));hold on
plot(pos_3(:,1),pos_3(:,2));hold on