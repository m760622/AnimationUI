// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/RotationXYZView.swift
//  RotationXYZView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-09-22.
// https://github.com/m760622

import SwiftUI

struct RotationXYZView: View {
    @State private var rotate = false
    var RotationXSView: some View {
        Image(systemName: "faceid")
            .resizable() .foregroundColor(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .rotation3DEffect(.degrees(rotate ? 0 : 180), axis: (x: 1, y: 0, z: 0))
            .animation(Animation.easeInOut(duration: 3).delay(0.5).repeatForever(autoreverses: true))
            .onAppear() {  self.rotate.toggle() }
    }//RotationXSView
    
    var body: some View {
        VStack{
            Text("Animations \n FaceId Rotation \n XYZ rotation  in SwiftUI")
                .foregroundColor(.primary).opacity(0.7) .multilineTextAlignment(.center) .font(.title)
            Spacer()
            RotationXSView  .padding(.vertical, 30)
            RotationYView() .padding(.vertical, 30)
            RotationZView() .padding(.vertical, 30)
        }//VStack
    }//body
}//RotationXYZView

struct RotationYView: View {
    @State private var rotate = false
    var body: some View {
        Image(systemName: "faceid")
            .resizable() .foregroundColor(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .rotation3DEffect(.degrees(rotate ? 0 : 180), axis: (x: 0, y: 1, z: 0))
            .animation(Animation.easeIn(duration: 4.0).delay(2.5).repeatCount(100, autoreverses: true))
            .onAppear() {  self.rotate.toggle() }
    }//body
}//RotationYView

struct RotationZView: View {
    @State private var rotate = false
    var body: some View {
        Image(systemName: "faceid")
            .resizable() .foregroundColor(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .rotation3DEffect(.degrees(rotate ? 0 : 360), axis: (x: 0, y: 0, z: 1))
            .animation(Animation.easeIn(duration: 5.0).delay(4.5).repeatCount(100, autoreverses: true))
            .onAppear() {  self.rotate.toggle() }
    }//body
}//RotationZView


struct RotationXYZView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RotationXYZView()
            RotationXYZView()
                .preferredColorScheme(.dark)
        }
    }
}
