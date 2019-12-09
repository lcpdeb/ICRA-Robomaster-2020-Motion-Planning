function PlotRealRange(RedRegenerate, RedSupply, BlueRegenerate, BlueSupply, ShootFree, MoveFree)
%% real range
% 启动区 红
plot([0+1,10+1],[0+1,0+1],'Color','r','LineWidth',2)
plot([0+1,10+1],[10+1,10+1],'Color','r','LineWidth',2)
plot([10+1,10+1],[0+1,10+1],'Color','r','LineWidth',2)
plot([0+1,0+1],[0+1,10+1],'Color','r','LineWidth',2)

plot([0+1,10+1],[41+1,41+1],'Color','r','LineWidth',2)
plot([0+1,10+1],[51+1,51+1],'Color','r','LineWidth',2)
plot([10+1,10+1],[41+1,51+1],'Color','r','LineWidth',2)
plot([0+1,0+1],[41+1,51+1],'Color','r','LineWidth',2)
% 启动区 蓝
plot([71+1,81+1],[41+1,41+1],'Color','b','LineWidth',2)
plot([71+1,81+1],[51+1,51+1],'Color','b','LineWidth',2)
plot([81+1,81+1],[41+1,51+1],'Color','b','LineWidth',2)
plot([71+1,71+1],[41+1,51+1],'Color','b','LineWidth',2)

plot([71+1,81+1],[0+1,0+1],'Color','b','LineWidth',2)
plot([71+1,81+1],[10+1,10+1],'Color','b','LineWidth',2)
plot([81+1,81+1],[0+1,10+1],'Color','b','LineWidth',2)
plot([71+1,71+1],[0+1,10+1],'Color','b','LineWidth',2)
% 障碍物
plot([0+1,10+1],[38.5+1,38.5+1],'Color','k','LineWidth',2)
plot([0+1,10+1],[41+1,41+1],'Color','k','LineWidth',2)
plot([10+1,10+1],[38.5+1,41+1],'Color','k','LineWidth',2)
plot([0+1,0+1],[38.5+1,41+1],'Color','k','LineWidth',2)

plot([1+15,15+2.5+1],[1+0,0+1],'Color','k','LineWidth',2)
plot([1+15,15+2.5+1],[1+10,10+1],'Color','k','LineWidth',2)
plot([1+15+2.5,15+2.5+1],[1+0,10+1],'Color','k','LineWidth',2)
plot([1+15,15+1],[1+0,10+1],'Color','k','LineWidth',2)

plot([1+15,15+8+1],[1+24.25,24.25+1],'Color','k','LineWidth',2)
plot([1+15,15+8+1],[1+24.25+2.5,24.25+2.5+1],'Color','k','LineWidth',2)
plot([1+15+8,15+8+1],[1+24.25,24.25+2.5+1],'Color','k','LineWidth',2)
plot([1+15,15+1],[1+24.25,24.25+2.5+1],'Color','k','LineWidth',2)

plot([1+35,45+1],[1+38.5,38.5+1],'Color','k','LineWidth',2)
plot([1+35,45+1],[1+41,41+1],'Color','k','LineWidth',2)
plot([1+45,45+1],[1+38.5,41+1],'Color','k','LineWidth',2)
plot([1+35,35+1],[1+38.5,41+1],'Color','k','LineWidth',2)

plot([1+36,46+1],[1+10,10+1],'Color','k','LineWidth',2)
plot([1+36,46+1],[1+12.5,12.5+1],'Color','k','LineWidth',2)
plot([1+46,46+1],[1+10,12.5+1],'Color','k','LineWidth',2)
plot([1+36,36+1],[1+10,12.5+1],'Color','k','LineWidth',2)

plot([1+63.5,66+1],[1+41,41+1],'Color','k','LineWidth',2)
plot([1+63.5,66+1],[1+51,51+1],'Color','k','LineWidth',2)
plot([1+66,66+1],[1+41,51+1],'Color','k','LineWidth',2)
plot([1+63.5,63.5+1],[1+41,51+1],'Color','k','LineWidth',2)

plot([1+40.5-3*sqrt(2)/2,40.5+1],[1+25.5 25.5+3*sqrt(2)/2+1],'Color','k','LineWidth',2)
plot([1+40.5-3*sqrt(2)/2,40.5+1],[1+25.5 25.5-3*sqrt(2)/2+1],'Color','k','LineWidth',2)
plot([1+40.5+3*sqrt(2)/2,40.5+1],[1+25.5 25.5+3*sqrt(2)/2+1],'Color','k','LineWidth',2)
plot([1+40.5+3*sqrt(2)/2,40.5+1],[1+25.5 25.5-3*sqrt(2)/2+1],'Color','k','LineWidth',2)

plot([1+81-15,81-15-8+1],[1+24.25,24.25+1],'Color','k','LineWidth',2)
plot([1+81-15,81-15-8+1],[1+24.25+2.5,24.25+2.5+1],'Color','k','LineWidth',2)
plot([1+81-15-8,81-15-8+1],[1+24.25,24.25+2.5+1],'Color','k','LineWidth',2)
plot([1+81-15,81-15+1],[1+24.25,24.25+2.5+1],'Color','k','LineWidth',2)

