mertonKMV(cumprod(((rand(1,100)-0.55)/10)+1), 1, 0.005, 0.001);
function mertonKMV(V, X, mu, sigma)
    l=length(V);
    t=ones(l);
    for i=1:l
        t(i)=i/l;
        d(i)=(log(V(i)/X)+(mu-0.5*sigma*sigma)*t(i))/(sigma*sqrt(t(i)));
    end
    PD=normcdf(-d);
    plot(t, PD,'b');
    xlabel('Time Horizontal in Years')
    ylabel('Expected Probability of Default')
end