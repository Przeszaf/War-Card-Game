% Loading all the data from .csv files to workspace
run("loadCSVData.m")

% Values of average deck card (2 2s, 2 3s, 2 4s etc.)
avgPow = 208;
avgPowStrong = 154;
avgPowStrongest = 100;
avgAmountStrong = 14;
averageAmountStrongest = 8;

%Values of the best deck card (4 As, 4 Ks, 4 Qs etc)

maxStrength = 292;
maxPowStrong = 292;
maxPowStrongest = 200;
maxAmountStrong = 26;
maxAmountStrongest = 16;


% Finding the longest and shortes games
[longestGameCount, maxCountIndex] = max(count);
[shortestGameCount, minCountIndex] = min(count);

longestGameDecks = [winningDecksInitial(maxCountIndex, :); losingDecksInitial(maxCountIndex, :)];
shortestGameDecks = [winningDecksInitial(minCountIndex, :); losingDecksInitial(minCountIndex, :)];

% Creating array for winning deck Strength etc.
winPowProb = zeros(2,2*(maxStrength - avgPow) + 1);
winPowStrongProb = zeros(2, maxPowStrong - 16 + 1);
winPowStrongestProb = zeros(2, maxPowStrongest + 1);
winAmountStrongProb = zeros(2, maxAmountStrong +1);
winAmountStrongestProb = zeros(2, maxAmountStrongest +1);

% Creating x-axis values
for i = 1:length(winPowProb)
    winPowProb(1, i) =  -length(winPowProb) -1 + i * 2;
end
winPowProbInPerc = winPowProb;
winPowProbOfWinInPerc = winPowProb;

for i = 1:length(winPowStrongProb)
    winPowStrongProb(1, i) =  -length(winPowStrongProb) -1 + i * 2;
end
winPowStrongProbInPerc = winPowStrongProb;
winPowStrongProbOfWinInPerc = winPowStrongProb;

for i = 1:length(winPowStrongestProb)
    winPowStrongestProb(1, i) =  -length(winPowStrongestProb) -1 + i * 2;
end
winPowStrongestProbInPerc = winPowStrongestProb;
winPowStrongestProbOfWinInPerc = winPowStrongestProb;

for i = 1:length(winAmountStrongProb)
    winAmountStrongProb(1, i) =  -length(winAmountStrongProb) -1 + i * 2;
end
winAmountStrongProbInPerc = winAmountStrongProb;
winAmountStrongProbOfWinInPerc = winAmountStrongProb;

for i = 1:length(winAmountStrongestProb)
    winAmountStrongestProb(1, i) =  -length(winAmountStrongestProb) -1 + i * 2;
end
winAmountStrongestProbInPerc = winAmountStrongestProb;
winAmountStrongestProbOfWinInPerc = winAmountStrongestProb;

% Calculating amount of plays at which given power of initial deck, strong 
% and strongest cards was enough to win
% 
for i = 1:length(winPow)
    winPowProbInd = (length(winPowProb) + 1)/2  + (winPow(i) - avgPow);
    winPowStrongProbInd = (length(winPowStrongProb) + 1)/2  + (winPowStrong(i) - avgPowStrong);
    winPowStrongestProbInd = (length(winPowStrongestProb) + 1)/2  + (winPowStrongest(i) - avgPowStrongest);
    winAmountStrongInd = (length(winAmountStrongProb) +1) /2 + (winAmountStrong(i) - maxAmountStrong /2);
    winAmountStrongestInd = (length(winAmountStrongestProb) +1) /2 + (winAmountStrongest(i) - maxAmountStrongest /2);
    
    winPowProb(2, winPowProbInd) = winPowProb(2, winPowProbInd) +1;
    winPowStrongProb(2, winPowStrongProbInd) =  winPowStrongProb(2, winPowStrongProbInd) +1;
    winPowStrongestProb(2, winPowStrongestProbInd) =  winPowStrongestProb(2, winPowStrongestProbInd) +1;
    winAmountStrongProb(2, winAmountStrongInd) = winAmountStrongProb(2, winAmountStrongInd) + 1;
    winAmountStrongestProb(2, winAmountStrongestInd) = winAmountStrongestProb(2, winAmountStrongestInd) + 1;
end

% Same thing but in percents
for i = 1 : length(winPowProb)
    winPowProbInPerc(2,i)  = winPowProb(2,i) * 100 / length(winPow);
end

for i = 1 : length(winPowStrongProb)
    winPowStrongProbInPerc(2,i)  = winPowStrongProb(2,i) * 100 / length(winPowStrong);
end

for i = 1 : length(winPowStrongestProb)
    winPowStrongestProbInPerc(2,i)  = winPowStrongestProb(2,i) * 100 / length(winPowStrong);
end

for i = 1 : length(winAmountStrongProb)
    winAmountStrongProbInPerc(2,i)  = winAmountStrongProb(2,i) * 100 / length(winPowStrongest);
end

for i = 1 : length(winAmountStrongestProb)
    winAmountStrongestProbInPerc(2,i)  = winAmountStrongestProb(2,i) * 100 / length(winPowStrongest);
end

