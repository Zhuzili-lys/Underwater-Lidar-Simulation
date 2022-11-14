function ret = P_M(t,F_M,TAU, TAU_0)
%% This function gets the signal received by the model of the backscattering underwater described by the formula:
% P_m(t) = P_0(t) ** [H_b(t)+H_t(t)]
% By Zhuziliwww 2022/11/12
arguments
    t = 0;
    F_M = 225*(10^6); % modulation frequency in Hz
    TAU = 30; % laser impulse width in ns
    TAU_0 = 0; % laser half width in ns
end
    %Initialization of the parameters
    ALPHA = 0.2; % Seawater Attenuation coef in m-1
    V = 2.25*(10^(-1)); % speed of light underwater in m*(ns-1)
    N = 10000; % backscatter times
    RHO_B = 0.06; % backscatter rate in sea water
    RHO_T = 0.2; % underwater target reflectivity
    T_D = 60; % target distance (corresponding time) in ns    
    T_SURFACE = 2; % distance from emitter to surface in ns
    
    % Impulse Generating
    t_t = t-T_SURFACE;
    t_i = linspace(T_SURFACE,T_SURFACE+T_D, N);
    
    ret = RHO_T*exp(-2*ALPHA*V*t_t)*P_0(T_SURFACE,F_M,TAU, TAU_0);
    
    %backscattering
    for bsIdx = 1:N
        ret = ret + RHO_B*exp(-2*ALPHA*V*t_i(bsIdx))*P_0(t-t_i(bsIdx),F_M,TAU, TAU_0);
    end

end