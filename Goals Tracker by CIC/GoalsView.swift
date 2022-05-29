//
//  ContentView.swift
//  Goals Tracker by CIC
//
//  Created by Ionut Ciovica on 29/05/2022.
//

import SwiftUI

struct GoalsView: View {
    @State private var goals = Goals.starterGoals
    @State private var modalType: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(goals) { goal in
                    HStack {
                        goalIcon(goal.goalType)
                            .font(.title)
                            .foregroundColor(.pink)
                            .frame(width: 32)
                        VStack(alignment: .leading) {
                            Text(goal.name)
                                .font(.title2)
                                .bold()
                            Text(goal.description)
                        }
                        .padding(.leading, 8)
                        
                        Spacer()
                        
                        Button {
                            modalType = .editGoal((goal, $goals))
                        } label: {
                            SFSymbol.edit
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.trailing, 8)
                    }
                }
                .onDelete(perform: { indexSet in
                    goals.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Goals")
            .navigationBarItems(trailing:
                                    Button {
                modalType = .createGoal($goals)
            } label: {
                SFSymbol.new
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .padding(.top, 16)
            })
            .sheet(item: $modalType) { $0 }
        }
    }
    
    func goalIcon(_ goalType: Goals.GoalType) -> SFSymbol {
        switch goalType {
        case .fitness:
            return SFSymbol.fitness
        case .read:
            return SFSymbol.read
        case .sleep:
            return SFSymbol.sleep
        case .meditate:
            return SFSymbol.meditate
        case .food:
            return SFSymbol.food
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
