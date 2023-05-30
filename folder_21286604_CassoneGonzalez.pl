:- module(folder_21286604_CassoneGonzalez, [makeFolder/6, verificarUnicidadFolders/2, addFolderInListFolder/3]).
% TDA Folder = name  x password x decryptFn x user-creator x path

% Constructores
% Meta primaria: makeFolder/6
% Dom: Name x Password x DecryptFn x UserCreator x Path x Folder
makeFolder(Name, Password, DecryptFn, UserCreator, Path, [Name, Password, DecryptFn, UserCreator, Path]).

% Selectores


% Modificadores

% Se agrega una carpeta a la lista de carpetas
% Meta primaria: addFolderInListFolder/3
% Meta secundaria: append/3
% Dom: Folder x ListFolder x NewListFolders
addFolderInListFolder(Folder, ListFolder, NewListFolders):-
    append(Folder, [ListFolder], NewListFolders).

% Pertenecia

% Se verifica que la carpeta sea única
% Meta primaria: verificarUnicidadFolders/2
% Meta secundaria: member/2
% Dom: NewFolder x Folders
verificarUnicidadFolders(NewFolder, Folders):- not(member(NewFolder, Folders)).
