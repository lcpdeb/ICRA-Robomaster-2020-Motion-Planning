function PlotRealRange(F1, F2, F3, F4, F5, F6)
global accuracy;
%% real range
% 启动区 红
plot([0*10/accuracy+1,10*10/accuracy+1],[0*10/accuracy+1,0*10/accuracy+1],'Color','r','LineWidth',2)
plot([0*10/accuracy+1,10*10/accuracy+1],[10*10/accuracy+1,10*10/accuracy+1],'Color','r','LineWidth',2)
plot([10*10/accuracy+1,10*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','r','LineWidth',2)
plot([0*10/accuracy+1,0*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','r','LineWidth',2)

plot([0*10/accuracy+1,10*10/accuracy+1],[41*10/accuracy+1,41*10/accuracy+1],'Color','r','LineWidth',2)
plot([0*10/accuracy+1,10*10/accuracy+1],[51*10/accuracy+1,51*10/accuracy+1],'Color','r','LineWidth',2)
plot([10*10/accuracy+1,10*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','r','LineWidth',2)
plot([0*10/accuracy+1,0*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','r','LineWidth',2)
% 启动区 蓝
plot([71*10/accuracy+1,81*10/accuracy+1],[41*10/accuracy+1,41*10/accuracy+1],'Color','b','LineWidth',2)
plot([71*10/accuracy+1,81*10/accuracy+1],[51*10/accuracy+1,51*10/accuracy+1],'Color','b','LineWidth',2)
plot([81*10/accuracy+1,81*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','b','LineWidth',2)
plot([71*10/accuracy+1,71*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','b','LineWidth',2)

plot([71*10/accuracy+1,81*10/accuracy+1],[0*10/accuracy+1,0*10/accuracy+1],'Color','b','LineWidth',2)
plot([71*10/accuracy+1,81*10/accuracy+1],[10*10/accuracy+1,10*10/accuracy+1],'Color','b','LineWidth',2)
plot([81*10/accuracy+1,81*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','b','LineWidth',2)
plot([71*10/accuracy+1,71*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','b','LineWidth',2)
% 障碍物
plot([0*10/accuracy+1,10*10/accuracy+1],[38.5*10/accuracy+1,38.5*10/accuracy+1],'Color','k','LineWidth',2)
plot([0*10/accuracy+1,10*10/accuracy+1],[41*10/accuracy+1,41*10/accuracy+1],'Color','k','LineWidth',2)
plot([10*10/accuracy+1,10*10/accuracy+1],[38.5*10/accuracy+1,41*10/accuracy+1],'Color','k','LineWidth',2)
plot([0*10/accuracy+1,0*10/accuracy+1],[38.5*10/accuracy+1,41*10/accuracy+1],'Color','k','LineWidth',2)

plot([15*10/accuracy+1,(15+2.5)*10/accuracy+1],[0*10/accuracy+1,0*10/accuracy+1],'Color','k','LineWidth',2)
plot([15*10/accuracy+1,(15+2.5)*10/accuracy+1],[10*10/accuracy+1,10*10/accuracy+1],'Color','k','LineWidth',2)
plot([(15+2.5)*10/accuracy+1,(15+2.5)*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','k','LineWidth',2)
plot([15*10/accuracy+1,15*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','k','LineWidth',2)

plot([15*10/accuracy+1,(15+8)*10/accuracy+1],[24.25*10/accuracy+1,24.25*10/accuracy+1],'Color','k','LineWidth',2)
plot([15*10/accuracy+1,(15+8)*10/accuracy+1],[(24.25+2.5)*10/accuracy+1,(24.25+2.5)*10/accuracy+1],'Color','k','LineWidth',2)
plot([(15+8)*10/accuracy+1,(15+8)*10/accuracy+1],[24.25*10/accuracy+1,(24.25+2.5)*10/accuracy+1],'Color','k','LineWidth',2)
plot([15*10/accuracy++1,15*10/accuracy++1],[24.25*10/accuracy++1,(24.25+2.5)*10/accuracy+1],'Color','k','LineWidth',2)

plot([35*10/accuracy+1,45*10/accuracy+1],[38.5*10/accuracy+1,38.5*10/accuracy+1],'Color','k','LineWidth',2)
plot([35*10/accuracy+1,45*10/accuracy+1],[41*10/accuracy+1,41*10/accuracy+1],'Color','k','LineWidth',2)
plot([45*10/accuracy+1,45*10/accuracy+1],[38.5*10/accuracy+1,41*10/accuracy+1],'Color','k','LineWidth',2)
plot([35*10/accuracy+1,35*10/accuracy+1],[38.5*10/accuracy+1,41*10/accuracy+1],'Color','k','LineWidth',2)

plot([36*10/accuracy+1,46*10/accuracy+1],[10*10/accuracy+1,10*10/accuracy+1],'Color','k','LineWidth',2)
plot([36*10/accuracy+1,46*10/accuracy+1],[12.5*10/accuracy+1,12.5*10/accuracy+1],'Color','k','LineWidth',2)
plot([46*10/accuracy+1,46*10/accuracy+1],[10*10/accuracy+1,12.5*10/accuracy+1],'Color','k','LineWidth',2)
plot([36*10/accuracy+1,36*10/accuracy+1],[10*10/accuracy+1,12.5*10/accuracy+1],'Color','k','LineWidth',2)

plot([63.5*10/accuracy+1,66*10/accuracy+1],[41*10/accuracy+1,41*10/accuracy+1],'Color','k','LineWidth',2)
plot([63.5*10/accuracy+1,66*10/accuracy+1],[51*10/accuracy+1,51*10/accuracy+1],'Color','k','LineWidth',2)
plot([66*10/accuracy+1,66*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','k','LineWidth',2)
plot([63.5*10/accuracy+1,63.5*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','k','LineWidth',2)

plot([(40.5-3*sqrt(2)/2)*10/accuracy+1,40.5*10/accuracy+1],[25.5*10/accuracy+1, (25.5+3*sqrt(2)/2)*10/accuracy+1],'Color','k','LineWidth',2)
plot([(40.5-3*sqrt(2)/2)*10/accuracy+1,40.5*10/accuracy+1],[25.5*10/accuracy+1, (25.5-3*sqrt(2)/2)*10/accuracy+1],'Color','k','LineWidth',2)
plot([(40.5+3*sqrt(2)/2)*10/accuracy+1,40.5*10/accuracy+1],[25.5*10/accuracy+1, (25.5+3*sqrt(2)/2)*10/accuracy+1],'Color','k','LineWidth',2)
plot([(40.5+3*sqrt(2)/2)*10/accuracy+1,40.5*10/accuracy+1],[25.5*10/accuracy+1, (25.5-3*sqrt(2)/2)*10/accuracy+1],'Color','k','LineWidth',2)

plot([(81-15)*10/accuracy+1,(81-15-8)*10/accuracy+1],[24.25*10/accuracy+1,24.25*10/accuracy+1],'Color','k','LineWidth',2)
plot([(81-15)*10/accuracy+1,(81-15-8)*10/accuracy+1],[(24.25+2.5)*10/accuracy+1,(24.25+2.5)*10/accuracy+1],'Color','k','LineWidth',2)
plot([(81-15-8)*10/accuracy+1,(81-15-8)*10/accuracy+1],[24.25*10/accuracy+1,(24.25+2.5)*10/accuracy+1],'Color','k','LineWidth',2)
plot([(81-15)*10/accuracy+1,(81-15)*10/accuracy+1],[24.25*10/accuracy+1,(24.25+2.5)*10/accuracy+1],'Color','k','LineWidth',2)

plot([71*10/accuracy+1,81*10/accuracy+1],[10*10/accuracy+1,10*10/accuracy+1],'Color','k','LineWidth',2)
plot([71*10/accuracy+1,81*10/accuracy+1],[12.5*10/accuracy+1,12.5*10/accuracy+1],'Color','k','LineWidth',2)
plot([81*10/accuracy+1,81*10/accuracy+1],[10*10/accuracy+1,12.5*10/accuracy+1],'Color','k','LineWidth',2)
plot([71*10/accuracy+1,71*10/accuracy+1],[10*10/accuracy+1,12.5*10/accuracy+1],'Color','k','LineWidth',2)

% Buff Zone
% 红方回血区 RedRegenerate
plot([F1.x,F1.x+5.4*10/accuracy],[F1.y,F1.y],'Color','k','LineWidth',2)
plot([F1.x,F1.x+5.4*10/accuracy],[F1.y+4.8*10/accuracy,F1.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F1.x+5.4*10/accuracy,F1.x+5.4*10/accuracy],[F1.y,F1.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F1.x,F1.x],[F1.y,F1.y+4.8*10/accuracy],'Color','k','LineWidth',2)

% 禁止射击区 ShootFree
plot([F5.x,F5.x+5.4*10/accuracy],[F5.y,F5.y],'Color','k','LineWidth',2)
plot([F5.x,F5.x+5.4*10/accuracy],[F5.y+4.8*10/accuracy,F5.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F5.x+5.4*10/accuracy,F5.x+5.4*10/accuracy],[F5.y,F5.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F5.x,F5.x],[F5.y,F5.y+4.8*10/accuracy],'Color','k','LineWidth',2)

% 蓝方弹药补给区 BlueSupply
plot([F4.x,F4.x+5.4*10/accuracy],[F4.y,F4.y],'Color','k','LineWidth',2)
plot([F4.x,F4.x+5.4*10/accuracy],[F4.y+4.8*10/accuracy,F4.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F4.x+5.4*10/accuracy,F4.x+5.4*10/accuracy],[F4.y,F4.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F4.x,F4.x],[F4.y,F4.y+4.8*10/accuracy],'Color','k','LineWidth',2)

% 蓝方回血区 BlueRegenerate
plot([F3.x,F3.x+5.4*10/accuracy],[F3.y,F3.y],'Color','k','LineWidth',2)
plot([F3.x,F3.x+5.4*10/accuracy],[F3.y+4.8*10/accuracy,F3.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F3.x+5.4*10/accuracy,F3.x+5.4*10/accuracy],[F3.y,F3.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F3.x,F3.x],[F3.y,F3.y+4.8*10/accuracy],'Color','k','LineWidth',2)

% 禁止移动区 MoveFree
plot([F6.x,F6.x+5.4*10/accuracy],[F6.y,F6.y],'Color','k','LineWidth',2)
plot([F6.x,F6.x+5.4*10/accuracy],[F6.y+4.8*10/accuracy,F6.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F6.x+5.4*10/accuracy,F6.x+5.4*10/accuracy],[F6.y,F6.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F6.x,F6.x],[F6.y,F6.y+4.8*10/accuracy],'Color','k','LineWidth',2)


% 红方弹药补给区 RedSupply
plot([F2.x,F2.x+5.4*10/accuracy],[F2.y,F2.y],'Color','k','LineWidth',2)
plot([F2.x,F2.x+5.4*10/accuracy],[F2.y+4.8*10/accuracy,F2.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F2.x+5.4*10/accuracy,F2.x+5.4*10/accuracy],[F2.y,F2.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([F2.x,F2.x],[F2.y,F2.y+4.8*10/accuracy],'Color','k','LineWidth',2)


end
