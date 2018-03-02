%Distribution of number of plays in a given game
% 
% figure(1)
% plot(countProb(1,:), countProb(2,:))
% title('Distribution of number of plays in 100,000 War games')
% xlabel('Count')
% ylabel('Number of plays')

figure(8)
plot(countProbInPerc(1,1:800), countProbInPerc(2,1:800))
set(gca,'fontsize',16)
title('Probability distribution of rounds in 100,000 War games', 'FontSize', 18)
xlabel('Count', 'FontSize', 18)
ylabel('Percentage of appearence', 'FontSize', 18)
grid on


figure(2)
plot(countProbInPerc(1,:), countProbInPerc(2,:))
set(gca,'fontsize',16)
title('Probability distribution of rounds in 100,000 War games', 'FontSize', 18)
xlabel('Count', 'FontSize', 18)
ylabel('Percentage of appearence', 'FontSize', 18)
grid on

figure(3)
plot(countProb2(1,:), countProb2(2,:))
set(gca,'fontsize',16)
title('Probability of having game with less than given number of rounds', 'FontSize', 18)
xlabel('Count', 'FontSize', 18)
ylabel('Percentage of appearence', 'FontSize', 18)
ylim([0 100])
grid on

figure(10)
plot(countProb2(1,1:800), countProb2(2,1:800))
set(gca,'fontsize',16)
title('Probability of having game with less than given number of rounds', 'FontSize', 18)
xlabel('Count', 'FontSize', 18)
ylabel('Percentage of appearence', 'FontSize', 18)
ylim([0 100])
grid on

% figure(4)
% plot(winAmountStrongProbInPerc(1,3:27)/2 + 13, winAmountStrongProbInPerc(2,3:27))
% title('Distribution of amount of strong cards in winnging hand')
% xlabel('Amount of strong cards')
% ylabel('Percentage of appearence')

figure(5)
winAmountStrongProbOfWinInPerc
plot(winAmountStrongProbOfWinInPerc(1,2:26)/2 + 14, winAmountStrongProbOfWinInPerc(2,2:26), 's-', 'LineWidth',2 ,'MarkerSize', 10)
set(gca,'fontsize',16)
title('Probability of winning with given amount of strong cards', 'FontSize', 18)
xlabel('Amount of strong cards', 'FontSize', 18)
ylabel('Probability of winning', 'FontSize', 18)
grid on


% figure(6)
% plot(winAmountStrongestProbInPerc(1,:)/2 + 8, winAmountStrongestProbInPerc(2,:))
% title('Distribution of amount of strongest cards in winnging hand')
% xlabel('Amount of strongest cards')
% ylabel('Percentage of appearence')

figure(7)
winAmountStrongestProbOfWinInPerc(2,1) = 0;
winAmountStrongestProbOfWinInPerc(2,17) = 100;
plot(winAmountStrongestProbOfWinInPerc(1,:)/2 + 8, winAmountStrongestProbOfWinInPerc(2,:), 's-', 'LineWidth',2 ,'MarkerSize', 10)
set(gca,'fontsize',16)
title('Probability of winning with given amount of strongest cards', 'FontSize', 18)
xlabel('Amount of strongest cards', 'FontSize', 18)
ylabel('Probability of winning', 'FontSize', 18)
grid on
