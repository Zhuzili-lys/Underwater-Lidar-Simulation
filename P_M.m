function ret = P_M(t)
%% This function gets the signal received by the model of the backscattering underwater described by the formula:
% P_m(t) = P_0(t) ** [H_b(t)+H_t(t)]
% By Zhuziliwww 2022/11/22

    %Initialization of the parameters
    ALPHA = 0.2; % Seawater Attenuation coef in m-1
    V = 2.25*(10^(-1)); % speed of light underwater in m*(ns-1)
    N = 10000; % backscatter times
    RHO_B = 0.06; % backscatter rate in sea water
    RHO_T = 0.2; % underwater target reflectivity
    T_O = 50; % transmiter center delay in ns
    T_D = 150; % target distance (corresponding time) in ns
    F_M = 225*(10^6); % modulation frequency in Hz
    M = 1; % modulation depth 
    T_SAMP = 0.25; % sampling interval in ns
    TAU_0 = 0; % laser half width in ns
    TAU = 3; % laser impulse width in ns
    P0 = 1000000; % Amplitude of the generated impulse
    T_SURFACE = 10; % distance from emitter to surface in ns
    
    % Impulse Generating
    t_t = t-T_SURFACE;
    t_i = linspace(T_SURFACE,T_SURFACE+T_D, N);
    
    ret = RHO_T*exp(-2*ALPHA*V*t_t)*P_0(T_SURFACE);
    
    %backscattering
    for bsIdx = 1:N
        ret = ret + RHO_B*exp(-2*ALPHA*V*t_i(bsIdx))*P_0(t-t_i(bsIdx));
    end

end