:- use_module(system_21286604_CassoneGonzalez).

% Requerimiento 1, Constructor
% Meta Primaria: system/2.
% Meta Secundaria: makeSystem/10.
% Dom: Name, System.
system(Name, System):-
    get_time(Timestamp),
    makeSystem( Name, [], [], "", "", "", [], [], Timestamp, System).