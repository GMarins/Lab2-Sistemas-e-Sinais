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
clc
tic
n = 0:1:60;

%Resposta ao degrau unit�rio, obtida na �ltima quest�o
yf = 7.8947 - 5.5555*(0.9).^n - 2.3392*(-0.9).^n; %multiplicado pela fun��o degrau , v�lido para n >= 0
%Como o sistema � LTI, sabemos que opera��es lineares nos sinais da entrada
%geram opera��es semelhantess na sa�da.
%Ou seja h[n] = yf[n] - yf[n-1]

%Iremos computar h[n] atrav�s da fun��o diff, que calcula as diferen�as
%num�ricas entre cada elemento
h = diff(yf);
h = [0 h]; %Adicionamos o zero como primeiro elemento para manter a coer�ncia com a fun��o degrau


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
h = diff(yf);
h = [0 h];

somatorio1 = sum(h)

n = 0:1:1e7;
yf = 7.8947 - 5.5555*(0.9).^n - 2.3392*(-0.9).^n;
h = diff(yf);
h = [0 h];
somatorio2 = sum(h)

%Atrav�s do resultado podemos ver que a fun��o � limitada e seu somat�rio
%converge para um valor. Logo, o sistema � BIBO est�vel.

toc