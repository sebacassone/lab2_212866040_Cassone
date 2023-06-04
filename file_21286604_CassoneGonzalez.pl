:- module(file_21286604_CassoneGonzalez, [file/3, makeFile/3, verificarUnicidadFiles/2, deleteFileInListFile/3, getFile/3]).

% TDA File = Name x Content x Path

% Constructores
% Meta primaria: file/3.
% Dom: Name, Content, File.
file(Name, Content, [Name, Content]).

% Meta primaria: makeFile/3.
% Dom: File, Path, NewPath.
makeFile(File, Path, NewFile):-
    append(File, [Path], NewFile).

% Selectores
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

% Modificadores
% Elimina un archivo que esta en una posición N de una lista de archivos.
% Meta primaria: deleteFileInListFile/3.
% Meta secundaria: delete/3.
% Dom: Files, N, NewFiles.
deleteFileInListFile(Archivo, ListArchivo, NewListArchivo):-
    delete(ListArchivo, Archivo, NewListArchivo).

% Pertenencia
% Meta primaria: verificarUnicidadFiles/2.
% Dom: File, Folders.
verificarUnicidadFiles(File, Folders):-
    member(File, Folders).