//
//  Button.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 21.10.22.
//

import SwiftUI


struct CustomButton: View {
    let action: () -> Void
    var text: String
    
    var body: some View {
        Button(action: action) {
            CustomButtonHStack(text: text)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct CustomButtonHStack: View {
    var text: String
    
    var body: some View {
            HStack {
                Text(text)
                    .frame(maxWidth: .infinity)
                Image(systemName: "chevron.right")
                    .font(.callout)
            }
            .foregroundColor(.white)
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(configuration.isPressed ? Color(.blue) : Color(.blue.withAlphaComponent(0.5)))
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        
    }
}

//struct ScaleGrayButtonStyle: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .padding(10)
//            .background(configuration.isPressed ? Color(.gray) : Color(.gray.withAlphaComponent(0.5)))
//            .cornerRadius(10)
//            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
//
//    }
//}
