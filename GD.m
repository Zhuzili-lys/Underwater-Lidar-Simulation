function ret = GD(sig)
%GD returns the value of the function E(u) = 1-tanh(u)*tanh(u) pointwisely
% By Zhuziliwww 2022/11/14
%     ret = 1-tanh(sig).*tanh(sig);
    ret = 1-(sig.*sig).*exp(-sig.*sig/2);
end