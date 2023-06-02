:- use_module(system_21286604_CassoneGonzalez).
:- use_module(drive_21286604_CassoneGonzalez).
:- use_module(folder_21286604_CassoneGonzalez).

% Requerimiento 2, Constructor
% Meta Primaria: system/2.
% Meta Secundaria: makeSystem/10.
% Dom: Name, System.
system(Name, System):-
    get_time(Timestamp),
    makeSystem( Name, [], [], "", "", "/", [], [], Timestamp, System).

% Requerimiento 3, addDrive
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

% Requerimiento 4, register
% Meta Primaria: register/3.
% Meta Secundaria: makeSystem/10, verificarUnicidadUsuarios/2, addUsuarioInListUsuario/3.
% Dom: SystemOld, Name, SystemNew.
systemRegister(SystemOld, Name, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    \+ verificarUnicidadUsuarios(Name, Users),
    addUsuarioInListUsuario(Users, Name, NewListUsers),
    makeSystem(NameSystem, NewListUsers, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemNew).

% Requerimiento 5, login
% Meta Primaria: login/3.
% Meta Secundaria: makeSystem/10, verificarUnicidadUsuarios/2, esVacio/1.
% Dom: SystemOld, Name, SystemNew.
systemLogin(SystemOld, Name, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    esVacio(CurrentUser),
    verificarUnicidadUsuarios(Name, Users),
    makeSystem(NameSystem, Users, Drives, Name, CurrentDrive, Path, Folders, Trash, Timestamp, SystemNew).

% Requerimiento 6, logout
% Meta Primaria: logout/2.
% Meta Secundaria: makeSystem/10, esVacio/1.
% Dom: SystemOld, SystemNew.
systemLogout(SystemOld, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser),
    makeSystem(NameSystem, Users, Drives, "", CurrentDrive, Path, Folders, Trash, Timestamp, SystemNew).

% Requerimiento 7, switchDrive
% Meta Primaria: switchDrive/3.
% Meta Secundaria: makeSystem/10, verificarUnicidad/2, verificarCaracterUnico/1.
% Dom: SystemOld, Letter, SystemNew.
systemSwitchDrive(SystemOld, Letter, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, _, Path, _, Trash, Timestamp, SystemOld),
    verificarUnicidad(Letter, Drives), % Significa que la letra existe en la lista de Drives
    verificarCaracterUnico(Letter),
    getDrive(Letter, Drives, Drive),
    makeDrive(_, _, FoldersDrive, _, Drive),
    makeSystem(NameSystem, Users, Drives, CurrentUser, Letter, Path, FoldersDrive, Trash, Timestamp, SystemNew).

% Requerimineto 8
% Metra primaria: mkdir/3.
% Meta secundaria: makeSystem/10, verificarUnicidad/2, verificarCaracterUnico/1, addFolderInListFolder/3.
% Dom: SystemOld, Name, SystemNew.
systemMkdir(SystemOld, Name, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado
    makeFolder(Name, "", "", CurrentUser, Path, NewFolder), % Se crea la carpeta
    verificarUnicidadFolders(NewFolder, Folders), % Se verifica que la carpeta que se crea sea única dentro del mismo path
    addFolderInListFolder(Folders, NewFolder, NewListFolders), % Se agrega la carpeta a la lista de carpetas en el actual Drive
    getDrive(CurrentDrive, Drives, Drive), % Se obtiene el Drive actual
    makeDrive(NameDrive, Letter, _, Capacity, Drive), % Se obtiene los atributos del Drive actual
    makeDrive(NameDrive, Letter, NewListFolders, Capacity, NewDrive), % Se actauliza el Drive actual
    deleteDriveInListDrive(Drive, Drives, NewListDrives), % Se elimina el Drive actual de la lista de Drives
    addDriveInListDrive(NewListDrives, NewDrive, NewListDrives2), % Se agrega el nuevo drive a la lista de Drives
    makeSystem(NameSystem, Users, NewListDrives2, CurrentUser, CurrentDrive, Path, NewListFolders, Trash, Timestamp, SystemNew).

% Requerimiento 9
% Meta primaria: systemCd/3.
% Meta secundaria: makeSystem/10, verificarUnicidad/2, verificarCaracterUnico/1, verificarPath/2.
% Dom: SystemOld, Path, SystemNew.
systemCd(SystemOld, Path, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado
    getPathFull(CurrentPath, Path, NewPath), % Obtiene la ruta
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, NewPath, Folders, Trash, Timestamp, SystemNew).
