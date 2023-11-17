//
//  JLPT_QuizApp.swift
//  JLPT Quiz
//
//  Created by Jeamin on 2023/10/07.
//

import SwiftUI
import Firebase

@main
struct JLPT_QuizApp: App {
    init(){
                FirebaseApp.configure()
            }
            
            var body: some Scene {
                WindowGroup {
                    ContentView()
                }
            }
        }

