//
//  ContentView.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import SwiftUI

struct MissionsView: View {
    @StateObject var presenter: MissionsPresenter
    
    var body: some View {
        VStack{
            List {
                ForEach (presenter.missions) { mission in
                    HStack {
                        Button {
                            presenter.completeMission(id: mission.id)
                        } label: {
                            Image(systemName: mission.estado ? "checkmark.circle.fill" : "circle")
                        }
                        Text(mission.titulo)
                    }
                }
            }
        }
    }
}

#Preview {
    MissionDirector().build()
}
