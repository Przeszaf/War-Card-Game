# Card Game War

In this project, I developed a tool to simulate a number of plays of classical card game - War.
A full 52-card deck is shuffled and then dealed to 2 players. Each player has, at the beginning, 26 cards. Then, the 1st card of a deck is shown at the table and the player with higher card wins, and takes both cards to the end of his deck.
If it is a tie, then the 2nd card is put face down on the table and doesn't matter in this battle. The 3rd card is the one that is important - player with higher card wins. If it is tie again, then the 4th card is put face down, and the 5th one fights etc.

Due to this, the player with weaker deck can still win. Consider, for example, first 3 cards of 2 decks:

Deck A - 7, Ace, 4
Deck B - 7, 2, 6

As it is tie between first cards (7 and 7), then the Ace doesn't matter as it is put face down, and the player B wins this round, getting the Ace to his hand.

## Getting Started

By running main.swift a data file is generated in a document directory. For now it is set to play 100 games of War.

Data consists of CSV files:
1. winningDeckStrengths.csv - a table of winnig deck strength, strong cards power, strongest cards power, amount of strong and strongest cards and count of rounds in given play
2. tieCount.csv - amount of ties, double ties etc.
3. winningDecksInitialSorted.csv - Initial deck of winning hand, sorted
4. winningDecksInitial.csv - Initial deck of winning hand
5. losingDecksInitial.csv - Initial deck of losing hand

Power of card is its number, i.e. 2 for 2, 3 for 3, 11 for J, 12 for Q, 13 for K, 14 for A.

Strong cards are defined as being 8 and higher, i.e. 8, 9, 10, J, Q, K, A

Strongest cards are defined as being 11 and higher, i.e. J, Q, K, A

Strength of deck is a sum of power of all cards in initial deck.


## To-Do list

- Do cleaning in CodeGameWar swift files - delete prints that were used to check if the program works properly
- Add some sample of data
- Create MATLAB files to generete graphs
- Add some sample of graphs
- Update README.md file with sample of data and graphs

## Authors

* **Przemyslaw Szafulski**
