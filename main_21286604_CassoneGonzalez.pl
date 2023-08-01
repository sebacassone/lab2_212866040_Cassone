:- use_module(system_21286604_CassoneGonzalez).
:- use_module(drive_21286604_CassoneGonzalez).
:- use_module(folder_21286604_CassoneGonzalez).
:- use_module(file_21286604_CassoneGonzalez).

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
    makeFolder(Name, "", "", CurrentUser, Path, [], NewFolder), % Se crea la carpeta
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

% Requerimiento 10
% Meta primaria: systemAddFile/3.
% Meta secundaria: makeSystem/10, verificarUnicidad/2, verificarCaracterUnico/1, verificarPath/2, makeFile/3, getFolder/3, getFiles/2, verificarUnicidadFiles/2, addFileInListFile/3, makeFolder/6, addFolderInListFolder/3, getDrive/3, makeDrive/5, deleteDriveInListDrive/3, addDriveInListDrive/3.
% Dom: SystemOld, Name, SystemNew.
systemAddFile(SystemOld, File, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado
    makeFile(File, CurrentPath, NewFile), % Se crea el archivo
    % Se obtiene la carpeta actual
    getFolder(CurrentPath, Folders, Folder),
    % Se obtiene la lista de archivos de la carpeta actual
    getFiles(Folder, Files),
    % Se verifica que el archivo no exista en la carpeta actual
    \+ verificarUnicidadFiles(NewFile, Files),
    % Se agrega el archivo a la lista de archivos de la carpeta actual
    addFileInListFile(Files, NewFile, NewListFiles),
    % Se actualiza la carpeta actual
    makeFolder(NameFolder, Password, Encrypt, User, Path, _, Folder),
    makeFolder(NameFolder, Password, Encrypt, User, Path, NewListFiles, NewFolder),
    % Se actualiza la lista de carpetas
    deleteFolderInListFolder(Folder, Folders, NewListFolders),
    addFolderInListFolder(NewListFolders, NewFolder, NewListFolders2),
    % Se actualiza el drive actual
    getDrive(CurrentDrive, Drives, Drive),
    makeDrive(NameDrive, Letter, _, Capacity, Drive),
    makeDrive(NameDrive, Letter, NewListFolders2, Capacity, NewDrive),
    % Se actualiza la lista de drives
    deleteDriveInListDrive(Drive, Drives, NewListDrives),
    addDriveInListDrive(NewListDrives, NewDrive, NewListDrives2),
    % Se actualiza el sistema
    makeSystem(NameSystem, Users, NewListDrives2, CurrentUser, CurrentDrive, CurrentPath, NewListFolders2, Trash, Timestamp, SystemNew).

% Requerimiento 11
% Meta primaria: systemDel/3.
systemDel(System, FileNamePatter, Files):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, Folders, Trash, Timestamp, System),
    getFolder(CurrentPath, Folders, Folder),
    get_lists_with_folder(Folders, CurrentPath, SubFolders),
    % Agrega folder a la lista de SubFolders
    append(SubFolders, [Folder], SubFolders2),
    getFilesNotPattern(Folder, FileNamePatter, CurrentPath, Files),
    !.


getCurrentDrive(System, Folders):-
    makeSystem(_, _, _, _, _, _, Folders, _, _, System).

getFilesCurrentFolder(System, Files):-
    makeSystem(_, _, _, _, _, CurrentPath, Folders, _, _, System),
    % Se obtiene la carpeta actual
    getFolder(CurrentPath, Folders, Folder),
    % Se obtiene la lista de archivos de la carpeta actual
    getFiles(Folder, Files).
