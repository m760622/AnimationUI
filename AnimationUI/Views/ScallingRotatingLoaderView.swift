// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/ScallingRotatingLoaderView.swift
//  ScallingRotatingLoaderView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-10-14.
// https://github.com/m760622

import SwiftUI

struct ScallingRotatingLoaderView: View {
    var body: some View {
        VStack {
            Text("Animations \n Circular motion \n Scalling and rotation  in SwiftUI")
                .foregroundColor(.black).opacity(0.6) .multilineTextAlignment(.center) .font(.headline)
            ScallingRotatingLoaderInView()
        }//ZStack
    }//body
}//ScallingRotatingLoaderView

struct ScallingRotatingLoaderInView: View {
    @State private var scaleAll = false
    @State private var rotateOuter = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.blue]), center: .center, startRadius: 120, endRadius: 200)
            ZStack {
                Circle() //Iner red ball
                    .frame(width: 150, height: 150)
                    .foregroundColor(.red)
                
                ZStack {
                    Circle()  // white part
                        .trim(from: 1/2, to: 4/5)
                        .stroke(style: .init(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .frame(width: 250, height: 250)
                        .foregroundColor(.white)
                    
                    Circle()  // green part
                        .trim(from: 1/2, to: 4/5)
                        .stroke(style: .init(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .frame(width: 250, height: 250)
                        .foregroundColor(.green)
                        .rotationEffect(.degrees(180))
                }//ZStack
                .rotationEffect(.degrees(rotateOuter ? 360*3 : 0))
                .animation(Animation.spring(response: 0.87, dampingFraction: 0.1, blendDuration: 0.3).repeatForever(autoreverses: true))
                .onAppear() { self.rotateOuter.toggle() }
            }.scaleEffect(scaleAll ? 1 : 0.3)
            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
            .onAppear() { self.scaleAll.toggle() }
        }//ZStack
    }
}//ScallingRotatingLoaderInView

struct ScallingRotatingLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ScallingRotatingLoaderView()
    }
}
