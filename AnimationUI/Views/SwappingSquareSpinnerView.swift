// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/SwappingSquareSpinnerView.swift
//  SwappingSquareSpinnerView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-10-29.
// https://github.com/m760622

import SwiftUI

struct SwappingSquareSpinnerView: View {
    var body: some View {
        VStack {
            Text("Animations \n Swapping Square Spinner in SwiftUI")
                .foregroundColor(.blue).opacity(0.9) .multilineTextAlignment(.center) .font(.headline)
            SwappingSquareSpinnerInView()
        }//ZStack
    }//body
}//SwappingSquareSpinnerView

struct SwappingSquareSpinnerInView: View {
    @State private var animateBottomRight = false
    @State private var animateTopLeft = false
    @State private var animateTopRight = false
    @State private var animateBottomLeft = false
    let dimS: CGFloat = 60
    let dimL: CGFloat = 80
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: .center, startRadius: 5, endRadius: 450)
            
            Rectangle() // Middle
                .frame(width:dimS, height: dimS)
            Rectangle()  // Bottom right
                .frame(width:dimL, height: dimL) .foregroundColor(.red)
                .scaleEffect(animateBottomRight ? 1 : 0.2)
                .offset(x: animateBottomRight ? dimS : 0, y: animateBottomRight ? dimS : 0)
                .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(0.8))
                .onAppear() { animateBottomRight.toggle() }
            Rectangle() // Top left
                .frame(width:dimL, height: dimL).foregroundColor(.red)
                .scaleEffect(animateTopLeft ? 1 : 0.2)
                .offset(x: animateTopLeft ? -dimS : 0, y: animateTopLeft ? -dimS : 0)
                .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(0.8))
                .onAppear() {animateTopLeft.toggle()}
            Rectangle() // Top right
                .frame(width: dimS, height: dimS) .foregroundColor(.green)
                .scaleEffect(animateTopRight ? 0.2 : 1.5)
                .offset(x: animateTopLeft ? 0 : dimS, y: animateTopRight ? 0 : -dimS)
                .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(0.8))
                .onAppear() {animateTopRight.toggle()}
            Rectangle() // Bottom left
                .frame(width: dimS, height: dimS)
                .scaleEffect(animateBottomLeft ? 0.2 : 1.5) .foregroundColor(.green)
                .offset(x: animateBottomLeft ? 0 : -dimS, y: animateBottomLeft ? 0 : dimS)
                .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(0.8))
                .onAppear() {animateBottomLeft.toggle()}
        }//ZStack
//        .foregroundColor(.pink)
    }//body
}//SwappingSquareSpinnerInView


struct SwappingSquareSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SwappingSquareSpinnerView()
    }
}
