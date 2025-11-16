//
//  MissionBuilderProtocol.swift
//  VIPERLearning
//
//  Created by Paulo Henrique Costa Alves on 13/11/25.
//

import Foundation
import SwiftUI

protocol MissionBuilderProtocol {
    mutating func reset() -> Void
    mutating func createPresenter() -> Void
    mutating func createInteractor() -> Void
    mutating func createRouter() -> Void
    mutating func createFormatterTemplate() -> Void
    mutating func createCommand() -> Void
    mutating func createView() -> Void
}
