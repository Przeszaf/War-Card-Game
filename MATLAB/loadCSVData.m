% Get path of sample data directory
myDir = pwd;
idcs = strfind(myDir,'/');
newDir = myDir(1:idcs(end)-1);
newDir = newDir + "/SampleData/";

% tieCount(1) - 1 tie, tieCount(2) - 2 ties etc.
tieCount = csvread(newDir + "tieCount.csv", 1, 1);

% Winning and losing players initial decks
winningDecksInitial = csvread(newDir + "winningDecksInitial.csv", 0, 0);
winningDecksInitialSorted = csvread(newDir + "winningDecksInitialSorted.csv", 0, 0);
losingDecksInitial = csvread(newDir + "losingDecksInitial.csv", 0, 0);

% Winner decks' strength, power and amount of strong and strongest cards
% and count of moves in given play
winPow = csvread(newDir + "winningDeckStrengths.csv", 1, 0, [1, 0, length(winningDecksInitial), 0]);
winPowStrong = csvread(newDir + "winningDeckStrengths.csv", 1, 1, [1, 1, length(winningDecksInitial), 1]);
winPowStrongest = csvread(newDir + "winningDeckStrengths.csv", 1, 2, [1, 2, length(winningDecksInitial), 2]);
winAmountStrong = csvread(newDir + "winningDeckStrengths.csv", 1, 3, [1, 3, length(winningDecksInitial), 3]);
winAmountStrongest = csvread(newDir + "winningDeckStrengths.csv", 1, 4, [1, 4, length(winningDecksInitial), 4]);
count = csvread(newDir + "winningDeckStrengths.csv", 1, 5, [1, 5, length(winningDecksInitial), 5]);

clear myDir newDir idcs