//
//  MissionDirector.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation
import SwiftUI

class MissionDirector {
    
    var builder: MissionBuilder = MissionBuilder()
    
    func build() -> some View {
        builder.createCommand()
        builder.createFormatterTemplate()
        builder.createInteractor()
        builder.createPresenter()
        builder.createRouter()
        builder.createView()
        return builder.returnProduct()
    }
}
