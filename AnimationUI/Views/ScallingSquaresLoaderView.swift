// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/ScallingRotatingLoaderView.swift
//  ScallingSquaresLoaderView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-10-18.
// https://github.com/m760622

import SwiftUI
struct ScallingSquaresLoaderView: View {
    var body: some View {
        VStack {
            Text("Animations \n Squares motion \n Scalling and rotation  in SwiftUI")
                .foregroundColor(.black).opacity(0.6) .multilineTextAlignment(.center) .font(.headline)
            ScallingSquaresLoaderInView()
        }//ZStack
    }//body
}//ScallingSquaresLoaderView
struct ScallingSquaresLoaderInView: View {
    @State private var topLeftOffset = false
    @State private var topRightOffset = false
    @State private var bottomLeftOffset = false
    @State private var bottomRightOffset = false
    @State private var rotateSquares = false
    let widthHit: CGFloat = 20
    let duration: Double = 1.0
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: .center, startRadius: 15, endRadius: 500)
            ZStack {
                Rectangle() // Top left
                    .frame(width: widthHit, height: widthHit).foregroundColor(.black)
                    .offset(x: bottomLeftOffset ? -15 : 0, y: bottomLeftOffset ? 15 : 0)
                    .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true))
                    .onAppear() { self.bottomLeftOffset.toggle() }
                Rectangle() // Top right
                    .frame(width: widthHit, height: widthHit).foregroundColor(.white)
                    .offset(x: bottomRightOffset ? 15 : 0, y: bottomRightOffset ? 15 : 0)
                    .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true))
                    .onAppear() { self.bottomRightOffset.toggle() }

                Rectangle()  // Bottom left
                    .frame(width: widthHit, height: widthHit).foregroundColor(.green)
                    .offset(x: topLeftOffset ? -15 : 0, y: topLeftOffset ? -15 : 0)
                    .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true))
                    .onAppear() { self.topLeftOffset.toggle() }
                Rectangle() // Bottom right
                    .frame(width: widthHit, height: widthHit).foregroundColor(.red)
                    .offset(x: topRightOffset ? 15 : 0, y: topRightOffset ? -15 : 0)
                    .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true))
                    .onAppear() { self.topRightOffset.toggle() }
            }//ZStack
            .scaleEffect(5.0)
            .rotationEffect(.radians(rotateSquares ? .pi : -.pi/8))
            .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true))
            .onAppear() { self.rotateSquares.toggle() }
        }//ZStack
    }//body
}//ScallingSquaresLoaderInView


struct ScallingSquaresLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ScallingSquaresLoaderView()
    }
}
