//
//  ContentView.swift
//  AnimationProjectHackingwithSwiftUI
//
//  Created by Shubham on 1/12/25.
//

import SwiftUI

// Implicit Animations
// we tell our views ahead of time “if someone wants to animate you, here’s how you should respond”, and nothing more. SwiftUI will then take care of making sure any changes that do occur follow the animation you requested

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}

//VStack {
//    Button("Tap Me!") {
//        // do nothing
//        withAnimation {
//            isShowingRed.toggle()
//        }
//    }
//    
//    if isShowingRed {
//        Rectangle()
//            .fill(.red)
//            .frame(width: 200, height: 200)
//            .transition(.asymmetric(insertion: .scale, removal: .opacity))
//    }
//}

//HStack(spacing: 0) {
//    ForEach(0..<letters.count, id: \.self) { num in
//        Text(String(letters[num]))
//            .padding(5)
//            .font(.largeTitle)
//            .background(enabled ? .blue : .red)
//            .offset(dragAmount)
//            .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//    }
//}
//.gesture(
//    DragGesture()
//        .onChanged { dragAmount = $0.translation }
//        .onEnded { _ in
//            dragAmount = .zero
//            enabled.toggle()
//        }
//)


//        LinearGradient(colors: [.red, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 300)
//            .clipShape(.rect(cornerRadius: 10))
//            .shadow(radius: 10)
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation(.bouncy) {
//                            dragAmount = .zero
//                        }
//                    }
//            )
//            .animation(.bouncy, value: dragAmount)


//Button("Tap Me") {
    // do nothing
//            withAnimation(.spring(duration: 1, bounce: 0.5)) { // explicit animation
//                animationAmount += 360
//        enabled.toggle()
//            }
//}
//.padding(50)
//.background(enabled ? .blue : .red)
//.animation(.default, value: enabled)
//.foregroundStyle(.white)
//.clipShape(.rect(cornerRadius: enabled ? 60 : 0))
//.animation(.spring(duration: 0.5, bounce: 0.6), value: enabled)

//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0.5, z: 0))


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
