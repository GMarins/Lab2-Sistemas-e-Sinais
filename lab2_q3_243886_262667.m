%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUESTÃO 3 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a)Obtenha a representação no espaço de estados do sistema da questão 1
%considerando q1(t) = y(t) e q2(t) = y'(t)
%(b) A partir da representação no espaço de estados obtida, implemente um
%diagrama de blocos (com integradores, somadores e outros blocos básicos) e
%simule o sistema de forma a obter as três respostas obtidas no item
%anterior. Use as mesmas condições iniciais e o mesmo sinal de entrada.
%(c) Apresente as respostas obtidas (comparando com as resposta obtidas
%anteiormente) e apresente também o comportamento dos estados do sistema
%para 0<=t<=3.
%Conclusão:
%A representação por espaço de estados é útil na modelagem de sistemas
%reais em que temos acesso às entradas ou saídas de blocos integradores.
%Para um sistema com N blocos integradores, podemos derivar uma equação
%diferencial ou de diferenças de ordem N que o modela.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all

%Representação dos Estados
%q1'(t) = q2(t)
%q2'(t) = y''(t) = -4q2(t) - 25q1(t) + 25x(t)
%q'(t) = A*q(t) + B*x(t)
%y(t) = C*q(t) + D *x(t)
A = [0 1; -25 -4]
B = [0 ; 25]
C = [1 0]
D = [0]

%Simulação do sistema
%Em relação à questão 1, q1(t) é o próprio y(t) e q2(t) é sua derivada.
sim('lab2q3blockdiagram');

fig = figure;
fig.Name = 'Questão 3';
fig.OuterPosition = [0 0 1000 700];

subplot(2,1,1);
hold on;
plot(ynatural.time,ynatural.signals.values);
plot(yforcada.time,yforcada.signals.values)
plot(ycompleta.time,ycompleta.signals.values);
xlabel('t');
ylabel('${ q }_{ 1 }(t)$','Interpreter','LaTex');
title('${ q }_{ 1 }(t)$','Interpreter','LaTex');
legend('Resposta Natural','Resposta Forçada', 'Resposta Completa');

subplot(2,1,2);
hold on;
plot(q2natural.time,q2natural.signals.values);
plot(q2forcada.time,q2forcada.signals.values);
plot(q2completa.time,q2completa.signals.values);
xlabel('t');
ylabel('${ q }_{ 2 }(t)$','Interpreter','LaTex');
title('${ q }_{ 2 }(t)$','Interpreter','LaTex');
legend('Resposta Natural','Resposta Forçada', 'Resposta Completa');

