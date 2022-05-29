//
//  Goals.swift
//  Goals Tracker by CIC
//
//  Created by Ionut Ciovica on 29/05/2022.
//

import Foundation

struct Goals: Identifiable {
    enum GoalType: String {
        case fitness, read, sleep, meditate, food
    }
        let id = UUID()
        var name: String
        var description: String
        var goalType: GoalType
}

extension Goals {
    static var starterGoals: [Goals] {
        [
            Goals.init(name: "Fitness", description: "Set your fitness goals!", goalType: .fitness),
            Goals.init(name: "Books", description: "Set your books you want to read!", goalType: .read),
            Goals.init(name: "Sleep", description: "Set your sleeping hours!", goalType: .sleep),
            Goals.init(name: "Meditate", description: "Set your meditating sessions!", goalType: .meditate),
            Goals.init(name: "Food", description: "Set your meals!", goalType: .food)
        ]
    }
}
