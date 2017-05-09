%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUEST�O 3 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a)Obtenha a representa��o no espa�o de estados do sistema da quest�o 1
%considerando q1(t) = y(t) e q2(t) = y'(t)
%(b) A partir da representa��o no espa�o de estados obtida, implemente um
%diagrama de blocos (com integradores, somadores e outros blocos b�sicos) e
%simule o sistema de forma a obter as tr�s respostas obtidas no item
%anterior. Use as mesmas condi��es iniciais e o mesmo sinal de entrada.
%(c) Apresente as respostas obtidas (comparando com as resposta obtidas
%anteiormente) e apresente tamb�m o comportamento dos estados do sistema
%para 0<=t<=3.
%Conclus�o:
%A representa��o por espa�o de estados � �til na modelagem de sistemas
%reais em que temos acesso �s entradas ou sa�das de blocos integradores.
%Para um sistema com N blocos integradores, podemos derivar uma equa��o
%diferencial ou de diferen�as de ordem N que o modela.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all

%Representa��o dos Estados
%q1'(t) = q2(t)
%q2'(t) = y''(t) = -4q2(t) - 25q1(t) + 25x(t)
%q'(t) = A*q(t) + B*x(t)
%y(t) = C*q(t) + D *x(t)
A = [0 1; -25 -4]
B = [0 ; 25]
C = [1 0]
D = [0]

%Simula��o do sistema
%Em rela��o � quest�o 1, q1(t) � o pr�prio y(t) e q2(t) � sua derivada.
sim('lab2q3blockdiagram');

fig = figure;
fig.Name = 'Quest�o 3';
fig.OuterPosition = [0 0 1000 700];

subplot(2,1,1);
hold on;
plot(ynatural.time,ynatural.signals.values);
plot(yforcada.time,yforcada.signals.values)
plot(ycompleta.time,ycompleta.signals.values);
xlabel('t');
ylabel('${ q }_{ 1 }(t)$','Interpreter','LaTex');
title('${ q }_{ 1 }(t)$','Interpreter','LaTex');
legend('Resposta Natural','Resposta For�ada', 'Resposta Completa');

subplot(2,1,2);
hold on;
plot(q2natural.time,q2natural.signals.values);
plot(q2forcada.time,q2forcada.signals.values);
plot(q2completa.time,q2completa.signals.values);
xlabel('t');
ylabel('${ q }_{ 2 }(t)$','Interpreter','LaTex');
title('${ q }_{ 2 }(t)$','Interpreter','LaTex');
legend('Resposta Natural','Resposta For�ada', 'Resposta Completa');

