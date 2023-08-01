:- module(folder_21286604_CassoneGonzalez, [makeFolder/7, verificarUnicidadFolders/2, addFolderInListFolder/3, getFolder/3, getFiles/2, deleteFolderInListFolder/3, get_lists_with_folder/3]).
% TDA Folder = name  x password x decryptFn x user-creator x path

% Constructores
% Meta primaria: makeFolder/7
% Dom: Name x Password x DecryptFn x UserCreator x Path x Folder
makeFolder(Name, Password, DecryptFn, UserCreator, Path, Files, [Name, Password, DecryptFn, UserCreator, Path, Files]).


% Getters
% Meta primaria: getFolder/3
% Dom: Path x Folders x Folder
% Si el Path es igual al Path de la carpeta concatenado con el nombre de la carpeta
getFolder(Path, [Folder | _], Folder):-
    makeFolder(NombreFolder, _, _, _, FolderPath, _, Folder),
    string_concat(FolderPath, NombreFolder, Path), !.

getFolder(Path, [_ | Folders], Folder):-
    getFolder(Path, Folders, Folder).

% Meta primaria: getFiles/2
% Dom: Folder x Files
getFiles([_, _, _, _, _, Files], Files).

% Obtiene todas las carpetas que tengan un path en particular
% Meta primaria: getFoldersForAPath/3
getFoldersForAPath(_, [], []).
getFoldersForAPath(Path, [Folder | Folders], [Folder | NewFolders]):-
    makeFolder(_, _, _, _, FolderPath, _, Folder),
    string_concat(FolderPath, _, Path),
    getFoldersForAPath(Path, Folders, NewFolders), !.

% Setters
% Meta primaria: deleteFolderInListFolder/3
% Dom: Folder x Folders x NewFolders
deleteFolderInListFolder(_, [], []).
deleteFolderInListFolder(Folder, [Folder | Folders], Folders):- !.
deleteFolderInListFolder(Folder, [Folder1 | Folders], [Folder1 | NewFolders]):-
    deleteFolderInListFolder(Folder, Folders, NewFolders).


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

% Otras operaciones
% Meta primaria: getFoldersForAPath/3
% Dom: List x Path
% Predicado auxiliar que verifica si el cuarto elemento de la lista contiene "/folder1"
has_folder(List, Path) :-
    nth1(4, List, Element4),
    sub_string(Element4, _, _, _, Path).

% Meta primaria: get_lists_with_folder1/3
% Dom: ListOfLists x Path x Result
% Meta secundaria: findall/3
% Predicado principal que obtiene todas las listas con el cuarto elemento que contiene "/folder1"
get_lists_with_folder(ListOfLists, Path, Result) :-
    findall(List, (member(List, ListOfLists), has_folder(List, Path)), Result).
