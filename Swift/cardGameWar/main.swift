//
//  main.swift
//  cardGameWar
//
//  Created by Przemyslaw Szafulski on 15/11/2017.
//  Copyright © 2017 Przemyslaw Szafulski. All rights reserved.
//

import Foundation

let results = Results()
let help = Helper(results: results)

var fullCardDeck = [Int]()

for countOfRuns in 1...100 {
    
    //Create a full deck of cards
    for i in 0...51 {
        fullCardDeck.append(i/4 + 2)
    }


    //Create 2 decks with random cards 
    var firstDeck = [Int]()
    var secondDeck = [Int]()
    for _ in 0...25 {
        var randomNum = Int(arc4random_uniform(UInt32(fullCardDeck.count)))
        firstDeck.append(fullCardDeck[randomNum])
        fullCardDeck.remove(at: randomNum)
        randomNum = Int(arc4random_uniform(UInt32(fullCardDeck.count)))
        secondDeck.append(fullCardDeck[randomNum])
        fullCardDeck.remove(at: randomNum)
    }

    //Create 2 CardDeck objects with those cards
    let deckA = CardDeck(cards: firstDeck)
    let deckB = CardDeck(cards: secondDeck)


    //Counter is used to count number of "plays" in each game
    var counter = 0
    
    //Continue till there is a winner
    while true {
        if help.checkIfWon(deckA: deckA, deckB: deckB) {
            results.countArray.append(counter)
            results.totalCount += counter
            break
        }
        
        //If first card of deck A is higher than of deck B, then take that card
        //to the back of deck and then add the first card of deck B to the end
        if deckA.cards.first! > deckB.cards.first! {
            deckA.cards.append(deckA.cards.first!)
            deckA.cards.append(deckB.cards.first!)
            deckA.cards.remove(at: 0)
            deckB.cards.remove(at: 0)
        }
        else if deckB.cards.first! > deckA.cards.first! {
            deckB.cards.append(deckB.cards.first!)
            deckB.cards.append(deckA.cards.first!)
            deckA.cards.remove(at: 0)
            deckB.cards.remove(at: 0)
        }
            //if first cards are the same, then it is tie and helper function is called
        else if deckB.cards.first! == deckA.cards.first! {
            help.itIsTie(deckA: deckA, deckB: deckB, cardsInTie: 3, counter: &counter)
        }
        counter += 1
    }
    print(countOfRuns)
}

print(results.countArray)
print(results.ties)
print(results.losingDeckInitial[1])
print(results.losingDeckStrength)
print(results.winningDeckStrength)

var sumWinning = 0
var sumLosing = 0
for i in 0..<results.winningDeckStrength.count {
    sumWinning += results.winningDeckStrength[i]
    sumLosing += results.losingDeckStrength[i]
}
print("Sum of winning cards: \(sumWinning), sum of losing cards: \(sumLosing)")


results.writeToFile()
