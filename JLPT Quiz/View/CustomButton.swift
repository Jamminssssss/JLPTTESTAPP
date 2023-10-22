//
//  CustomButton.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/11/23.
//

import SwiftUI

struct CustomButton: View{
    var title: String
    var onClick: ()->()
    
    var body: some View{
        Button {
           onClick()
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .hAlign(.center)
                .padding(.top,15)
                .padding(.bottom,10)
                .foregroundColor(.green)
                .background {
                    Rectangle()
                        .fill(Color.red)
                        .ignoresSafeArea()
                }
        }
        .padding([.bottom,.horizontal],-15)
        
    }
}

#Preview {
    ContentView()
}
