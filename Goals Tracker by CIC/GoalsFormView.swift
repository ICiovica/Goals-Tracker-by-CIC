//
//  GoalsFormView.swift
//  Goals Tracker by CIC
//
//  Created by Ionut Ciovica on 29/05/2022.
//

import SwiftUI

struct GoalsFormView: View {
    @ObservedObject var form: GoalsForm
    @Binding var goals: [Goals]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $form.name)
                Picker(selection: $form.goalType, label:
                        Text("Goal Type")) {
                    Text("Fitness").tag(Goals.GoalType.fitness)
                    Text("Read").tag(Goals.GoalType.read)
                    Text("Sleep").tag(Goals.GoalType.sleep)
                    Text("Meditate").tag(Goals.GoalType.meditate)
                    Text("Food").tag(Goals.GoalType.food)
                }
                
                TextField("Enter description:", text: $form.description)
                    .keyboardType(.default)
                    .autocapitalization(.none)
            }
            .navigationBarTitle(form.updating ? "Update Goal" : "New Goal", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel", action: dismiss), trailing: Button(form.updating ? "Update" : "Save", action: form.updating ? updateGoal : createGoal))
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func updateGoal() {
        guard let index = goals.firstIndex(where: { $0.id == form.id }) else { return }
        goals[index].name = form.name
        goals[index].goalType = form.goalType
        goals[index].description = form.description
        dismiss()
    }
    
    func createGoal() {
        goals.append(Goals.init(name: form.name, description: form.description, goalType: form.goalType))
        dismiss()
    }
}

struct GoalsFormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GoalsFormView(form: GoalsForm(Goals.starterGoals[0]), goals: .constant(Goals.starterGoals))
            GoalsFormView(form: GoalsForm(), goals: .constant(Goals.starterGoals))
        }
    }
}
