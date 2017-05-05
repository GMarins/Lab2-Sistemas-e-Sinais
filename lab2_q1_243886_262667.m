%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUEST�O 1 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Considere um sistema de segunda ordem representado pela seguinte equa�c�ao diferencial:
% y''+4y'+25y=25x
% 1)
% (a) Calcule a resposta natural do sistema (com coeficientes reais), considerando as condi��es
% iniciais y(0)=1 , y'(0)=3
% (b) Calcule a resposta for�cada do sistema (com coeficientes reais), para um sinal de entrada x(t) = u(t)
% (c)Utilizando um arquivo lote (.m) apresente, em uma mesma figura, os gr�ficos da resposta
% natural, resposta for�ada e resposta completa para 0<=t<=3
% (d)Implemente em um arquivo simulink a equa�ao diferencial (1) usando blocos somadores,
% integradores e outros blocos b�sicos, e simule as tr�es respostas calculadas anteriormente
% (natural, for�ada e completa). Compare com o resultado obtido nos itens anteriores.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
%Vetor de tempo
t = 0:0.0001:3;

%Resposta Natural
%Foi resolvida atrav�s das ra�zes da equa��o caracter�stica. Tendo as
%ra�zes e o formato da resolu��o, foram substitu�das as condi��es iniciais
yn = exp(-2*t).*cos(sqrt(21)*t) + 5.*sqrt(21)/21*exp(-2*t).*sin(sqrt(21)*t);

%Resposta For�ada, v�lida para t > 0
%Foi resolvida utilizando a mesma forma de resposta que a resposta natural.
%Para resolver a equa��o para a entrada espec�fica x(t) = u(t) utilizamos
%uma solu��o particular yp(t) com o mesmo formato - nesse caso uma
%constante
%Para a resposta for�ada, as condi��es iniciais s�o zeradas
yf = 1 - exp(-2*t).*cos(sqrt(21)*t) - 2/sqrt(21)*exp(-2*t).*sin(sqrt(21)*t); 

%Por fim, a resposta completa � a soma das duas
yc = yf + yn;

fig = figure
fig.Name = 'Quest�o 1';
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
title('Resposta For�ada');
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