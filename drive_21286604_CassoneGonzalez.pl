:- module(drive_21286604_CassoneGonzalez, [makeDrive/5, verificarUnicidad/2, addDriveInListDrive/3, verificarCaracterUnico/1, getDrive/3]).

% TDA Drive = Name x Letter x Capacity.

% Constructores

% Crear un drive
% Meta Primaria: makeDrive/5
% Dom: Name x Letter x Folders x Capacity x Drive
makeDrive(Name, Letter, Folders, Capacity, [Name, Letter, Folders, Capacity]).

% Selectores

% Obtener un drive de una lista de drive según su letra
% Meta Primaria: getDrive/3
% Dom: Letter x Drives x Drive
% Caso Base
getDrive(Letter, [Primero|_], [Name, Letter, Folders, Capacity]):-
    member(Letter, Primero),
    nth0(0, Primero, Name),
    nth0(1, Primero, Letter),
    nth0(2, Primero, Folders),
    nth0(3, Primero, Capacity), !.

% Caso Recursivo
getDrive(Letter, [_|Drives], Drive):-
    getDrive(Letter, Drives, Drive).

% Modificadores

% Agregar un drive a una lista de drives
% Meta Primaria: addDriveInListDrive/3
% Dom: Drive x ListDrive x NewListDrive
addDriveInListDrive(Drive, ListDrive, NewListDrive):-
    append(Drive, [ListDrive], NewListDrive).


% Pertenencia

% Verificar que la letra sea única
% Meta Primaria: verificarUnicidad/2
% Dom: Letter x Drives
verificarUnicidad(Letter, Drives):-
    member([_, Letter, _, _], Drives).

% Verificar que la letra sea un caracter único
% Meta Primaria: verificarCaracterUnico/1
% Dom: Letter
verificarCaracterUnico(Letter):-
    atom_length(Letter, 1).


% Otras Operaciones