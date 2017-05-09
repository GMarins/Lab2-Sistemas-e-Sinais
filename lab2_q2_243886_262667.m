%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUEST�O 2 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Obtenha a resposta ao impulso do sistema (1), atrav�s do c�lculo da derivada da resposta ao
% degrau unit�rio, considerando condi��es iniciais nulas. Apresente tanto a resposta for�ada
% quanto a reposta impulsiva em uma figura.
%Avalie se o sistema � BIBO est�vel, sua causalidade e se o sistema tem
%mem�ria
%Conclus�o:
%Atrav�s da an�lise da resposta do sistema ao impulso, podemos avaliar os
%aspectos do sistema de forma direta. Podemos avaliar que o sistema � BIBO
%est�vel por se tratar de uma sen�ide amortecida e, portanto, ter integral
%limitada (seu valor � menor que infinito). 
%Avaliamos tamb�m que o sistema t�m mem�ria, visto que seu formato �
%diferente de uma fun��o impulso e h(t) � diferente de 0 para t's maiores
%do que 0. Por fim, avaliamos que o sistema � causal, pois seus valores s�o
%0 para todo t menor que 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
tic
%%
t = 0:0.0001:3;
%Sabemos que a resposta ao impulso � igual � derivada da resposta ao degrau
%unit�rio.
%J� sabemos a resposta do sistema ao degrau unit�rio (calculada na quest�o
%anterior)
s = 1 - exp(-2*t).*cos(sqrt(21)*t) - 2/sqrt(21)*exp(-2*t).*sin(sqrt(21)*t);  %Para todo t > 0
h = exp(-2*t)*sqrt(21).*sin(sqrt(21)*t) + 4/sqrt(21).*exp(-2*t).*sin(sqrt(21)*t); %Para todo t> 0, 0 c.c

%%
fig = figure
fig.Name = 'Quest�o 2';
fig.OuterPosition = [0 0 800 600];
plot(t,s,t,h);
xlabel('t');
legend('s(t)','h(t)');
grid on

%%
toc