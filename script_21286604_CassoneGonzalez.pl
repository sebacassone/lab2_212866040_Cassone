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


system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1),  systemSwitchDrive(S1, "C", S3), systemMkdir(S3, "Folder1", S4), systemMkdir(S4, "Folder2", S5), systemCd(S5, "../../Folder1", S6).

system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1),  systemSwitchDrive(S1, "C", S3), systemMkdir(S3, "Folder1", S4), systemMkdir(S4, "Folder2", S5), systemCd(S5, "../../Folder1", S6), file("foo1.txt", "hello world", Pepe), systemAddFile(S6, Pepe, S7).