:- use_module(system_21286604_CassoneGonzalez).
:- use_module(drive_21286604_CassoneGonzalez).

% Requerimiento 1, Constructor
% Meta Primaria: system/2.
% Meta Secundaria: makeSystem/10.
% Dom: Name, System.
system(Name, System):-
    get_time(Timestamp),
    makeSystem( Name, [], [], "", "", "", [], [], Timestamp, System).

% Requerimiento 2, addDrive
% Meta Primaria: addDrive/5.
% Meta Secundaria: makeDrive/5, makeSystem/10, verificarUnicidad/2, verificarCaracterUnico/1, addDriveInListDrive/3.
% Dom: SystemOld, Letter, Name, Capacity, SystemNew.
systemAddDrive(SystemOld, Letter, Name, Capacity, SystemNew):-
    makeDrive(Name, Letter, [],Capacity, NewDrive),
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    \+ verificarUnicidad(Letter, Drives),
    verificarCaracterUnico(Letter),
    addDriveInListDrive(Drives, NewDrive, NewListDrives),
    makeSystem(NameSystem, Users, NewListDrives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemNew).

% Requerimiento 3, register
% Meta Primaria: register/3.
% Meta Secundaria: makeSystem/10, verificarUnicidadUsuarios/2, addUsuarioInListUsuario/3.
% Dom: SystemOld, Name, SystemNew.
systemRegister(SystemOld, Name, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    \+ verificarUnicidadUsuarios(Name, Users),
    addUsuarioInListUsuario(Users, Name, NewListUsers),
    makeSystem(NameSystem, NewListUsers, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemNew).

% Requerimiento 4, login
% Meta Primaria: login/3.
% Meta Secundaria: makeSystem/10, verificarUnicidadUsuarios/2, esVacio/1.
% Dom: SystemOld, Name, SystemNew.
systemLogin(SystemOld, Name, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    esVacio(CurrentUser),
    verificarUnicidadUsuarios(Name, Users),
    makeSystem(NameSystem, Users, Drives, Name, CurrentDrive, Path, Folders, Trash, Timestamp, SystemNew).

% Requerimiento 5, logout
% Meta Primaria: logout/2.
% Meta Secundaria: makeSystem/10, esVacio/1.
% Dom: SystemOld, SystemNew.
systemLogout(SystemOld, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser),
    makeSystem(NameSystem, Users, Drives, "", CurrentDrive, Path, Folders, Trash, Timestamp, SystemNew).