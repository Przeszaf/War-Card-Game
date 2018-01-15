//
//  Results.swift
//  cardGameWar
//
//  Created by Przemyslaw Szafulski on 11/01/2018.
//  Copyright © 2018 Przemyslaw Szafulski. All rights reserved.
//

import Foundation


//This class is used to keep all the results

class Results {
    var winningDeckStrength = [Int]()
    var winningDeckAmountOfStrongCards = [Int]()
    var winningDeckAmountOfStrongestCards = [Int]()
    var winningDeckPowerOfStrongCards = [Int]()
    var winningDeckPowerOfStrongestCard = [Int]()
    var winningDeckInitialSorted = [[Int]]()
    var winningDeckInitial = [[Int]]()
    
    
    var losingDeckStrength = [Int]()
    var losingDeckAmountOfStrongCards = [Int]()
    var losingDeckAmountOfStrongestCards = [Int]()
    var losingDeckPowerOfStrongCards = [Int]()
    var losingDeckPowerOfStrongestCard = [Int]()
    var losingDeckInitialSorted = [[Int]]()
    var losingDeckInitial = [[Int]]()
    var ties = [0, 0, 0, 0, 0, 0, 0]
    var countArray = [Int]()
    var totalCount = 0
    
    
    func writeToFile() {
        //Content of files, CSV format
        var results1 = "Strength Winning Deck,Strong Cards Power Winning Deck,Strongest Cards Power Winning Deck,Amount of Strong Cards Winning Deck,Amount of Strongest Cards Winning Deck,Count of plays\n"
        var results3 = ""
        var results4 = ""
        var results5 = ""
        for i in 0..<winningDeckStrength.count {
            results1 += "\(winningDeckStrength[i]),\(winningDeckPowerOfStrongCards[i]),\(winningDeckPowerOfStrongestCard[i]),\(winningDeckAmountOfStrongCards[i]),\(winningDeckAmountOfStrongestCards[i]),\(countArray[i])\n"
            results3 += "\n"
            results4 += "\n"
            results5 += "\n"
            for j in 0 ..< winningDeckInitial[0].count {
                results3 += "\(winningDeckInitialSorted[i][j]),"
                results4 += "\(winningDeckInitial[i][j]),"
                results5 += "\(losingDeckInitial[i][j]),"
            }
            print("Saving files: \(i+1)/\(winningDeckStrength.count)")
            results3.removeLast()
        }
        
        let results2 = "Total Count,Ties,Double ties,Triple ties,Quadruple ties,Five ties,Six or more ties\n\(totalCount),\(ties[1]),\(ties[2]),\(ties[3]),\(ties[4]),\(ties[5]),\(ties[6])"
        
        
        //Filenames
        let file = "winningDeckStrengths.csv"
        let file2 = "tieCount.csv"
        let file3 = "winningDecksInitialSorted.csv"
        let file4 = "winningDecksInitial.csv"
        let file5 = "losingDecksInitial.csv"
        
        //Directory URL
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            let fileURL2 = dir.appendingPathComponent(file2)
            let fileURL3 = dir.appendingPathComponent(file3)
            let fileURL4 = dir.appendingPathComponent(file4)
            let fileURL5 = dir.appendingPathComponent(file5)
            
            do {
                try results1.write(to: fileURL, atomically: false, encoding: .utf8)
                try results2.write(to: fileURL2, atomically: false, encoding: .utf8)
                try results3.write(to: fileURL3, atomically: false, encoding: .utf8)
                try results4.write(to: fileURL4, atomically: false, encoding: .utf8)
                try results5.write(to: fileURL5, atomically: false, encoding: .utf8)
                print("All items saved!")
            } catch {
                print(error)
            }
        }
    }
}
