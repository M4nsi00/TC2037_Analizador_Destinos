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


pruebas :-
    forall(recomendar(calido, alto, D1), writeln(D1)),
    forall(recomendar(templado, alto, D2), writeln(D2)),
    forall(recomendar(frio, alto, D3), writeln(D3)),
    forall(recomendar(templado, medio, D4), writeln(D4)),
    forall(recomendar(calido, medio, D5), writeln(D5)),
    forall(recomendar(frio, medio, D6), writeln(D6)),
    forall(recomendar(calido, bajo, D7), writeln(D7)),
    forall(recomendar(templado, bajo, D8), writeln(D8)),
    forall(recomendar(calido, alto, D9), writeln(D9)),
    forall(recomendar(templado, alto, D10), writeln(D10)),
    forall(recomendar(frio, alto, D11), writeln(D11)),
    forall(recomendar(templado, medio, D12), writeln(D12)),
    (recomendar(frio, bajo, _) -> true ; writeln(false)),
    (recomendar(calido, inexistente, _) -> true ; writeln(false)),
    (recomendar(templado, inexistente, _) -> true ; writeln(false)),
    (recomendar(frio, inexistente, _) -> true ; writeln(false)),
    (recomendar(lluvioso, alto, _) -> true ; writeln(false)),
    (recomendar(nevado, bajo, _) -> true ; writeln(false)),
    (recomendar(templado, extremo, _) -> true ; writeln(false)),
    (recomendar(helado, medio, _) -> true ; writeln(false)).