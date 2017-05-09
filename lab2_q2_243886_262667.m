%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUESTÃO 2 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Obtenha a resposta ao impulso do sistema (1), através do cálculo da derivada da resposta ao
% degrau unitário, considerando condições iniciais nulas. Apresente tanto a resposta forçada
% quanto a reposta impulsiva em uma figura.
%Avalie se o sistema é BIBO estável, sua causalidade e se o sistema tem
%memória
%Conclusão:
%Através da análise da resposta do sistema ao impulso, podemos avaliar os
%aspectos do sistema de forma direta. Podemos avaliar que o sistema é BIBO
%estável por se tratar de uma senóide amortecida e, portanto, ter integral
%limitada (seu valor é menor que infinito). 
%Avaliamos também que o sistema tém memória, visto que seu formato é
%diferente de uma função impulso e h(t) é diferente de 0 para t's maiores
%do que 0. Por fim, avaliamos que o sistema é causal, pois seus valores são
%0 para todo t menor que 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
tic
%%
t = 0:0.0001:3;
%Sabemos que a resposta ao impulso é igual à derivada da resposta ao degrau
%unitário.
%Já sabemos a resposta do sistema ao degrau unitário (calculada na questão
%anterior)
s = 1 - exp(-2*t).*cos(sqrt(21)*t) - 2/sqrt(21)*exp(-2*t).*sin(sqrt(21)*t);  %Para todo t > 0
h = exp(-2*t)*sqrt(21).*sin(sqrt(21)*t) + 4/sqrt(21).*exp(-2*t).*sin(sqrt(21)*t); %Para todo t> 0, 0 c.c

%%
fig = figure
fig.Name = 'Questão 2';
fig.OuterPosition = [0 0 800 600];
plot(t,s,t,h);
xlabel('t');
legend('s(t)','h(t)');
grid on

%%
toc