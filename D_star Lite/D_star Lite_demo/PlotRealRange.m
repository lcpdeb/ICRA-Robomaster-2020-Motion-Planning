function PlotRealRange(RedRegenerate, RedSupply, BlueRegenerate, BlueSupply, ShootFree, MoveFree)
global accuracy;
%% real range
% ������ ��
plot([0*10/accuracy+1,10*10/accuracy+1],[0*10/accuracy+1,0*10/accuracy+1],'Color','r','LineWidth',2)
plot([0*10/accuracy+1,10*10/accuracy+1],[10*10/accuracy+1,10*10/accuracy+1],'Color','r','LineWidth',2)
plot([10*10/accuracy+1,10*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','r','LineWidth',2)
plot([0*10/accuracy+1,0*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','r','LineWidth',2)

plot([0*10/accuracy+1,10*10/accuracy+1],[41*10/accuracy+1,41*10/accuracy+1],'Color','r','LineWidth',2)
plot([0*10/accuracy+1,10*10/accuracy+1],[51*10/accuracy+1,51*10/accuracy+1],'Color','r','LineWidth',2)
plot([10*10/accuracy+1,10*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','r','LineWidth',2)
plot([0*10/accuracy+1,0*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','r','LineWidth',2)
% ������ ��
plot([71*10/accuracy+1,81*10/accuracy+1],[41*10/accuracy+1,41*10/accuracy+1],'Color','b','LineWidth',2)
plot([71*10/accuracy+1,81*10/accuracy+1],[51*10/accuracy+1,51*10/accuracy+1],'Color','b','LineWidth',2)
plot([81*10/accuracy+1,81*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','b','LineWidth',2)
plot([71*10/accuracy+1,71*10/accuracy+1],[41*10/accuracy+1,51*10/accuracy+1],'Color','b','LineWidth',2)

plot([71*10/accuracy+1,81*10/accuracy+1],[0*10/accuracy+1,0*10/accuracy+1],'Color','b','LineWidth',2)
plot([71*10/accuracy+1,81*10/accuracy+1],[10*10/accuracy+1,10*10/accuracy+1],'Color','b','LineWidth',2)
plot([81*10/accuracy+1,81*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','b','LineWidth',2)
plot([71*10/accuracy+1,71*10/accuracy+1],[0*10/accuracy+1,10*10/accuracy+1],'Color','b','LineWidth',2)
% �ϰ���
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
% �췽��Ѫ�� RedRegenerate
plot([RedRegenerate.x,RedRegenerate.x+5.4*10/accuracy],[RedRegenerate.y,RedRegenerate.y],'Color','r','LineWidth',2)
plot([RedRegenerate.x,RedRegenerate.x+5.4*10/accuracy],[RedRegenerate.y+4.8*10/accuracy,RedRegenerate.y+4.8*10/accuracy],'Color','r','LineWidth',2)
plot([RedRegenerate.x+5.4*10/accuracy,RedRegenerate.x+5.4*10/accuracy],[RedRegenerate.y,RedRegenerate.y+4.8*10/accuracy],'Color','r','LineWidth',2)
plot([RedRegenerate.x,RedRegenerate.x],[RedRegenerate.y,RedRegenerate.y+4.8*10/accuracy],'Color','r','LineWidth',2)
text(RedRegenerate.x+0.25,RedRegenerate.y+2.5,'�췽��Ѫ��')
% ��ֹ����� ShootFree
plot([ShootFree.x,ShootFree.x+5.4*10/accuracy],[ShootFree.y,ShootFree.y],'Color',[0.7,0.7,0.7],'LineWidth',2)
plot([ShootFree.x,ShootFree.x+5.4*10/accuracy],[ShootFree.y+4.8*10/accuracy,ShootFree.y+4.8*10/accuracy],'Color',[0.7,0.7,0.7],'LineWidth',2)
plot([ShootFree.x+5.4*10/accuracy,ShootFree.x+5.4*10/accuracy],[ShootFree.y,ShootFree.y+4.8*10/accuracy],'Color',[0.7,0.7,0.7],'LineWidth',2)
plot([ShootFree.x,ShootFree.x],[ShootFree.y,ShootFree.y+4.8*10/accuracy],'Color',[0.7,0.7,0.7],'LineWidth',2)
text(ShootFree.x+0.25,ShootFree.y+2.5,'��ֹ�����')
% ������ҩ������ BlueSupply
plot([BlueSupply.x,BlueSupply.x+5.4*10/accuracy],[BlueSupply.y,BlueSupply.y],'Color','b','LineWidth',2)
plot([BlueSupply.x,BlueSupply.x+5.4*10/accuracy],[BlueSupply.y+4.8*10/accuracy,BlueSupply.y+4.8*10/accuracy],'Color','b','LineWidth',2)
plot([BlueSupply.x+5.4*10/accuracy,BlueSupply.x+5.4*10/accuracy],[BlueSupply.y,BlueSupply.y+4.8*10/accuracy],'Color','b','LineWidth',2)
plot([BlueSupply.x,BlueSupply.x],[BlueSupply.y,BlueSupply.y+4.8*10/accuracy],'Color','b','LineWidth',2)
text(BlueSupply.x+0.25,BlueSupply.y+2.5,'������ҩ������')
% ������Ѫ�� BlueRegenerate
plot([BlueRegenerate.x,BlueRegenerate.x+5.4*10/accuracy],[BlueRegenerate.y,BlueRegenerate.y],'Color','b','LineWidth',2)
plot([BlueRegenerate.x,BlueRegenerate.x+5.4*10/accuracy],[BlueRegenerate.y+4.8*10/accuracy,BlueRegenerate.y+4.8*10/accuracy],'Color','b','LineWidth',2)
plot([BlueRegenerate.x+5.4*10/accuracy,BlueRegenerate.x+5.4*10/accuracy],[BlueRegenerate.y,BlueRegenerate.y+4.8*10/accuracy],'Color','b','LineWidth',2)
plot([BlueRegenerate.x,BlueRegenerate.x],[BlueRegenerate.y,BlueRegenerate.y+4.8*10/accuracy],'Color','b','LineWidth',2)
text(BlueRegenerate.x+0.25,BlueRegenerate.y+2.5,'������Ѫ��')
% ��ֹ�ƶ��� MoveFree
plot([MoveFree.x,MoveFree.x+5.4*10/accuracy],[MoveFree.y,MoveFree.y],'Color','k','LineWidth',2)
plot([MoveFree.x,MoveFree.x+5.4*10/accuracy],[MoveFree.y+4.8*10/accuracy,MoveFree.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([MoveFree.x+5.4*10/accuracy,MoveFree.x+5.4*10/accuracy],[MoveFree.y,MoveFree.y+4.8*10/accuracy],'Color','k','LineWidth',2)
plot([MoveFree.x,MoveFree.x],[MoveFree.y,MoveFree.y+4.8*10/accuracy],'Color','k','LineWidth',2)
text(MoveFree.x+0.25,MoveFree.y+2.5,'��ֹ�ƶ���')
% �췽��ҩ������ RedSupply
plot([RedSupply.x,RedSupply.x+5.4*10/accuracy],[RedSupply.y,RedSupply.y],'Color','r','LineWidth',2)
plot([RedSupply.x,RedSupply.x+5.4*10/accuracy],[RedSupply.y+4.8*10/accuracy,RedSupply.y+4.8*10/accuracy],'Color','r','LineWidth',2)
plot([RedSupply.x+5.4*10/accuracy,RedSupply.x+5.4*10/accuracy],[RedSupply.y,RedSupply.y+4.8*10/accuracy],'Color','r','LineWidth',2)
plot([RedSupply.x,RedSupply.x],[RedSupply.y,RedSupply.y+4.8*10/accuracy],'Color','r','LineWidth',2)
text(RedSupply.x+0.25,RedSupply.y+2.5,'�췽��ҩ������')

end
