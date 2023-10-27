//
//  ContentView.swift
//  JLPT Quiz
//
//  Created by Jeamin on 2023/10/07.
//
import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                Select()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "house.fill")
                Text("홈으로")
            }
            .tag(0)
            
            NavigationView {
                Home()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "pencil.line")
                Text("시작전 읽기")
            }
            .tag(1)
            
            NavigationView {
                ProblemSolving()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "play.display")
                Text("강의영상")
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
