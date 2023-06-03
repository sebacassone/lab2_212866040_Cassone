:- module(file_21286604_CassoneGonzalez, [file/3, makeFile/3, verificarUnicidadFiles/2]).
% Constructores
% Meta primaria: file/3.
% Dom: Name, Content, File.
file(Name, Content, [Name, Content]).

% Meta primaria: makeFile/3.
% Dom: File, Path, NewPath.
makeFile(File, Path, NewFile):-
    append(File, [Path], NewFile).

% Pertenencia
% Meta primaria: verificarUnicidadFiles/2.
% Dom: File, Folders.
verificarUnicidadFiles(File, Folders):-
    member(File, Folders).