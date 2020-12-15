// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/ButtonScaling.swift
//  ButtonScaling.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-11-25.
// https://github.com/m760622

import SwiftUI

struct ButtonScaling: View {
    var body: some View {
        VStack{
            Text("ButtonScaling Animations \n Scaling and rotation in SwiftUI")
                .foregroundColor(.black).opacity(0.7) .multilineTextAlignment(.center) .font(.headline)
            Spacer()
            Button("Scaling Animation") {
                print("isPressed")
            }.buttonStyle(ButtonScalingStyle())
            Button("Rotation") {
                print("isPressed")
            }.buttonStyle(ButtonRotationStyle())
            .padding(.vertical, 50)
            Spacer()
        }//VStack
    }//body
}//ButtonScaling

struct ButtonScalingStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .padding(8)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(9)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.spring())
    }//makeBody
}//ButtonScalingStyle

struct ButtonRotationStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .padding(8)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(9)
            .rotationEffect(.degrees(configuration.isPressed ? 360 : 0))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeIn)
    }//makeBody
}//ButtonRotationStyle

struct ButtonSkaling_Previews: PreviewProvider {
    static var previews: some View {
        ButtonScaling()
    }
}
