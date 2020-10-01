// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/StrokeView.swift
//  StrokeView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-09-30.
// https://github.com/m760622

import SwiftUI

struct StrokeView: View {
    @State private var stroke = false
    var StrokeEllipseView: some View {
        Ellipse()
            .trim(from: stroke ? 0 : 1, to: 1)
            .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round, dash: [1, 10], dashPhase: 20.0))
            .frame(width: 150, height: 150) .foregroundColor(.red)
            .rotationEffect(.degrees(-90))
            .animation(Animation.easeInOut(duration: 3).delay(0).repeatForever(autoreverses: true))
            .onAppear() {self.stroke.toggle() }
    }//StrokeEllipseView
    
    var body: some View {
        VStack{
            Text("Animations \n Stroke and Rotation \n in SwiftUI")
                .foregroundColor(.primary).opacity(0.7) .multilineTextAlignment(.center) .font(.title)
            Divider()
            StrokeEllipseView  .padding(.vertical, 30)
            StrokeRectangleView() .padding(.vertical, 30)
            StrokeCircleView() .padding(.vertical, 30)
        }//VStack
    }//body
}//StrokeView

struct StrokeRectangleView: View {
    @State private var stroke = false
    var body: some View {
        Rectangle()
            .trim(from: stroke ? 0 : 1, to: 1)
            .stroke(style: StrokeStyle(lineWidth: 17, lineCap: .round, lineJoin: .round, dash: [10, 20], dashPhase: 10.0))
            .frame(width: 120, height: 120) .foregroundColor(.green)
            .animation(Animation.easeInOut(duration: 5).delay(0).repeatForever(autoreverses: true))
            .onAppear() {self.stroke.toggle() }
    }//body
}//StrokeRectangleView

struct StrokeCircleView: View {
    @State private var stroke = false
    var body: some View {
        Circle()
            .trim(from: stroke ? 0 : 1, to: 1)
            .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [10, 20], dashPhase: 20.0))
            .frame(width: 120, height: 120) .foregroundColor(.black)
            .rotation3DEffect(.degrees(stroke ? 0 : 180), axis: (x: 1, y: 0, z: 1))
            .animation(Animation.easeInOut(duration: 1).delay(1).repeatForever(autoreverses: true))
            .onAppear() {self.stroke.toggle() }
    }//body
}//StrokeCircleView



struct StrokeView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeView()
    }
}
