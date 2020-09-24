// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/ScaleEffectSView.swift
//  ScaleEffectSView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-09-24.
// https://github.com/m760622

import SwiftUI

struct ScaleEffectSView: View {
    @State private var scaleA = false
    @State private var scaleB = false
    var ScaleEffectAAView: some View {
        Image(systemName: "faceid")
            .resizable() .foregroundColor(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(scaleA ? 0 : 1.0)
            .animation(Animation.easeInOut(duration: 3).delay(0).repeatForever(autoreverses: true))
            .onAppear() {  self.scaleA.toggle() }
    }//ScaleEffectAAView

    var ScaleEffectABView: some View {
        Image(systemName: "faceid")
            .resizable() .foregroundColor(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(scaleB ? 1.0 : 0)
            .animation(Animation.easeIn(duration: 5.0).delay(0).repeatCount(100, autoreverses: false))
            .onAppear() {  self.scaleB.toggle() }
    }//ScaleEffectABView

    var body: some View {
        VStack{
            Text("Animations \n FaceId ScaleEffect \n in SwiftUI")
                .foregroundColor(.primary).opacity(0.7) .multilineTextAlignment(.center) .font(.title)
            Spacer()
            HStack{
            ScaleEffectAAView  .padding(.horizontal, 30)
            ScaleEffectABView .padding(.horizontal, 30)
            }//HStack
            Spacer()
            HStack{
                ScaleEffectBView() .padding(.horizontal, 30)
                ScaleEffectCView() .padding(.horizontal, 30)
            }//HStack
            Spacer()
        }//VStack
    }//body
}//ScaleEffectSView

struct ScaleEffectBView: View {
    @State private var scale = false
    var body: some View {
        Image(systemName: "faceid")
            .resizable() .foregroundColor(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(scale ? 1.0 : 1.5)
            .animation(Animation.easeInOut(duration: 2.0).delay(0.5).repeatForever(autoreverses: true))
            .onAppear() {  self.scale.toggle() }
    }//body
}//ScaleEffectBView

struct ScaleEffectCView: View {
    @State private var scale = false
    var body: some View {
        Image(systemName: "faceid")
            .resizable() .foregroundColor(.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .scaleEffect(scale ? 1.5 : 0.5)
            .animation(Animation.easeInOut(duration: 5.0).delay(1.5).repeatForever(autoreverses: true))
            .onAppear() {  self.scale.toggle() }
    }//body
}//ScaleEffectCView

struct ScaleEffectSView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleEffectSView()
    }
}
