function ret = G(sig)
%G returns the value of the function E(u) = tanh(u) pointwisely
% By Zhuziliwww 2022/11/14
%     ret = tanh(sig);
    ret = sig.*exp(-sig.*sig/2);
end