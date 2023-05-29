:- use_module(system_21286604_CassoneGonzalez).

% Requerimiento 1, Constructor
% Meta Primaria: system/2.
% Meta Secundaria: makeSystem/9.
% Dom: Name, System.
system(Name, System):-
    makeSystem( Name, [], [], "", "", "", [], [], System).