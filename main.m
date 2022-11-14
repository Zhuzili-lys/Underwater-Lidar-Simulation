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
P0 = 1; % Amplitude of the generated impulse
T_SURFACE = 0; % distance from emitter to surface in ns

F_M1 = 225*(10^6);
F_M2 = 3*F_M1;
t = 1:T_SAMP:400;
sig1 = zeros(length(t),1);
sig2 = zeros(length(t),1);
for ii = 1:length(t)
    sig1(ii) = P_M(t(ii), F_M1, 10, 57);
    sig2(ii) = P_M(t(ii), F_M2, 10, 57);
end
plot(t,sig1); hold on;
plot(t, sig2);
hold off;
sig = [sig1';sig2'];
whiteSig = sigPrewhiten(sig);
weight = fastICA(whiteSig,2,0.003);

S = weight'*sig;
plot(t,S(1,:)); hold on; plot(t, S(2,:));
% sig1 = sig1/max(sig1);
% sig2 = sig2/max(sig2);
