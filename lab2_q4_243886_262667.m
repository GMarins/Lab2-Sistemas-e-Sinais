%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUEST�O 4 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Considere um sistema de segunda ordem representado pela seguinte equa��o de diferen�as:
% y[n] - 0.81y[n - 2] = 5x[n - 1] ? 3.5x[n - 2]
%(a) Calcule a resposta ntural do sistema, considerando as condi��es
%iniciais y[-1] = -8 e y[-2] = -2
%(b) Calcule a resposta for�ada do sistema, para um sinal de entrada 
%x[n] = u[n]
%(c) Utilizando um arquivo lote apresente, em uma mesma figura, os gr�ficos
%da resposta natural, for�ada e completa. Considere 0<=n<=60 amostras
%(d) Implemente em um arquivo simulink a equa��o de diferen�as obtida
%Conclus�o: O uso do simulink permite a visualiza��o direta do sistema
%discreto. Sua implementa��o � intuitiva e f�cil e, como pudemos ver,
%apresentou a mesma resposta que o desenvolvimento anal�tico, validando a
%resolu��o. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc 
%%
tic

n = 0:1:60;

%Resposta Natural, considerando entradas zeradas
yn = -4.41*(0.9).^n + 2.79*(-0.9).^n;

%Resposta For�ada, considerando condi��es iniciais zeradas, v�lida pra n>=0
yf = 7.8947 - 5.5555*(0.9).^n - 2.3392*(-0.9).^n;

%Resposta Completa
yc = yn + yf;

%Simula��o do modelo em Simulink
%Para a simula��o da resposta completa, foi necess�rio computar yc[0] e
%yc[1], visto que o sistema � simulado para n > 0 e, portanto, n�o era
%v�lido alimentar a simula��o com os dados de y[-2] ou y[-1]
sim('lab2q4blockdiagram');

%%
fig = figure
fig.Name = 'Quest�o 4';
fig.OuterPosition = [0 0 1000 700];

subplot(1,3,1);
stem(n,yn);
xlabel('n');
ylabel('${ y }_{ n }[n]$','Interpreter','LaTex');
title('Resposta Natural');
grid on;
axis([0 60 -7 1])


subplot(1,3,2);
stem(n,yf);
xlabel('n');
ylabel('${ y }_{ f }[n]$','Interpreter','LaTex');
title('Resposta For�ada');
grid on;
axis([0 60 0 8.1])

subplot(1,3,3);
stem(n,yc);
xlabel('n');
ylabel('${ y }_{ c }[n]$','Interpreter','LaTex');
title('Resposta Completa');
grid on;
axis([0 60 -2 8.1])
%%
fig = figure
fig.Name = 'Quest�o 4 - Simulink';
fig.OuterPosition = [0 0 1000 700];

subplot(1,3,1);
stem(n,ynatural.signals.values);
xlabel('n');
ylabel('${ y }_{ n }[n]$','Interpreter','LaTex');
title('Resposta Natural - Simulink');
grid on;
axis([0 60 -7 1])


subplot(1,3,2);
stem(n,yforcada.signals.values);
xlabel('n');
ylabel('${ y }_{ f }[n]$','Interpreter','LaTex');
title('Resposta For�ada - Simulink');
grid on;
axis([0 60 0 8.1])

subplot(1,3,3);
stem(n,yc);
xlabel('n');
ylabel('${ y }_{ c }[n]$','Interpreter','LaTex');
title('Resposta Completa - Simulink');
grid on;
axis([0 60 -2 8.1])
%%
toc