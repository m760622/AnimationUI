// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/RectangleFillingLoaderView.swift
//  RectangleFillingLoaderView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-10-19.
// https://github.com/m760622

import SwiftUI

struct RectangleFillingLoaderView: View {
    var body: some View {
        VStack {
            Text("Animations \n Rectangle motion \n Filling and Loading  in SwiftUI")
                .foregroundColor(.black).opacity(0.6) .multilineTextAlignment(.center) .font(.headline)
            RectangleFillingLoaderInView()
        }//ZStack
    }//body
}//RectangleFillingLoaderView

struct RectangleFillingLoaderInView: View {
    @State private var rotateRect = false
    @State private var fillRect = true
    let screenW = UIScreen.main.bounds.width * 0.8
    let screenH = UIScreen.main.bounds.height * 0.8

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: .center, startRadius: 15, endRadius: 500)
            ZStack {
                Rectangle()
                    .frame(width: screenW, height: screenH)
                    .scaleEffect(x: 1, y: fillRect ? 0.05 : 1, anchor: .bottom)
                    .foregroundColor(.blue)
                    .border(Color.blue, width: 5)
                    .cornerRadius(10)
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 0).repeatForever(autoreverses: false).speed(0.5)) {
                            fillRect.toggle()
                        }
                    }//onAppear
            }//ZStack
            .rotationEffect(.degrees(rotateRect ? 0 : 15), anchor: .bottom)
            .animation(Animation.spring(response: 5, dampingFraction: 1.0, blendDuration: 0).repeatForever(autoreverses: false))
            .shadow(radius: 0.2)
            .scaleEffect(0.5)
            .onAppear() { rotateRect.toggle() }
        }//ZStack
        .border(Color.red, width: 2)
        
    }
}//RectangleFillingLoaderInView

struct RectangleFillingLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleFillingLoaderView()
    }
}
