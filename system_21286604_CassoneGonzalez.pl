:- module(system_21286604_CassoneGonzalez, [makeSystem/10, verificarUnicidadUsuarios/2, addUsuarioInListUsuario/3, esVacio/1]).

% TDA System = Name x Users x Drives x CurrentUser x CurrentDrive x Path x Folders x Trash x CreationDateSystem.

% Constructores
% Meta primaria: makeSystem/9
% Dom: Name x Users x Drives x CurrentUser x CurrentDrive x Path x Folders x Trash x System.
makeSystem(Name, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, [Name, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp]).


% Selectores

% Modificadores

% Verificar que el usuario sea único
% Meta Primaria: verificarUnicidadUsuarios/2
% Meta secundaria: member/2
% Dom: Usuario x ListaUsuarios
verificarUnicidadUsuarios(Usuario, ListaUsuarios):-
    member(Usuario, ListaUsuarios).


% Agregar un Usuario a una lista de Usuarios
% Meta Primaria: addUsuarioInListUsuario/3
% Meta secundaria: append/3
% Dom: Usuario x ListUsuario x NewListUsuario
addUsuarioInListUsuario(Usuario, ListUsuario, NewListUsuario):-
    append(Usuario, [ListUsuario], NewListUsuario).

% Pertenencia

% Verifica si un caracter es vacío, osea ""
% Meta Primaria: esVacio/1
% Dom: Caracter
esVacio("").