:- module(file_21286604_CassoneGonzalez, [file/3, makeFile/3, verificarUnicidadFiles/2, deleteFileInListFile/3, getFile/3, addFileInListFile/3, getFilesNotPattern/4]).
:- use_module(folder_21286604_CassoneGonzalez).
% TDA File = Name x Content x Path

% Constructores
% Meta primaria: file/3.
% Dom: Name, Content, File.
file(Name, Content, [Name, Content]).

% Meta primaria: makeFile/3.
% Dom: File, Path, NewPath.
makeFile(File, Path, NewFile):-
    append(File, [Path], NewFile).

% Getters
% Obtiene un archivo en especifico de una lista de archivos.
% Meta primaria: getFileInListFile/3.
% Meta secundaria: nth0/3.
% Dom: Files, N, File.
getFile(Name, [Primero|_], [Name, Content, Path]):-
    member(Name, Primero),
    nth0(0, Primero, Name),
    nth0(1, Primero, Content),
    nth0(2, Primero, Path), !.

% Caso Recursivo
getFile(Name, [_|Files], File):-
    getFile(Name, Files, File).

% Setters
% Elimina un archivo que esta en una posición N de una lista de archivos.
% Meta primaria: deleteFileInListFile/3.
% Meta secundaria: delete/3.
% Dom: Files, N, NewFiles.
deleteFileInListFile(Archivo, ListArchivo, NewListArchivo):-
    delete(ListArchivo, Archivo, NewListArchivo).

% Meta primeria: addFileInListFile/3.
% Meta secundaria: append/3.
% Dom: File, Files, NewFiles.
addFileInListFile(File, Files, NewFiles):-
    append([Files], File, NewFiles).

% Pertenencia
% Meta primaria: verificarUnicidadFiles/2.
% Dom: File, Folders.
verificarUnicidadFiles(File, Folders):-
    member(File, Folders).

% Otras operaciones
% Hay que obtener la carpeta actual con todos sus archivos, y también obtener las subcarpetas con sus archivos.
% Meta primaria: getFoldersWithSubFolders/2.

    


% Distingue si se quiere obtener los archivos que tienen un patron, si se quiere solo un archivo, o elimina una carpeta.
% Meta primaria: getFilesNotPattern/3.
% Dom: Files, Pattern, NewFiles.
get_first_element(List, FirstElement) :-
    nth1(0, List, FirstElement).

get_second_element(List, SecondElement) :-
    nth1(1, List, SecondElement).

contains_asterisk(String) :-
    sub_atom(String, _, _, _, '*').

contains_point(String) :-
    sub_atom(String, _, _, _, '.').

divide_string(String, Substrings) :-
    split_string(String, "*", "", Substrings).

% Que comience por cierta letra
% Predicado auxiliar que verifica si el primer elemento de una lista comienza con un patrón específico
starts_with_pattern(List, Pattern) :-
    nth0(0, List, Element),
    sub_atom(Element, 0, _, _, Pattern).

% Predicado principal que obtiene todas las listas cuyo primer elemento comienza con un patrón específico
get_lists_with_starting_pattern(ListOfLists, Pattern, Result) :-
    findall(List, (member(List, ListOfLists), starts_with_pattern(List, Pattern)), Result).

% Se elimina archivos por patron
getFilesNotPattern(Files, Pattern, _ ,NewFiles):-
    contains_asterisk(Pattern), % Se verifica si contiene asterisko
    divide_string(Pattern, Substrings), % Se divide el string con asterisko en dos (si*.txt -> [si, .txt])
    get_second_element(Substrings, SecondSubstring), % Se obtiene el segundo substring
    get_lists_with_starting_pattern(Files, SecondSubstring, NewFiles), % Se obtienen las listas que terminan con el segundo substring
    get_first_element(Substrings, FirstSubstring), % Se obtiene el primer substring
    get_lists_with_starting_pattern(NewFiles, FirstSubstring, NewFiles). % Se obtienen las listas que comienzan con el primer substring

getFilesNotPattern(Files, Pattern, CurrentPath, NewFiles):-
    contains_point(Pattern), % Se verifica si contiene punto
    getFolder(CurrentPath, Folders, Folder), % Se obtienen las carpetas de la carpeta actual
    getFile(Pattern, Folder, NewFiles). % Se obtiene el archivo que tiene el nombre del patrón

getFilesNotPatter(Files, Pattern, CurrentPath, NewFiles):-
    getFolder(CurrentPath, Folders, NewFiles). % Se obtienen las carpetas de la carpeta actual