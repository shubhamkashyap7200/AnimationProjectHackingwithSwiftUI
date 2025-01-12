//
//  ContentView.swift
//  AnimationProjectHackingwithSwiftUI
//
//  Created by Shubham on 1/12/25.
//

import SwiftUI

// Implicit Animations
// we tell our views ahead of time “if someone wants to animate you, here’s how you should respond”, and nothing more. SwiftUI will then take care of making sure any changes that do occur follow the animation you requested

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            // do nothing
            withAnimation(.spring(duration: 1, bounce: 0.5)) { // explicit animation
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0.5, z: 0))
    }
}

#Preview {
    ContentView()
}



//        print(animationAmount)
//
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//        }
