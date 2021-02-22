if isempty(currentFigures), currentFigures = []; end;
close(setdiff(findall(0, 'type', 'figure'), currentFigures))
clear mex
delete *.mexw64
[~,~,~] = rmdir('C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\codegen','s');
clear C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\ObjTrack.m
delete C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\ObjTrack.m
clear C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\kalman_loop.m
delete C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\kalman_loop.m
clear C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\kalmanfilter.m
delete C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\kalmanfilter.m
clear C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\plot_trajectory.m
delete C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\plot_trajectory.m
delete C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\position.mat
clear
load old_workspace
delete old_workspace.mat
delete C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter\cleanup.m
cd C:\Users\Martino\Desktop\Navigation\project\Matlab
rmdir('C:\Users\Martino\Desktop\Navigation\project\Matlab\coderdemo_kalman_filter','s');
