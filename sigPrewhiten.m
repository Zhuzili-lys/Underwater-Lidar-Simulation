function ret = sigPrewhiten(sig)
%% Prewhitening the input signal, returning the prewhitened signal desctibed by:
% X = D^{-1/2}E^{T}X
% By Zhuziliwww 2022/11/22
    arguments
        sig = [3,6,5;3,5,11];
    end

    % centering the required signal
    dataSize = size(sig);
    ret = zeros(dataSize);
    for rowIdx = 1:dataSize(1)
        rowSum = sum(sig(rowIdx, :));
        ret(rowIdx, :) = sig(rowIdx,:)-rowSum/dataSize(2);
    end
    
    %whitening the data
    [E,D] = eig(ret*ret');
    ret = E'*ret;
    ret = (D^(-1/2))*ret;
end