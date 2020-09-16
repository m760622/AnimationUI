// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/CircularMotionView.swift
//  CircularMotionView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-09-17.
// https://github.com/m760622

import SwiftUI

struct CircularMotionView: View {
    var body: some View {
        VStack {
            Text("Animations \n Circular motion \n 2d rotation and stroke reveal in SwiftUI")
                .foregroundColor(.black).opacity(0.6) .multilineTextAlignment(.center) .font(.headline)
            CircularMotionInView()
        }//ZStack
    }//body
}//CircularMotionView

struct CircularMotionInView: View {
    @State private var rotate2D = false
    @State private var revealStroke = false
    @State private var moveAlongCircle = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.black]), center: .center, startRadius: 25, endRadius: 130) .scaleEffect(1.0)
            
            Circle() // Inner small circles: Anticlockwise 2D rotation green
                .frame(width: 50, height: 50) .foregroundColor(.green)
            Circle() // Inner Semicircle: red 0.9
                .trim(from: 1/2, to: 1)
                .frame(width: 50, height: 50)
                .foregroundColor(.red).opacity(0.9)
                .rotationEffect(.degrees(rotate2D ? -360 : 0))
                .animation(Animation.easeInOut(duration: 10).delay(0.99).repeatForever(autoreverses: false))
                .onAppear() {self.rotate2D.toggle()}
            Circle() // Circular path green 0.8
                .stroke(lineWidth: 15)
                .frame(width: 200, height: 200)
                .foregroundColor(.green).opacity(0.7)
            Circle() // Dashed stroke: Draw stroke using trim path white
                .trim(from: revealStroke ? 0 : 1, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round, dash: [1, 10], dashPhase: 20.0))
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.easeInOut(duration: 10).delay(1).repeatForever(autoreverses: false))
                .onAppear() {self.revealStroke.toggle() }
            Circle() // Out Small Ball red
                .frame(width: 25, height: 25) .offset(y: -100) .foregroundColor(.red)
                .rotationEffect(.degrees(moveAlongCircle ? 360 : 0))
                .animation(Animation.easeInOut(duration: 10).delay(0.99).repeatForever(autoreverses: false))
                .onAppear() {self.moveAlongCircle.toggle() }
        }//ZStack
    }//body
}//CircularMotionView


struct CircularMotionView_Previews: PreviewProvider {
    static var previews: some View {
        CircularMotionView()
    }
}
