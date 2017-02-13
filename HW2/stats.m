function [mu,V] = stats(Prices,trade_date,frequency,num_samples,rate_of_decay)

P = Prices; t_d = trade_date; f = frequency;
n_s = num_samples; r_o_d = rate_of_decay;

%P = Price; t_d = 850; f = 4;
%n_s = 175; r_o_d = 0.001;

s_d=t_d - 1 - f*[0:n_s];
s_d = fliplr(s_d);
S_P = P(s_d,:);
S_R = (S_P(2:end,:)-S_P(1:end-1,:))./S_P(1:end-1,:);

w = (1/(1-r_o_d)).^[0:length(S_R)-1];
w = w/sum(w);

mu = (w*S_R)';
V = S_R'*diag(w)*S_R - mu*mu';
end


