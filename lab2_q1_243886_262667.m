%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUESTÃO 1 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Considere um sistema de segunda ordem representado pela seguinte equa¸c˜ao diferencial:
% y''+4y'+25y=25x
% 1)
% (a) Calcule a resposta natural do sistema (com coeficientes reais), considerando as condições
% iniciais y(0)=1 , y'(0)=3
% (b) Calcule a resposta for¸cada do sistema (com coeficientes reais), para um sinal de entrada x(t) = u(t)
% (c)Utilizando um arquivo lote (.m) apresente, em uma mesma figura, os gráficos da resposta
% natural, resposta forçada e resposta completa para 0<=t<=3
% (d)Implemente em um arquivo simulink a equaçao diferencial (1) usando blocos somadores,
% integradores e outros blocos básicos, e simule as trˆes respostas calculadas anteriormente
% (natural, forçada e completa). Compare com o resultado obtido nos itens anteriores.
%Conclusão:
%Plotando os gráficos de cada uma das resposta podemos adquirir uma boa
%intuição do funcionamento dos sistemas. Podemos avaliar o impacto das
%condições iniciais e da excitação externa na formação da resposta
%completa. O uso do simulink se mostra bem mais prático que a resolução
%manual das EDOs, além de possibilitar a visualização do sistema na forma
%de blocos - linguagem esta utilizada também em controladores industriais.
%Alterando as condições iniciais dos blocos integradores pudemos
%simular cada uma das respostas separadamente.
%Por fim, pudemos validar a resposta obtida analiticamente através do
%simulink através da simulação que nos retornou os mesmos gráficos.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
clear all
%Vetor de tempo
t = 0:0.0001:3;

%Resposta Natural
%Foi resolvida através das raízes da equação característica. Tendo as
%raízes e o formato da resolução, foram substituídas as condições iniciais
yn = exp(-2*t).*cos(sqrt(21)*t) + 5.*sqrt(21)/21*exp(-2*t).*sin(sqrt(21)*t);

%Resposta Forçada, válida para t > 0
%Foi resolvida utilizando a mesma forma de resposta que a resposta natural.
%Para resolver a equação para a entrada específica x(t) = u(t) utilizamos
%uma solução particular yp(t) com o mesmo formato - nesse caso uma
%constante
%Para a resposta forçada, as condições iniciais são zeradas
yf = 1 - exp(-2*t).*cos(sqrt(21)*t) - 2/sqrt(21)*exp(-2*t).*sin(sqrt(21)*t); 

%Por fim, a resposta completa é a soma das duas
yc = yf + yn;

%%
%Comparado com o obtido no Simulink
%Scope 2 - Resposta Natural
%Scope 1 - Resposta Forçada
%Scope - Resposta Completa

simOut = sim('lab2q1blockdiagram');


%%
fig = figure
fig.Name = 'Questão 1';
fig.OuterPosition = [0 0 1000 700];

subplot(1,3,1);
plot(t,yn);
xlabel('t');
ylabel('${ y }_{ n }(t)$','Interpreter','LaTex');
title('Resposta Natural');
grid on;
axis([0 3 -.5 1.5])


subplot(1,3,2);
plot(t,yf);
xlabel('t');
ylabel('${ y }_{ f }(t)$','Interpreter','LaTex');
title('Resposta Forçada');
grid on;
axis([0 3 -.5 1.5])

subplot(1,3,3);
plot(t,yc);
xlabel('t');
ylabel('${ y }_{ c }(t)$','Interpreter','LaTex');
title('Resposta Completa');
grid on;
axis([0 3 -.5 1.5])

%%
toc