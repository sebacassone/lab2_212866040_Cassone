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
systemRegister(SystemOld, Name, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    \+ verificarUnicidadUsuarios(Name, Users),
    addUsuarioInListUsuario(Users, Name, NewListUsers),
    makeSystem(NameSystem, NewListUsers, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemNew).