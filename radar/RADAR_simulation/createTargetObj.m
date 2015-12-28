function targetObj = createTargetObj( pos, RCS, R, v, angle, plotted, clockWise, counterClockWise, hPlot, foundInTurn )
% function target = createTargetObj( pos, RCS, range, plotted, v, angle, clockWise,minAgnel)
% pos - target cordinate
% RCS - Radar Cross Section of the target
% R - target range (from radar)
% v - target velocity
% angle - target angle (to the radar)
% plotted - was this target plotted (new target wasn't plotted yet)
% max & min Agnle are the limits of angles in which the target was detected

targetObj = struct( 'pos'   , pos, ...
                    'RCS'   , RCS, ...
                    'R'     , R , ...
                    'plotted',plotted , ...
                    'v'     , v , ...
                    'angle' , angle, ...
                    'clockWise', clockWise, ...
                    'counterClockWise', counterClockWise, ...
                    'hPlot' ,   hPlot, ...
                    'foundInTurn', foundInTurn ...
                    );