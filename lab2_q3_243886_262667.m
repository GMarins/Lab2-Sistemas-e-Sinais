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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all

%Representação dos Estados
A = [0 1; -25 -4]
B = [0 ; 25]
C = [1 0]
D = [0]
