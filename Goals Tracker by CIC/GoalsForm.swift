//
//  GoalsForm.swift
//  Goals Tracker by CIC
//
//  Created by Ionut Ciovica on 29/05/2022.
//

import Foundation

class GoalsForm: ObservableObject {
    @Published var name = ""
    @Published var description = ""
    @Published var goalType: Goals.GoalType = .fitness
    
    var id: UUID? // Is nil when we are creating a new goal
    var updating: Bool {
        return id != nil
    }
    
    // This initializer is used when we are creating a new Goal
    init() {}
    
    // This initializer is used when we are updating an existing Goal
    init(_ goal: Goals) {
        id = goal.id
        name = goal.name
        description = goal.description
        goalType = goal.goalType
    }
}
