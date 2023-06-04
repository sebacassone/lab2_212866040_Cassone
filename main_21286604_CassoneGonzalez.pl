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

% Requerimiento 10
% Meta primaria: systemAddFile/3.

% Dom: SystemOld, Name, SystemNew.
systemAddFile(SystemOld, File, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado
    makeFile(File, CurrentPath, NewFile), % Se crea el archivo
    \+ verificarUnicidadFiles(NewFile, Folders), % Se verifica que el archivo que se crea sea único dentro del mismo path
    addFolderInListFolder(Folders, NewFile, NewListFiles), % Se agrega el archivo a la lista de archivos en el actual Drive
    getDrive(CurrentDrive, Drives, Drive), % Se obtiene el Drive actual
    makeDrive(NameDrive, Letter, _, Capacity, Drive), % Se obtiene los atributos del Drive actual
    makeDrive(NameDrive, Letter, NewListFiles, Capacity, NewDrive), % Se actauliza el Drive actual
    deleteDriveInListDrive(Drive, Drives, NewListDrives), % Se elimina el Drive actual de la lista de Drives
    addDriveInListDrive(NewListDrives, NewDrive, NewListDrives2), % Se agrega el nuevo drive a la lista de Drives
    makeSystem(NameSystem, Users, NewListDrives2, CurrentUser, CurrentDrive, CurrentPath, NewListFiles, Trash, Timestamp, SystemNew).

% Requerimiento 11
% Meta primaria: systemDel/3.
systemDel(SystemOld, FileName, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado
    makeFile(FileName, CurrentPath, File), % Se crea el archivo
    verificarUnicidadFiles(File, Folders), % Se verifica que el archivo que se crea sea único dentro del mismo path
    getDrive(CurrentDrive, Drives, Drive), % Se obtiene el Drive actual
    makeDrive(NameDrive, Letter, _, Capacity, Drive), % Se obtiene los atributos del Drive actual
    makeDrive(NameDrive, Letter, NewListFiles, Capacity, NewDrive), % Se actauliza el Drive actual
    deleteDriveInListDrive(Drive, Drives, NewListDrives), % Se elimina el Drive actual de la lista de Drives
    addDriveInListDrive(NewListDrives, NewDrive, NewListDrives2), % Se agrega el nuevo drive a la lista de Drives,
    append(Trash, [File], NewTrash), % Se agrega el archivo a la lista de archivos en la papelera
    makeSystem(NameSystem, Users, NewListDrives2, CurrentUser, CurrentDrive, CurrentPath, NewListFiles, NewTrash, Timestamp, SystemNew).

% Requerimiento 12
% Copiar un archivo de un directorio a otro
% Meta primaria: systemCopy/4.
systemCopy(SystemOld, FileName, Path, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado,
    % Obtiene el archivo que se va a copiar desde Folders
    getFile(FileName, Folders, NewFile),
    makeFile(FileName, Path, NewFile), % Se crea el archivo
    addFolderInListFolder(Folders, NewFile, NewListFiles), % Se agrega el archivo a la lista de archivos en el actual Drive
    getDrive(CurrentDrive, Drives, Drive), % Se obtiene el Drive actual
    makeDrive(NameDrive, Letter, _, Capacity, Drive), % Se obtiene los atributos del Drive actual
    makeDrive(NameDrive, Letter, NewListFiles, Capacity, NewDrive), % Se actauliza el Drive actual
    deleteDriveInListDrive(Drive, Drives, NewListDrives), % Se elimina el Drive actual de la lista de Drives
    addDriveInListDrive(NewListDrives, NewDrive, NewListDrives2), % Se agrega el nuevo drive a la lista de Drives
    makeSystem(NameSystem, Users, NewListDrives2, CurrentUser, CurrentDrive, CurrentPath, NewListFiles, Trash, Timestamp, SystemNew).

% Requerimiento 13
% Mover un archivo de un directorio a otro
% Meta primaria: systemMove/4.
systemMove(SystemOld, FileName, Path, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado,
    % Obtiene el archivo que se va a mover desde Folders
    getFile(FileName, Folders, NewFile),
    makeFile(FileName, Path, NewFilePath), % Se crea el archivo
    deleteFileInListFile(NewFile, Folders, NewListFiles), % Se elimina el archivo de la lista de archivos en el actual Drive
    addFolderInListFolder(NewListFiles, NewFilePath, NewListFiles), % Se agrega el archivo a la lista de archivos en el actual Drive
    getDrive(CurrentDrive, Drives, Drive), % Se obtiene el Drive actual
    makeDrive(NameDrive, Letter, _, Capacity, Drive), % Se obtiene los atributos del Drive actual
    makeDrive(NameDrive, Letter, NewListFiles, Capacity, NewDrive), % Se actauliza el Drive actual
    deleteDriveInListDrive(Drive, Drives, NewListDrives), % Se elimina el Drive actual de la lista de Drives
    addDriveInListDrive(NewListDrives, NewDrive, NewListDrives2), % Se agrega el nuevo drive a la lista de Drives
    makeSystem(NameSystem, Users, NewListDrives2, CurrentUser, CurrentDrive, CurrentPath, NewListFiles, Trash, Timestamp, SystemNew).

% Requerimiento 14
% Renombra el nombre de un archivo en un mismo directorio
% Meta Primaria: renameFile/4.
systemRename(SystemOld, FileName, NewFileName, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, Folders, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado,
    % Obtiene el archivo que se va a renombrar desde Folders
    getFile(FileName, Folders, NewFile),
    makeFile(NewFileName, CurrentPath, NewFile), % Se crea el archivo
    deleteFileInListFile(NewFile, Folders, NewListFiles), % Se elimina el archivo de la lista de archivos en el actual Drive
    addFolderInListFolder(NewListFiles, NewFile, NewListFiles), % Se agrega el archivo a la lista de archivos en el actual Drive
    getDrive(CurrentDrive, Drives, Drive), % Se obtiene el Drive actual
    makeDrive(NameDrive, Letter, _, Capacity, Drive), % Se obtiene los atributos del Drive actual
    makeDrive(NameDrive, Letter, NewListFiles, Capacity, NewDrive), % Se actauliza el Drive actual
    deleteDriveInListDrive(Drive, Drives, NewListDrives), % Se elimina el Drive actual de la lista de Drives
    addDriveInListDrive(NewListDrives, NewDrive, NewListDrives2), % Se agrega el nuevo drive a la lista de Drives
    makeSystem(NameSystem, Users, NewListDrives2, CurrentUser, CurrentDrive, CurrentPath, NewListFiles, Trash, Timestamp, SystemNew).

% Requerimiento 16
% Formatea una unidad de almacenamiento
% Meta Primaria: formatDrive/4.
% Dom: system, letter, name, system.
formatDrive(SystemOld, Letter, Name, SystemNew):-
    makeSystem(NameSystem, Users, Drives, CurrentUser, CurrentDrive, CurrentPath, _, Trash, Timestamp, SystemOld),
    \+ esVacio(CurrentUser), % Verifica que haya un usuario logueado,
    % Obtiene el drive que se va a formatear desde Drives
    getDrive(Letter, Drives, Drive),
    makeDrive(_, _, _, Capacity, Drive), % Se crea el drive
    makeDrive(Name, Letter, [], Capacity, NewDrive), % Se crea el drive
    deleteDriveInListDrive(Drive, Drives, NewListDrives), % Se elimina el drive de la lista de drives
    addDriveInListDrive(NewListDrives, NewDrive, NewListDrives2), % Se agrega el drive a la lista de drives
    makeSystem(NameSystem, Users, NewListDrives2, CurrentUser, CurrentDrive, CurrentPath, [], Trash, Timestamp, SystemNew).

% Requerimiento 15
% Enlista los archivos de un directorio según un path
% Meta Primaria: systemList/3.
% Dom: system, path, list.
systemDir(System, _ ,Folders):-
    makeSystem(_, _, _, _, _, _, Folders, _, _, System).

% Requerimiento 20
% Ver el contenido de la papelera
% Meta Primaria: showTrash/2.
% Dom: system.
showTrash(System, Trash):-
    makeSystem(_, _, _, _, _, _, _, Trash, _, System).

