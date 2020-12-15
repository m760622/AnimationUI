// https://github.com/m760622/AnimationUI/blob/main/AnimationUI/Views/ButtonImageView.swift
//  ButtonImageView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-12-04.
// https://github.com/m760622

import SwiftUI

struct ButtonImageView: View {
    var body: some View {
        VStack{
            Text("ButtonImage Animations \n Image and Opacity in SwiftUI")
                .foregroundColor(.black).opacity(0.7) .multilineTextAlignment(.center) .font(.headline)
            Spacer()
            Button("Cancel") { }.buttonStyle(ButtonImageStyle(actionType: .cancel, withImage: false))
            Button("Cancel") { }.buttonStyle(ButtonImageStyle(actionType: .cancel))
            Button("Delete") { }.buttonStyle(ButtonImageStyle(actionType: .delete))
            Button("Done") { }.buttonStyle(ButtonImageStyle(actionType: .confirm))
            Spacer()
        }//VStack
    }//body
}//ButtonImageView

struct ButtonImageStyle: ButtonStyle {
    enum Action {
        case confirm, cancel, delete
        var bgColor: Color {
            switch self {
            case .confirm: return Color(UIColor.systemGreen)
            case .cancel: return Color(UIColor.systemBackground)
            case .delete: return Color(UIColor.systemRed)
            }
        }
        var fgColor: Color {
            if self == .cancel { return Color(UIColor.label)} else { return Color.white }
        }
        var stroke: Color {
            if self == .cancel { return fgColor} else { return bgColor }
        }
        var image: Image {
            switch self {
            case .confirm: return Image(systemName: "checkmark.rectangle.fill")
            case .cancel: return Image(systemName: "clear.fill")
            case .delete: return Image(systemName: "trash")
            }
        }
    }//Action
    var actionType: Action
    var withImage: Bool = true
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            if withImage { actionType.image }
            configuration.label
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous) .fill(actionType.bgColor)
                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(actionType.stroke))
        )
        .foregroundColor(actionType.fgColor) .font(Font.bold(.body)())
        .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}//ButtonImageStyle

struct ButtonImage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView()
    }
}
