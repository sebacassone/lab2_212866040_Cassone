:- module(system_21286604_CassoneGonzalez, [makeSystem/9]).

% TDA System = Name x Users x Drives x CurrentUser x CurrentDrive x Path x Folders x Trash.

% Constructores
% Meta primaria: makeSystem/9
% Dom: Name x Users x Drives x CurrentUser x CurrentDrive x Path x Folders x Trash x System.
makeSystem(Name, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, [Name, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash]).
