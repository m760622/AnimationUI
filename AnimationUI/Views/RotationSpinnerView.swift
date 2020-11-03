// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/RotationSpinnerView.swift
//  RotationSpinnerView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-11-03.
// https://github.com/m760622

import SwiftUI

struct RotationSpinnerView: View {
    var body: some View {
        VStack {
            Text("Animations \n Rotation Spinner in SwiftUI")
                .foregroundColor(.blue).opacity(0.9) .multilineTextAlignment(.center) .font(.headline)
            RotationSpinnerInView()
        }//ZStack
    }//body
}//RotationSpinnerView

struct RotationSpinnerInView: View {
    @State var spin3D_x = false
    @State var spin3D_y = false
    @State var spin3D_xy = false
    let circleDim = UIScreen.main.bounds.width * 0.4

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: .center, startRadius: 50, endRadius: 500)
            Circle() // Large circle
                .stroke(lineWidth: 5)
                .frame(width: circleDim, height: circleDim)
                .foregroundColor(.red)
                .rotation3DEffect(.degrees(spin3D_x ? 180 : 1), axis: (x: spin3D_x ? 1 : 0, y: 0, z: 0))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear(){ spin3D_x.toggle() }
            Circle() // Middle circle
                .stroke(lineWidth: 5)
                .frame(width: circleDim * 0.7, height: circleDim * 0.7)
                .foregroundColor(.green)
                .rotation3DEffect(.degrees(spin3D_y ? 360 : 1), axis: (x: 0, y: spin3D_y ? 1 : 0, z: 0))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false))
                .onAppear(){ spin3D_y.toggle() }
            Circle() // Inner Circle
                .stroke(lineWidth: 3)
                .frame(width: circleDim * 0.3, height: circleDim * 0.3)
                .foregroundColor(.black)
                .rotation3DEffect(.degrees(spin3D_xy ? 180 : 1), axis: (x: spin3D_xy ? 0 : 1, y: spin3D_xy ? 0 : 1, z: 0))
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear(){ spin3D_xy.toggle() }
        }//ZStack
    }//body
}//RotationSpinnerInView

struct RotationSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        RotationSpinnerView()
    }
}
