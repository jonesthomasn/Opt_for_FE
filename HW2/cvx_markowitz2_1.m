function [x0,x] =  cvx_markowitz2_1(mu0,mu,V,sigma,xx0,xx,trans_cost);

n = length(mu);
U = chol(V);
e = ones(n,1);

    cvx_begin quiet
    
        variables x0 x(n) y(n) total_trans_cost
              
        maximize(mu0*x0+mu'*x)
        
        subject to
                    
            x'*V*x <= sigma*sigma;
            x0 + e'*x + total_trans_cost ==1;
            x == xx +y;
            trans_cost*sum(abs(y))<= total_trans_cost;
            x0>=0; %no borrowing 
            abs(x)<=0.5; % position limit
            x(2)+x(5)<= x(6)+x(7)+x(9); % relative positions constraint
            sum_smallest(x,4)>=-1.25; % short limit
    cvx_end