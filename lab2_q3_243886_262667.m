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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all

%Representa��o dos Estados
A = [0 1; -25 -4]
B = [0 ; 25]
C = [1 0]
D = [0]
