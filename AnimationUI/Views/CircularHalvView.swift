// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/CircularHalvView.swift
//  CircularHalvView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-10-12.
// https://github.com/m760622

import SwiftUI

struct CircularHalvView: View {
    var body: some View {
        VStack {
            Text("Animations \n Circular motion 2d rotation \n and stroke reveal in SwiftUI")
                .foregroundColor(.black).opacity(0.6) .multilineTextAlignment(.center) .font(.headline)
            CircularHalvInView()
        }//ZStack
    }//body
}//CircularHalvView

struct CircularHalvInView: View {
    @State private var rotatePath = false
    @State private var moveOnPath = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.green, Color.black]), center: .center, startRadius: 50, endRadius: 120)
            Circle()
                .trim(from: 4/7, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 220, height: 220)
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotatePath ? 200 : 160))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear() {
                    self.rotatePath.toggle()
                }
            
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .offset(x: 86, y: -10)
                .rotationEffect(.degrees(moveOnPath ? 260: -10))
                .rotation3DEffect(.degrees(0), axis: (x: 90, y: 0, z: 0))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear(){
                    self.moveOnPath.toggle()
                }
        }
    }
}//CircularHalvInView

struct CircularHalvView_Previews: PreviewProvider {
    static var previews: some View {
        CircularHalvView()
    }
}
