// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/HexagonLoaderView.swift
//  HexagonLoaderView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-10-20.
// https://github.com/m760622

import SwiftUI

struct HexagonLoaderView: View {
    var body: some View {
        VStack {
            Text("Animations \n hexagon motion \n Scaling and Rotation in SwiftUI")
                .foregroundColor(.black).opacity(0.6) .multilineTextAlignment(.center) .font(.headline)
            Spacer()
            HexagonLoaderInView()
            Spacer()
        }//ZStack
    }//body
}//HexagonLoaderView

struct HexagonLoaderInView: View {
    @State var rotate = false
    @State var scaleCircle = false
    let duration:Double = 2.5
    let circleDim = UIScreen.main.bounds.width * 0.7
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: circleDim, height: circleDim)
                    .foregroundColor(scaleCircle ? .red : .green)
                    .scaleEffect(scaleCircle ? 1 : 0)
                    .animation(Animation.easeOut(duration: duration).repeatForever().delay(0))
                    .onAppear() { scaleCircle.toggle() }
                
                Image(systemName: "hexagon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(rotate ? 0 : -60), anchor: .center)
                    .frame(width: circleDim * 0.7, height: circleDim * 0.7)
                    .animation(Animation.timingCurve(0.19, 1, 0.22, 1, duration: duration).repeatForever(autoreverses: false))
                    .onAppear() { rotate.toggle()  }
            }//ZStack
        }//VStack
        .background(Color.black.opacity(0.1))
    }//body
}//HexagonLoaderInView


struct HexagonLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonLoaderView()
    }
}
