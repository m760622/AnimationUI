// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/RadarRotatingView.swift
//  RadarRotatingView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-09-20.
// https://github.com/m760622

import SwiftUI

struct RadarRotatingView: View {
    var body: some View {
        VStack{
            Text("Animations \n Radar motion \n Rotation  in SwiftUI")
                .foregroundColor(.black).opacity(0.6) .multilineTextAlignment(.center) .font(.headline)
            RadarView()
        }//VStack
    }//body
}//RadarRotatingView

struct RadarView: View {
    @State var rotateOuter = false
    @State var rotateInner = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: .center, startRadius: 15, endRadius: 500)
                .scaleEffect(1.0)
            Image(systemName: "dot.radiowaves.left.and.right") // Outer image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 220, height: 220)
                .foregroundColor(.red )
                .rotationEffect(.degrees(rotateInner ? -180 : 0))
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.rotateOuter.toggle()
                }
            
            Image(systemName: "arrow.triangle.2.circlepath") // Inner image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.white )
                .rotationEffect(.degrees(rotateInner ? 180 : 0))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear(){
                    self.rotateInner.toggle()
                }
        }//ZStack
    }//body
}//RadarView

struct RadarRotatingView_Previews: PreviewProvider {
    static var previews: some View {
        RadarRotatingView()
    }
}
