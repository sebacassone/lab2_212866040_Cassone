% En caso de que sea True
% Añade un drive A y C, registra a Roberto y Cesar, y logea a Cesar
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", NauSystem).
% Deslogea a Cesar
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1), systemLogout(S1, S2).
% Se cambia a un drive existente
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1), systemLogout(S1, S2), systemSwitchDrive(S2, "C", S3).

% En caso de que sea False
% Añade un drive A y A, registra a Roberto y Cesar, y logea a Cesar
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "A", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", NauSystem).
% Añade un drive A y C, registra a Roberto y Roberto, y logea a Cesar
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Roberto", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", NauSystem).
% Deslogea sin haber usuario logeado
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1), systemLogout(S1, S2), systemLogout(S2, S3).
% Se cambia a un drive inexistente
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1), systemLogout(S1, S2), systemSwitchDrive(S2, "D", S3).

% Crea un nuevo archivo
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1),  systemSwitchDrive(S1, "C", S3), systemMkdir(S3, "Folder1", S4), systemMkdir(S4, "Folder2", S5), systemCd(S5, "../../Folder1", S6).

% Copia un archivo de un drive a otro
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1),  systemSwitchDrive(S1, "C", S3), systemMkdir(S3, "Folder1", S4), systemMkdir(S4, "Folder2", S5), systemCd(S5, "../../Folder1", S6), file("foo1.txt", "hello world", Pepe), systemAddFile(S6, Pepe, S7), systemCopy(S7,
"foo1.txt", "/", S8).

% Mueve un archivo de un drive a otro
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1),  systemSwitchDrive(S1, "C", S3), systemMkdir(S3, "Folder1", S4), systemMkdir(S4, "Folder2", S5), systemCd(S5, "../../Folder1", S6), file("foo1.txt", "hello world", Pepe), systemAddFile(S6, Pepe, S7), systemMove(S7,
"foo1.txt", "/", S8).

% Borra un archivo de un drive
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1),  systemSwitchDrive(S1, "C", S3), systemMkdir(S3, "Folder1", S4), systemMkdir(S4, "Folder2", S5), systemCd(S5, "../../Folder1", S6), file("foo1.txt", "hello world", Pepe), systemAddFile(S6, Pepe, S7), systemDel(S7,
"foo1.txt", S8).

% Renombra un archivo de un drive
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1),  systemSwitchDrive(S1, "C", S3), systemMkdir(S3, "Folder1", S4), systemMkdir(S4, "Folder2", S5), systemCd(S5, "../../Folder1", S6), file("foo1.txt", "hello world", Pepe), systemAddFile(S6, Pepe, S7), systemRename(S7, "foo1.txt", "ola.txt", S8).

% Formatea un drive
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemRegister(NewSystem, "Roberto", NewNewSystem), systemLogin(NewNewSystem, "Roberto", S1), systemFormat(S1, "A", S2).

% Ver Papelera
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemRegister(NewSystem, "Roberto", NewNewSystem), systemLogin(NewNewSystem, "Roberto", S1), systemFormat(S1, "A", S2), systemMkdir(S2, "Folder1", S3), systemMkdir(S3, "Folder2", S4), systemCd(S4, "../../Folder1", S5), file("foo1.txt", "hello world", Pepe), systemAddFile(S5, Pepe, S6), systemDel(S6, "foo1.txt", S7), systemTrash(S7, S8).

% Enlistar contenido
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemRegister(NewSystem, "Roberto", NewNewSystem), systemLogin(NewNewSystem, "Roberto", S1), systemFormat(S1, "A", S2), systemMkdir(S2, "Folder1", S3), systemMkdir(S3, "Folder2", S4), systemCd(S4, "../../Folder1", S5), file("foo1.txt", "hello world", Pepe), systemAddFile(S5, Pepe, S6), systemDir(S6, [] ,S7).

system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1),  systemSwitchDrive(S1, "C", S3), systemMkdir(S3, "Folder1", S4), systemMkdir(S4, "Folder2", S5), systemCd(S5, "../../Folder1", S6), file("foo1.txt", "hello world", Pepe), systemAddFile(S6, Pepe, S7), getCurrentDrive(S7, S8), getFilesCurrentFolder(S7, S9).

% Caso que debe retornar true:
% Creando un sistema, con el disco C, dos usuarios: “user1” y “user2”, 
% se hace login con "user1”, se utiliza el disco "C", se crea la carpeta “folder1”, 
% “folder2”, se cambia al directorio actual “folder1", 
% se crea la carpeta "folder11" dentro de "folder1", 
% se hace logout del usuario "user1", se hace login con “user2”, 
% se crea el archivo "foo.txt" dentro de “folder1”, se acceder a la carpeta c:/folder2, 
% se crea el archivo "ejemplo.txt" dentro de c:/folder2
system("newSystem", S1), systemAddDrive(S1, "C", "OS", 10000000000, S2), systemRegister(S2, "user1", S3), systemRegister(S3, "user2", S4), systemLogin(S4, "user1", S5), systemSwitchDrive(S5, "C", S6), systemMkdir(S6, "folder1", S7), systemMkdir(S7, "folder2", S8), systemCd(S8, "folder1", S9), systemMkdir(S9, "folder11", S10), systemLogout(S10, S11), systemLogin(S11, "user2", S12), file( "foo.txt", "hello world", F1), systemAddFile(S12, F1, S13), systemCd(S13, "/folder2", S14),  file( "ejemplo.txt", "otro archivo", F2), systemAddFile(S14, F2, S15).

% Casos que deben retornar false:
% si se intenta añadir una unidad con una letra que ya existe
system("newSystem", S1), systemRegister(S1, "user1", S2), systemAddDrive(S2, "C", "OS", 1000000000, S3), systemAddDrive(S3, "C", "otra etiqueta", 1000000000, S4).

% si se intenta hacer login con otra sesión ya iniciada por este usuario u otro
system("newSystem", S1), systemRegister(S1, "user1", S2), systemRegister(S2, "user2", S3), systemLogin(S3, "user1", S4), systemLogin(S4, "user2", S5).

% si se intenta usar una unidad inexistente
system("newSystem", S1), systemRegister(S1, "user1", S2), systemLogin(S2, "user1", S3), systemSwitchDrive(S3, "K", S4).
