// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/LoadingMotionView.swift
//  LoadingMotionView.swift
//  AnimationUI
// m7606225@gmail.com
    //  Created by Mohammed Abunada on 2020-09-19.
// https://github.com/m760622

import SwiftUI

struct LoadingMotionView: View {
    var body: some View {
        VStack {
            Text("Animations \n Circular pulses \n Scalling and rotation in SwiftUI")
                .foregroundColor(.black).opacity(0.6) .multilineTextAlignment(.center) .font(.headline)
            LoadingMotionInView()
        }//ZStack
    }//body
}//LoadingMotionView


struct LoadingMotionInView: View {
    @State var rotateHexagon = false
    @State var scaleCircle = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.red, .white, .black, .green]), center: .center, startRadius: 55, endRadius: 250)
                .scaleEffect(1.0)
            
            Circle()
                .frame(width: 250, height: 250)
                .foregroundColor(scaleCircle ? .red : .white)
                .scaleEffect(scaleCircle ? 1 : 0.2)
                .animation(Animation.easeOut(duration: 1).repeatForever().delay(1))
                .onAppear() {
                    self.scaleCircle.toggle()
                }
            Image(systemName: "circle.grid.cross.up.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(rotateHexagon ? 0 : -270), anchor: .center)
                .frame(width: 120, height: 120)
                .animation(Animation.timingCurve(0.19, 1, 0.22, 1, duration: 3).repeatForever(autoreverses: false))
                .onAppear() {
                    self.rotateHexagon.toggle()
                }
        }//ZStack
    }//body
}//LoadingMotionView


struct LoadingMotionView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingMotionView()
    }
}
