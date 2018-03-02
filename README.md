# Card Game War

In this project, I developed a tool to simulate a classical card game - War.

A full 52-card deck is shuffled and then dealed to 2 players. Each player has, at the beginning, 26 cards. Then, the 1st card of a deck is put at the table  face up and the player with higher card wins and takes both his and opponent's cards to the end of his deck.

If it is a tie, then the 2nd card is put face down on the table and doesn't matter in this battle (but is still taken by winner). The 3rd card is the one that is important - player with higher card wins. If it is tie again, then the 4th card is put face down, and the 5th one fights etc.

Due to this, the player with weaker deck can still win. Consider, for example, first 3 cards of 2 decks:

Deck A - 7, Ace, 4

Deck B - 7, 2, 6

As it is tie between first cards (7 and 7), then the Ace in deck A doesn't matter as it is put face down, and the player B wins this round, getting the Ace to his hand.

## Getting Started

By running main.swift a data file is generated in a document directory. For now it is set to play 100 games of War.

Data consists of CSV files:
1. winningDeckStrengths.csv - a table of winnig deck strength, strong cards power, strongest cards power, amount of strong and strongest cards and count of rounds in given match
2. tieCount.csv - amount of ties, double ties etc.
3. winningDecksInitialSorted.csv - Initial deck of winning hand, sorted
4. winningDecksInitial.csv - Initial deck of winning hand
5. losingDecksInitial.csv - Initial deck of losing hand

Power of card is its number, i.e. 2 for 2, 3 for 3, 11 for J, 12 for Q, 13 for K, 14 for A.

Strong cards are defined as being 8 and higher, i.e. 8, 9, 10, J, Q, K, A

Strongest cards are defined as being 11 and higher, i.e. J, Q, K, A

Strength of deck is a sum of power of all cards in initial deck.


# Results

Program was run and played 1,000,000 matches of War. Then this data was analysed using MATLAB program.

### Shortest match

The shortest match consisted of only 20 rounds and the decks were as below. As expected, the winning deck won every single round with 6 single ties.  Winning deck had 17 strong and 12 strongest cards. Loosing deck had 11 strong and 4 strongest cards.

Winning deck | 10 | K | 7 | K | 6 | 8 | 5 | J | J | A | Q | 9 | A | 9 | 4 | A | 2 | 3 | A | 7 | J | 6 | 10 | 5 | K | Q |
| --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- | --- |
Loosing deck | 10 | K | 5 | 4 | 6 | 3 | 2 | 4 | J | Q | 8 | 4 | 3 | 9 | Q | 9 | 2 | 8 | 10 | 3 | 6 | 2 | 7 | 5 | 7 | 8 |

### Longest match

The longest match consisted of 3253 rounds with decks as below. Winning deck had 16 strong and 6 strongest cards. Loosing deck had 12 strong and 10 strongest cards. As the winning deck had more strong but less strongest cards we can expect that this game took a long time with many ties.

Winning deck | 10 | K | 2 | 4 | 10 | 7 | 9 | 4 | 5 | 6 | 8 | J | 10 | J | 8 | 9 | 5 | 8 | 8 | 9 | K | 2 | A | 4 | 3 | Q |
| --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- |  --- | --- |
Loosing deck | 4 | K | Q | 3 | 9 | Q | A | K | 5 | 10 | 5 | 3 | 7 | J | 6 | 6 | 2 | A | J | A | 7 | 3 | 7 | 2 | Q | 6 |


## Graphs

The amount of rounds in each match vary from 20 to over 3000 in this data, so I decided to plot the probability of playing given amount of rounds in match.

### Distribution of rounds

![distribution of rounds](https://github.com/Przeszaf/War-Card-Game/blob/master/Screenshots/probability1.jpg?raw=true "Distribution of rounds") ![distribution of rounds](https://github.com/Przeszaf/War-Card-Game/blob/master/Screenshots/probability2.jpg?raw=true "Distribution of rounds")

![distribution of rounds](https://github.com/Przeszaf/War-Card-Game/blob/master/Screenshots/probability3.jpg?raw=true "Distribution of rounds") ![distribution of rounds](https://github.com/Przeszaf/War-Card-Game/blob/master/Screenshots/probability4.jpg?raw=true "Distribution of rounds")

### Probability of winning

![distribution of rounds](https://github.com/Przeszaf/War-Card-Game/blob/master/Screenshots/strongCards.jpg?raw=true "Distribution of rounds") ![distribution of rounds](https://github.com/Przeszaf/War-Card-Game/blob/master/Screenshots/strongestCards.jpg?raw=true "Distribution of rounds")


As we can see, there is one point on graph that doesn't follow pattern. It is due to too small amount of rounds with 22 strong cards in one and 6 in other player's hand - there were only 11 games with that configuration.

Also, it is not possible for player to start with all 28 strong cards, as he has only 26 cards at the beginning. Therefore minimum amount of strong cards in initial deck is 2 as seen on graph.


## Authors

* **Przemyslaw Szafulski**
