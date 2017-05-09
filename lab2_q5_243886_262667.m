%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%LAB 2 - QUEST�O 5 %%%%%%%%%%%%%%%%
%Gabriel Marins da Costa - 243886
%Arthur Koucher - 262667
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a) Obtenha a resposta ao impulso do sistema da quest�o anterior, considerando que a mesma � obtida utilizando
%como sinal de entrada x[n] = u[n] - u[n-1] e considerando condi��es
%iniciais nulas. Avalie tanto a resposta for�aca quanto a resposta
%impulsiva em uma figura
%(b) A partir da resposta ao impulso obtida, avalie se o sistema � BIBO, se
%� causal e se tem mem�ria
%Conclus�o: O uso da ferramenta num�rico torna muito mais f�cil o
%c�lculo da resposta ao impulso atrav�s da resposta ao degrau do que o
%c�lculo simb�lico. Atrav�s da resposta ao impulso podemos avaliar
%diretamente algumas caracter�sticas do sistema. Avaliamos, por exemplo,
%que o sistema � causal por h[n] = 0 para todo n < 0; avaliamos que o
%sistema tem mem�ria pois h[n] � diferente da fun��o impulso (delta de
%dirac); por fim, avaliamos tamb�m que o sistema � BIBO est�vel, devido ao
%fato de que h[n] tende a 0 quando n tende a +infinito.

clear all
tic
n = 0:1:60;

%Resposta ao degrau unit�rio, obtida na �ltima quest�o
yf = 7.8947 - 5.5555*(0.9).^n - 2.3392*(-0.9).^n; %multiplicado pela fun��o degrau , v�lido para n >= 0
%Como o sistema � LTI, sabemos que combina��es lineares de sinais na
%entrada geram uma sa�da correspondente a essas combina��es lineares dos
%resposta aos sinais originais
%Ou seja h[n] = yf[n] - yf[n-1]

%Para evitar problemas no dom�nio da fun��o ao transformar a vari�vel 'n'
%em 'n-1' na linha 18, vamos utilizar a fun��o circshift, que realiza o
%deslocamento
yfdeslocado = circshift(yf',1)';
yfdeslocado(1) = 0; %corre��o do res�duo no primeiro componente

h = yf - yfdeslocado;
fig = figure
fig.Name = 'Quest�o 5a';
fig.OuterPosition = [0 0 1000 700];

hold on;
stem(n,yf);
stem(n,h);
grid on;
xlabel('n');
ylabel('y[n]');
legend('Resposta ao Degrau','Resposta ao Impulso');

%Al�m de poder avalair graficamente a BIBO estabilidade de h[n], vamos
%avaliar tamb�m atrav�s da defini��o utilizando o somat�rio
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

%Atrav�s do resultado podemos ver que a fun��o � limitada e seu somat�rio
%converge para um valor. Logo, o sistema � BIBO est�vel.

toc