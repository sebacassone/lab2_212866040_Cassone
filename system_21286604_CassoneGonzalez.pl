:- module(system_21286604_CassoneGonzalez, [makeSystem/10]).

% TDA System = Name x Users x Drives x CurrentUser x CurrentDrive x Path x Folders x Trash x CreationDateSystem.

% Constructores
% Meta primaria: makeSystem/9
% Dom: Name x Users x Drives x CurrentUser x CurrentDrive x Path x Folders x Trash x System.
makeSystem(Name, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp, [Name, Users, Drives, CurrentUser, CurrentDrive, Path, Folders, Trash, Timestamp]).