plot([1+71,81+1],[1+10,10+1],'Color','k','LineWidth',2)
plot([1+71,81+1],[1+12.5,12.5+1],'Color','k','LineWidth',2)
plot([1+81,81+1],[1+10,12.5+1],'Color','k','LineWidth',2)
plot([1+71,71+1],[1+10,12.5+1],'Color','k','LineWidth',2)

% Buff Zone
% 红方回血区 RedRegenerate
plot([RedRegenerate.x,RedRegenerate.x+5.4],[RedRegenerate.y,RedRegenerate.y],'Color','r','LineWidth',2)
plot([RedRegenerate.x,RedRegenerate.x+5.4],[RedRegenerate.y+4.8,RedRegenerate.y+4.8],'Color','r','LineWidth',2)
plot([RedRegenerate.x+5.4,RedRegenerate.x+5.4],[RedRegenerate.y,RedRegenerate.y+4.8],'Color','r','LineWidth',2)
plot([RedRegenerate.x,RedRegenerate.x],[RedRegenerate.y,RedRegenerate.y+4.8],'Color','r','LineWidth',2)
text(RedRegenerate.x+0.25,RedRegenerate.y+2.5,'红方回血区')
% 禁止射击区 ShootFree
plot([ShootFree.x,ShootFree.x+5.4],[ShootFree.y,ShootFree.y],'Color',[0.7,0.7,0.7],'LineWidth',2)
plot([ShootFree.x,ShootFree.x+5.4],[ShootFree.y+4.8,ShootFree.y+4.8],'Color',[0.7,0.7,0.7],'LineWidth',2)
plot([ShootFree.x+5.4,ShootFree.x+5.4],[ShootFree.y,ShootFree.y+4.8],'Color',[0.7,0.7,0.7],'LineWidth',2)
plot([ShootFree.x,ShootFree.x],[ShootFree.y,ShootFree.y+4.8],'Color',[0.7,0.7,0.7],'LineWidth',2)
text(ShootFree.x+0.25,ShootFree.y+2.5,'禁止射击区')
% 蓝方弹药补给区 BlueSupply
plot([BlueSupply.x,BlueSupply.x+5.4],[BlueSupply.y,BlueSupply.y],'Color','b','LineWidth',2)
plot([BlueSupply.x,BlueSupply.x+5.4],[BlueSupply.y+4.8,BlueSupply.y+4.8],'Color','b','LineWidth',2)
plot([BlueSupply.x+5.4,BlueSupply.x+5.4],[BlueSupply.y,BlueSupply.y+4.8],'Color','b','LineWidth',2)
plot([BlueSupply.x,BlueSupply.x],[BlueSupply.y,BlueSupply.y+4.8],'Color','b','LineWidth',2)
text(BlueSupply.x+0.25,BlueSupply.y+2.5,'蓝方弹药补给区')
% 蓝方回血区 BlueRegenerate
plot([BlueRegenerate.x,BlueRegenerate.x+5.4],[BlueRegenerate.y,BlueRegenerate.y],'Color','b','LineWidth',2)
plot([BlueRegenerate.x,BlueRegenerate.x+5.4],[BlueRegenerate.y+4.8,BlueRegenerate.y+4.8],'Color','b','LineWidth',2)
plot([BlueRegenerate.x+5.4,BlueRegenerate.x+5.4],[BlueRegenerate.y,BlueRegenerate.y+4.8],'Color','b','LineWidth',2)
plot([BlueRegenerate.x,BlueRegenerate.x],[BlueRegenerate.y,BlueRegenerate.y+4.8],'Color','b','LineWidth',2)
text(BlueRegenerate.x+0.25,BlueRegenerate.y+2.5,'蓝方回血区')
% 禁止移动区 MoveFree
plot([MoveFree.x,MoveFree.x+5.4],[MoveFree.y,MoveFree.y],'Color','k','LineWidth',2)
plot([MoveFree.x,MoveFree.x+5.4],[MoveFree.y+4.8,MoveFree.y+4.8],'Color','k','LineWidth',2)
plot([MoveFree.x+5.4,MoveFree.x+5.4],[MoveFree.y,MoveFree.y+4.8],'Color','k','LineWidth',2)
plot([MoveFree.x,MoveFree.x],[MoveFree.y,MoveFree.y+4.8],'Color','k','LineWidth',2)
text(MoveFree.x+0.25,MoveFree.y+2.5,'禁止移动区')
% 红方弹药补给区 RedSupply
plot([RedSupply.x,RedSupply.x+5.4],[RedSupply.y,RedSupply.y],'Color','r','LineWidth',2)
plot([RedSupply.x,RedSupply.x+5.4],[RedSupply.y+4.8,RedSupply.y+4.8],'Color','r','LineWidth',2)
plot([RedSupply.x+5.4,RedSupply.x+5.4],[RedSupply.y,RedSupply.y+4.8],'Color','r','LineWidth',2)
plot([RedSupply.x,RedSupply.x],[RedSupply.y,RedSupply.y+4.8],'Color','r','LineWidth',2)
text(RedSupply.x+0.25,RedSupply.y+2.5,'红方弹药补给区')

end
