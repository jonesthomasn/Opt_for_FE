function return_risk_profile( mu,V )

e = ones(length(mu),1);
M = [-2*V,mu,e;
    mu',0,0;
    e',0,0
    ];
minverse = inv(M);
v = minverse(:,end)';
v = v(1:end-2);
u = minverse(:,end-1)';
u = u(1:end-2);

R = linspace(-0.1,0.1,201);
alpha = u*V*u';
beta = 2*v*V*u';
gamma = v*V*v';

front = (R.^2)*alpha + R*beta + gamma;
minx = find(front==min(front));
front(1:minx)=min(front);

plot(R,front);
end

