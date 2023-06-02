:- module(system_21286604_CassoneGonzalez, [makeSystem/10, verificarUnicidadUsuarios/2, addUsuarioInListUsuario/3, esVacio/1, getPathFull/3]).

% TDA System = Name x Users x Drives x CurrentUser x CurrentDrive x Path x Folders x Trash x CreationDateSystem.

% Constructores
% Meta primaria: makeSystem/9
% Dom: Name x Users x Drives x CurrentUser x CurrentDrive x Path x Folders x Trash x System.
makeSystem(Name, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, [Name, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp]).


% Selectores




% Obtener el path completo de una ruta
% Meta Primaria: getPathFull/3
% Meta secundaria: atomic_list_concat/3, append/3, getAbsolutePath/3
% Dom: CurrentDir x Path x NewDir
% Predicado para cambiar la ruta actual
% Casos bases
getPathFull(CurrentDir, Path, NewPath):-
    esVacio2(CurrentDir),
    esVacio2(Path),
    NewPath = "/",
    !.

getPathFull(CurrentDir, Path, NewPath):-
    atom_chars(Path, NuevoPathEnLista),
    \+ member('.', NuevoPathEnLista),
    sub_string(Path, _, _, _, CurrentDir),
    NewPath = Path,
    !.

getPathFull(CurrentDir, Path, NewDir) :-
    % Caso general: se obtiene la ruta absoluta
    % y se actualiza el directorio actual
    atom_chars(Path, NuevoPathEnLista),
    \+ member('.', NuevoPathEnLista),
    \+ sub_string(Path, _, _, _, CurrentDir),
    atom_concat(CurrentDir, Path, NewDir),
    !.

% Casos recursivos
getPathFull(CurrentDir, Path, NewDir):-
    split_string(Path, '/', '' ,NuevoPathEnLista),
    member("..", NuevoPathEnLista),
    % Eliminar el punto slash
    eliminar_punto_punto_slash(Path, NewPath),
    % Elimina despues de la última barra.
    eliminar_despues_de_barra(CurrentDir, NewCurrentDir),
    getPathFull(NewCurrentDir, NewPath, NewDir).

getPathFull(CurrentDir, Path, NewDir) :-
    atom_chars(Path, NuevoPathEnLista),
    member('.', NuevoPathEnLista),
    % Eliminar el punto slash
    eliminar_punto_slash(Path, NewPath),
    getPathFull(CurrentDir, NewPath, NewDir).

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
esVacio2('').


% Otras operaciones

% Se encarga de eliminar el punto slash de una ruta
% Si el currentDir es / y path es .
% Elimina el punto slash
% Meta Primaria: eliminar_punto_slash/2
% Meta secundaria: atom_concat/3
% Dom: String x NuevoString
eliminar_punto_slash(String, NuevoString) :-
    atom_concat("./", Resto, String),
    !,
    eliminar_punto_slash(Resto, NuevoString).
eliminar_punto_slash(String, String).

eliminar_punto_punto_slash(String, NuevoString) :-
    atom_concat("../", Resto, String),
    !,
    eliminar_punto_punto_slash(Resto, NuevoString).
eliminar_punto_punto_slash(String, String).

delete_until_character([Character | Rest], Character, Rest).
delete_until_character([_ | Rest], Character, Result) :-
    delete_until_character(Rest, Character, Result).

eliminar_despues_de_barra(Cadena, Resultado) :-
    atom_chars(Cadena, NuevaCadena),
    reverse(NuevaCadena, Reversed),
    delete_until_character(Reversed, '/', Reversed2),
    reverse(Reversed2, Reversed3),
    atom_chars(Resultado, Reversed3),
    !.









