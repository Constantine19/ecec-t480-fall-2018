function [x, fx, ea, iter] = optim_golden(f, x1, xu, es, maxit, varargin)

if nargin<4||isempty(res), es=0.0001;end
if nargin<5||isempty(maxit), maxit=50;end
phi = (1+sqrt(5))/2;
iter = 0;
while(1)
    d = (phi-1)*(xu-x1);
    x1 = x1 + d;
    x2 = xu - d;
    if f(x1,varargin{:}) < f(x2,varargin{:})
        xopt = x1;
        x1 = x2;
    else
        xopt = x2;
        xu = x1;
    end
    iter=iter+1;
    if xopt~=0, ea = (2 - phi) * abs((xu - x1) / xopt) * 100; end
    if ea <= es || iter >= maxit,break,end
end
x=xopt;fx=f(xopt, varargin{:});
%code is from DR. Peter's lecture