%Author: Sebastian Mansilla Cots
%Date: 18/05/2026
%Project: Analizador de destinos turisticos
%Purpose of the project: Analizar cual es el destino ideal para una
% persona basandose en dos atributos, Clima y presupuesto.

% Hechos (Destino, Clima, Presupuesto)
destino(cancun, calido, alto).
destino(paris, templado, alto).
destino(vancouver, frio, alto).
destino(tokio, templado, medio).
destino(bogota, calido, medio).
destino(buenosAires, frio, medio).
destino(islaMujeres, calido, bajo).
destino(yucatan, calido, bajo).
destino(madrid, templado, bajo).

% REGLAS: Evaluar por union logica
recomendar(Clima, Presupuesto, Destino):-
    destino(Destino, Clima, Presupuesto).