// https://github.com/m760622/AnimationUI/TypsView.swift
//  TypsView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-09-12.
// https://github.com/m760622

import SwiftUI

struct TypsView: View {
    let duration: Double = 3.0
    var body: some View {
        VStack {
            Text("Types of Animations in SwiftUI")
            Divider()
            Group{
                AnimationTView(animation: .easeIn)
                AnimationTView(animation: .easeOut)
                AnimationTView(animation: .easeInOut)
                AnimationTView(animation: .linear)
                AnimationTView(animation: .default)
                AnimationTView(animation: .interactiveSpring())
                AnimationTView(animation: .spring())
            }//Group
            Divider()
            Group{
                AnimationTView(animation: .easeIn(duration: duration))
                AnimationTView(animation: .easeOut(duration: duration))
                AnimationTView(animation: .linear(duration: duration))
            }//Group
            Divider()
            Group{
                ContainerRelativeShape()
                Rectangle()
                Capsule()
                Ellipse()
                Circle()
                Spacer()
            }//Group
            .foregroundColor(.green)
            .padding(.horizontal)
        }//VStack
    }//body
}//TypsView

struct AnimationTView: View {
    @State private var width: CGFloat = 300
    @State private var color = Color.blue
    var animation: Animation
    var body: some View {
        Capsule()
            .foregroundColor(color)
            .frame(width: width, height: 25)
            .onAppear(perform: {
                withAnimation(animation.repeatForever()) {
                    width = 0
                    color = .red
                }
            })
    }//body
}//AnimationTView

struct TypsView_Previews: PreviewProvider {
    static var previews: some View {
        TypsView()
    }
}
