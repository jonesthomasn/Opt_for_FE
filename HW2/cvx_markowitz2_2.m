function [x0,x] =  cvx_markowitz2_2(mu0,mu,V,sigma,xx0,xx,trans_cost);

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
            x>=0;
            trans_cost*sum(abs(y))== total_trans_cost;
            abs(x-0.1)<=0.05;        
                    
    cvx_end