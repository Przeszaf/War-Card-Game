%Distribution of number of plays in a given game

figure(1)
plot(countProb(1,:), countProb(2,:))
title('Distribution of number of plays in 100,000 War games')
xlabel('Count')
ylabel('Number of plays')

figure(2)
plot(countProbInPerc(1,:), countProbInPerc(2,:))
title('Distribution of number of plays in 100,000 War games')
xlabel('Count')
ylabel('Percentage of appearence')

figure(3)
plot(countProb2(1,:), countProb2(2,:))
title('Probability of having game with less or more than given number of plays')
xlabel('Count')
ylabel('Percentage of appearence')

figure(4)
plot(winAmountStrongProbInPerc(1,3:27)/2 + 13, winAmountStrongProbInPerc(2,3:27))
title('Distribution of amount of strong cards in winnging hand')
xlabel('Amount of strong cards')
ylabel('Percentage of appearence')

figure(5)
plot(winAmountStrongProbOfWinInPerc(1,3:27)/2 + 13, winAmountStrongProbOfWinInPerc(2,3:27))
title('Probability of winning with given amount of strong cards')
xlabel('Amount of strong cards')
ylabel('Percentage of appearence')
grid on

figure(6)
plot(winAmountStrongestProbInPerc(1,:)/2 + 8, winAmountStrongestProbInPerc(2,:))
title('Distribution of amount of strongest cards in winnging hand')
xlabel('Amount of strongest cards')
ylabel('Percentage of appearence')

figure(7)
plot(winAmountStrongestProbOfWinInPerc(1,:)/2 + 8, winAmountStrongestProbOfWinInPerc(2,:))
title('Probability of winning with given amount of strongest cards')
xlabel('Amount of strongest cards')
ylabel('Percentage of appearence')

