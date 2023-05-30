% En caso de que sea True
% Añade un drive A y C, registra a Roberto y Cesar, y logea a Cesar
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", NauSystem).
% Deslogea a Cesar
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1), systemLogout(S1, S2).

% En caso de que sea False
% Añade un drive A y A, registra a Roberto y Cesar, y logea a Cesar
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "A", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", NauSystem).
% Añade un drive A y C, registra a Roberto y Roberto, y logea a Cesar
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Roberto", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", NauSystem).
% Deslogea sin haber usuario logeado
system("newSystem", System), systemAddDrive(System, "A", "Dinosaurio", 1000, NewSystem), systemAddDrive(NewSystem, "C", "Pepe", 10000, NewNewSystem), systemRegister(NewNewSystem, "Roberto", NewNewNewSystem), systemRegister(NewNewNewSystem, "Cesar", NewNewNewNewSystem), systemLogin(NewNewNewNewSystem, "Cesar", S1), systemLogout(S1, S2), systemLogout(S2, S3).