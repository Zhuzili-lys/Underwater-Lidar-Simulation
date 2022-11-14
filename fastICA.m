function ret = fastICA(sig, numComponent,threshold)
%FASTICA separate the independent components in input prewhitened signal
% returning the weight matrix gain
% By Zhuziliwww 2022/11/14
    arguments
        sig = [];
        numComponent = 0;
        threshold = 0.0003;
    end

    %train
    sigSize = size(sig);%N, M
    ret = ones(numComponent,sigSize(1));
    for idx = 1:numComponent
        weight = ones(sigSize(1),1);
        prevWeight = zeros(sigSize(1),1);
        trial = 0;
        weightErr = norm(weight-prevWeight);
        while(weightErr>threshold)
            prevWeight = weight;
            
            %iteration of weight
            weight = sig*(G(weight'*sig))'-GD(weight'*sig)*ones(sigSize(2),1)*weight;
            weight = weight/sigSize(2);
            for jj = 1:idx-1
                weight = weight-(weight'*ret(:,jj))*ret(:,jj);
            end
            weight = weight./norm(weight);
            
            weightErr = norm(abs(weight)-abs(prevWeight));
            trial = trial+1;
            
            "Component: "+num2str(idx)+" Trail: "+num2str(trial)+" Err: "+num2str(weightErr)
        end
        ret(:,idx) = weight;
    end
end

