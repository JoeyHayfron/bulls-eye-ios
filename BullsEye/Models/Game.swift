//
//  Game.swift
//  BullsEye
//
//  Created by Joseph Acquah on 05/09/2022.
//

import Foundation

struct LeaderboardEntry {
    var score: Int
    var date: Date
}

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    func points(sliderValue: Int) -> Int {
        let pointsScored = 100 - abs(self.target - sliderValue)
        if sliderValue == target {
            return pointsScored + 100
        } else if abs(self.target - sliderValue) <= 2 {
            return pointsScored + 50
        } else {
            return pointsScored
        }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score}
    }
    
    mutating func restartGame() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
