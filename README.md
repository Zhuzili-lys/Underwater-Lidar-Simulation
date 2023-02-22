# Underwater-Lidar-Simulation
The implementation for the Capstone design sponsored by Sophoton for underwater Lidar. Code runs on MATLAB R2022b(earlier versions should also work) with signal processing toolbox. 

## 2022/11/12 
The generation for the signals described by:

$P_{m} = P_{0}(t)** \left[H_{b}(t)+H_{t}(t)\right]$
  
is included in the function P_M. 

## 2022/11/14

Bug fixed: The unit of the frequency should be consistent to the unit of time. The factor of time in $P_{0}$ is multiplied by $10^{-9}$.

Finished fastICA implementation of underwater LiDAR trajectory. 

## 2022/11/19 

Improved the visulization of backward scattering to help calculating the range. 

Have a nice day!
