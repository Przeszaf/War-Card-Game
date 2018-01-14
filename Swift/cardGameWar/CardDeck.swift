//
//  Deck.swift
//  cardGameWar
//
//  Created by Przemyslaw Szafulski on 11/01/2018.
//  Copyright © 2018 Przemyslaw Szafulski. All rights reserved.
//

import Foundation

//Class that holds single Card Deck along with its properties such as strength
class CardDeck {
    
    //cards array can change during the game, each Int represent a card, i.e.
    //2 - 2, 3 - 3, ..., 10 - 10, 11 - J, 12 - Q, 13 - K, 14 - A
    
    var cards: [Int]
    
    let initialCards: [Int]
    let initialCardsSorted: [Int]
    let strength: Int
    let powerOfStrongCards: Int
    let powerOfStrongestCards: Int
    let amountOfStrongCards: Int
    let amountOfStrongestCards: Int
    
    
    init(cards: [Int]) {
        self.cards = cards
        
        initialCards = cards
        initialCardsSorted = cards.sorted()
        
        
        //Calculates strength of initial deck as sum of power of all 26 cards,
        //amount of strong (value greater than 7) and strongest (value greater than 10) cards
        
        var strengthOfInitial = 0
        var powerOfStrong = 0
        var powerOfStrongest = 0
        var amountOfStrong = 0
        var amountOfStrongest = 0
        for card in initialCards {
            strengthOfInitial += card
            if card >= 8 {
                powerOfStrong += card
                amountOfStrong += 1
            }
            if card >= 11 {
                powerOfStrongest += card
                amountOfStrongest += 1
            }
        }
        
        strength = strengthOfInitial
        powerOfStrongCards = powerOfStrong
        powerOfStrongestCards = powerOfStrongest
        amountOfStrongCards = amountOfStrong
        amountOfStrongestCards = amountOfStrongest
        
    }
}
