//
//  ToDoApp.swift
//  ToDo
//
//  Created by Manuel Atance on 30/9/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
