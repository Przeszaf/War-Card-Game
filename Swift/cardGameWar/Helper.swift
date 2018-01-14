//
//  Helper.swift
//  cardGameWar
//
//  Created by Przemyslaw Szafulski on 15/11/2017.
//  Copyright © 2017 Przemyslaw Szafulski. All rights reserved.
//

import Foundation

struct Helper {
    
    //Needs to keep a reference to results in order to write to them
    let results: Results
    
    init(results: Results) {
        self.results = results
    }
    
    func checkIfWon (deckA: CardDeck, deckB: CardDeck) -> Bool {
        //If first card of deck A is empty, it means that deck B won
        if deckA.cards.first == nil {
            results.winningDeckInitialSorted.append(deckB.initialCardsSorted)
            results.winningDeckInitial.append(deckB.initialCards)
            results.winningDeckStrength.append(deckB.strength)
            results.winningDeckAmountOfStrongCards.append(deckB.amountOfStrongCards)
            results.winningDeckAmountOfStrongestCards.append(deckB.amountOfStrongestCards)
            results.winningDeckPowerOfStrongestCard.append(deckB.powerOfStrongestCards)
            results.winningDeckPowerOfStrongCards.append(deckB.powerOfStrongCards)
            results.losingDeckInitial.append(deckA.initialCards)
            results.losingDeckStrength.append(deckA.strength)
            results.losingDeckAmountOfStrongCards.append(deckA.amountOfStrongCards)
            results.losingDeckAmountOfStrongestCards.append(deckA.amountOfStrongestCards)
            results.losingDeckPowerOfStrongCards.append(deckA.powerOfStrongCards)
            results.losingDeckPowerOfStrongestCard.append(deckA.powerOfStrongestCards)
            return true
        }
        //If first card of deck B is empty, then deck A won
        if deckB.cards.first == nil {
            results.winningDeckInitialSorted.append(deckA.initialCardsSorted)
            results.winningDeckInitial.append(deckA.initialCards)
            results.winningDeckStrength.append(deckA.strength)
            results.winningDeckAmountOfStrongCards.append(deckA.amountOfStrongCards)
            results.winningDeckAmountOfStrongestCards.append(deckA.amountOfStrongestCards)
            results.winningDeckPowerOfStrongestCard.append(deckA.powerOfStrongestCards)
            results.winningDeckPowerOfStrongCards.append(deckA.powerOfStrongCards)
            
            results.losingDeckInitial.append(deckB.initialCards)
            results.losingDeckStrength.append(deckB.strength)
            results.losingDeckAmountOfStrongCards.append(deckB.amountOfStrongCards)
            results.losingDeckAmountOfStrongestCards.append(deckB.amountOfStrongestCards)
            results.losingDeckPowerOfStrongCards.append(deckB.powerOfStrongCards)
            results.losingDeckPowerOfStrongestCard.append(deckB.powerOfStrongestCards)
            return true
        }
        //If there are still card in both decks, then the game continues
        return false
    }

    
    func itIsTie (deckA: CardDeck, deckB: CardDeck, cardsInTie: Int, counter: inout Int) {
        switch cardsInTie {
        case 3:
            results.ties[1] += 1
        case 5:
            results.ties[2] += 1
        case 7:
            results.ties[3] += 1
        case 9:
            results.ties[4] += 1
        case 11:
            results.ties[5] += 1
        default:
            results.ties[6] += 1
        }
        
        //Need to check if the amount of cards available is enough to do a "tie game"
        if deckA.cards.count < cardsInTie {
            for _ in 1...deckA.cards.count {
                deckB.cards.append(deckA.cards.first!)
                deckA.cards.remove(at: 0)
                
            }
            counter += 1
            return
        }
        if deckB.cards.count < cardsInTie {
            for _ in 1...deckB.cards.count {
                deckA.cards.append(deckB.cards.first!)
                deckB.cards.remove(at: 0)
            }
            counter += 1
            return
        }
        
        //The 3rd, 5th, 7th... card decides about who wins the tie.
        //The 2nd, 4th, 6th... cards are irrelevant
        if deckA.cards[cardsInTie - 1] > deckB.cards[cardsInTie - 1] {
            for _ in 1...cardsInTie {
                deckA.cards.append(deckA.cards.first!)
                deckA.cards.append(deckB.cards.first!)
                deckA.cards.remove(at: 0)
                deckB.cards.remove(at: 0)
            }
            counter += 1
        }
        else if deckA.cards[cardsInTie - 1] < deckB.cards[cardsInTie - 1] {
            for _ in 1...cardsInTie {
                deckB.cards.append(deckB.cards.first!)
                deckB.cards.append(deckA.cards.first!)
                deckB.cards.remove(at: 0)
                deckA.cards.remove(at: 0)
            }
            counter += 1
        }
            //If the cards are the same, then call the function again
            //Incrementing the number of cards in tie (3, 5, 7, 9, 11...)
        else {
            counter += 1
            itIsTie(deckA: deckA, deckB: deckB, cardsInTie: cardsInTie+2, counter: &counter)
        }
        return
    }

    
}