% Calculating probability of win with given card strength
midInd = (length(winPowProb) + 1)/2; 
for i = 0 : (length(winPowProb) - 1) / 2
    if  winPowProb(2, midInd + i) == 0 && winPowProb(2, midInd - i) == 0
        winPowProbOfWinInPerc(2, midInd + i) = NaN;
    elseif winPowProb(2, midInd + i) == 0 
        winPowProbOfWinInPerc(2, midInd + i) = 0;
    elseif winPowProb(2, midInd - i) == 0 
        winPowProbOfWinInPerc(2, midInd + i) = 100;
    else
        winPowProbOfWinInPerc(2, midInd + i) = 100 * (winPowProb(2, midInd + i) / (winPowProb(2, midInd +i) + winPowProb(2, midInd - i)));
    end
    winPowProbOfWinInPerc(2, midInd - i) = 100 - winPowProbOfWinInPerc(2, midInd + i);
end
% idx = ~isnan(winPowProbOfWinInPerc(2, :))
% plot(winPowProbOfWinInPerc(1, idx), winPowProbOfWinInPerc(2, idx))

midInd = (length(winPowStrongProb) + 1)/2; 
for i = 0 : (length(winPowStrongProb) - 1) / 2
    if  winPowStrongProb(2, midInd + i) == 0 && winPowStrongProb(2, midInd - i) == 0
        winPowStrongProbOfWinInPerc(2, midInd + i) = NaN;
    elseif winPowStrongProb(2, midInd + i) == 0 
        winPowStrongProbOfWinInPerc(2, midInd + i) = 0;
    elseif winPowStrongProb(2, midInd - i) == 0 
        winPowStrongProbOfWinInPerc(2, midInd + i) = 100;
    else
        winPowStrongProbOfWinInPerc(2, midInd + i) = 100 * (winPowStrongProb(2, midInd + i) / (winPowStrongProb(2, midInd +i) + winPowStrongProb(2, midInd - i)));
    end
    winPowStrongProbOfWinInPerc(2, midInd - i) = 100 - winPowStrongProbOfWinInPerc(2, midInd + i);
end

midInd = (length(winPowStrongestProb) + 1)/2; 
for i = 0 : (length(winPowStrongestProb) - 1) / 2
    if  winPowStrongestProb(2, midInd + i) == 0 && winPowStrongestProb(2, midInd - i) == 0
        winPowStrongestProbOfWinInPerc(2, midInd + i) = NaN;
    elseif winPowStrongestProb(2, midInd + i) == 0 
        winPowStrongestProbOfWinInPerc(2, midInd + i) = 0;
    elseif winPowStrongestProb(2, midInd - i) == 0 
        winPowStrongestProbOfWinInPerc(2, midInd + i) = 100;
    else
        winPowStrongestProbOfWinInPerc(2, midInd + i) = 100 * (winPowStrongestProb(2, midInd + i) / (winPowStrongestProb(2, midInd +i) + winPowStrongestProb(2, midInd - i)));
    end
    winPowStrongestProbOfWinInPerc(2, midInd - i) = 100 - winPowStrongestProbOfWinInPerc(2, midInd + i);
end

midInd = (length(winAmountStrongestProb) + 1)/2; 
for i = 0 : (length(winAmountStrongestProb) - 1) / 2
    if  winAmountStrongestProb(2, midInd + i) == 0 && winAmountStrongestProb(2, midInd - i) == 0
        winAmountStrongestProbOfWinInPerc(2, midInd + i) = NaN;
    elseif winAmountStrongestProb(2, midInd + i) == 0 
        winAmountStrongestProbOfWinInPerc(2, midInd + i) = 0;
    elseif winAmountStrongestProb(2, midInd - i) == 0 
        winAmountStrongestProbOfWinInPerc(2, midInd + i) = 100;
    else
        winAmountStrongestProbOfWinInPerc(2, midInd + i) = 100 * (winAmountStrongestProb(2, midInd + i) / (winAmountStrongestProb(2, midInd +i) + winAmountStrongestProb(2, midInd - i)));
    end
    winAmountStrongestProbOfWinInPerc(2, midInd - i) = 100 - winAmountStrongestProbOfWinInPerc(2, midInd + i);
end

midInd = (length(winAmountStrongProb) + 1)/2;
for i = 0 : (length(winAmountStrongProb) - 1) / 2
    if  winAmountStrongProb(2, midInd + i) == 0 && winAmountStrongProb(2, midInd - i) == 0
        winAmountStrongProbOfWinInPerc(2, midInd + i) = NaN;
    elseif winAmountStrongProb(2, midInd + i) == 0 
        winAmountStrongProbOfWinInPerc(2, midInd + i) = 0;
    elseif winAmountStrongProb(2, midInd - i) == 0 
        winAmountStrongProbOfWinInPerc(2, midInd + i) = 100;
    else
        winAmountStrongProbOfWinInPerc(2, midInd + i) = 100 * (winAmountStrongProb(2, midInd + i) / (winAmountStrongProb(2, midInd +i) + winAmountStrongProb(2, midInd - i)));
    end
    winAmountStrongProbOfWinInPerc(2, midInd - i) = 100 - winAmountStrongProbOfWinInPerc(2, midInd + i);
end

% Calculating how many hands are played
countProb = zeros(2,longestGameCount);

for i = 1:length(countProb)
    countProb(1,i) = i;
end
countProbInPerc = countProb;

for i = 1:length(count)
    countProb(2,count(i)) = countProb(2,count(i)) + 1;
end

for i = 1:length(countProb)
    countProbInPerc(2,i) = countProb(2,i) * 100 / length(count);
end

% run('clearWorkspace.m')