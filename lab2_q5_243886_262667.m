%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUESTÃO 5 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a) Obtenha a resposta ao impulso do sistema da questão anterior, considerando que a mesma é obtida utilizando
%como sinal de entrada x[n] = u[n] - u[n-1] e considerando condições
%iniciais nulas. Avalie tanto a resposta forçaca quanto a resposta
%impulsiva em uma figura
%(b) A partir da resposta ao impulso obtida, avalie se o sistema é BIBO, se
%é causal e se tem memória
%Conclusão: O uso da ferramenta numérico torna muito mais fácil o
%cálculo da resposta ao impulso através da resposta ao degrau do que o
%cálculo simbólico. Através da resposta ao impulso podemos avaliar
%diretamente algumas características do sistema. Avaliamos, por exemplo,
%que o sistema é causal por h[n] = 0 para todo n < 0; avaliamos que o
%sistema tem memória pois h[n] é diferente da função impulso (delta de
%dirac); por fim, avaliamos também que o sistema é BIBO estável, devido ao
%fato de que h[n] tende a 0 quando n tende a +infinito.

clear all
tic
n = 0:1:60;

%Resposta ao degrau unitário, obtida na última questão
yf = 7.8947 - 5.5555*(0.9).^n - 2.3392*(-0.9).^n; %multiplicado pela função degrau , válido para n >= 0
%Como o sistema é LTI, sabemos que combinações lineares de sinais na
%entrada geram uma saída correspondente a essas combinações lineares dos
%resposta aos sinais originais
%Ou seja h[n] = yf[n] - yf[n-1]

%Para evitar problemas no domínio da função ao transformar a variável 'n'
%em 'n-1' na linha 18, vamos utilizar a função circshift, que realiza o
%deslocamento
yfdeslocado = circshift(yf',1)';
yfdeslocado(1) = 0; %correção do resíduo no primeiro componente

h = yf - yfdeslocado;
fig = figure
fig.Name = 'Questão 5a';
fig.OuterPosition = [0 0 1000 700];

hold on;
stem(n,yf);
stem(n,h);
grid on;
xlabel('n');
ylabel('y[n]');
legend('Resposta ao Degrau','Resposta ao Impulso');

%Além de poder avalair graficamente a BIBO estabilidade de h[n], vamos
%avaliar também através da definição utilizando o somatório
%Consideramos apenas para n > 0, visto que h[n] = 0 para todo n < 0

n = 0:1:1e6;
yf = 7.8947 - 5.5555*(0.9).^n - 2.3392*(-0.9).^n;
yfdeslocado = circshift(yf',1)';
yfdeslocado(1) = 0;
h = yf - yfdeslocado;

somatorio1 = sum(h)

n = 0:1:1e7;
yf = 7.8947 - 5.5555*(0.9).^n - 2.3392*(-0.9).^n;
yfdeslocado = circshift(yf',1)';
yfdeslocado(1) = 0;
h = yf - yfdeslocado;
somatorio2 = sum(h)

%Através do resultado podemos ver que a função é limitada e seu somatório
%converge para um valor. Logo, o sistema é BIBO estável.

toc