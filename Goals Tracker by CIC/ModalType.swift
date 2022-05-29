//
//  ModalType.swift
//  Goals Tracker by CIC
//
//  Created by Ionut Ciovica on 29/05/2022.
//

import SwiftUI

enum ModalType: Identifiable, View {
    case createGoal(Binding<[Goals]>)
    case editGoal((Goals, Binding<[Goals]>))
    
    var id: String {
        switch self {
        case.createGoal:
            return "createGoal"
        case .editGoal:
            return "editGoal"
        }
    }
    
    var body: some View {
        switch self {
        case .createGoal(let goals):
            GoalsFormView(form: GoalsForm(), goals: goals)
        case .editGoal(let goalTuple):
            GoalsFormView(form: GoalsForm(goalTuple.0), goals: goalTuple.1)
        }
    }
}
