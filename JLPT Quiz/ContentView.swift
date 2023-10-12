//
//  ContentView.swift
//  JLPT Quiz
//
//  Created by Jeamin on 2023/10/07.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
