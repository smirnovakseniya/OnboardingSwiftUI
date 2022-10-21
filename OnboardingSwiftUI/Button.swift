//
//  Button.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 21.10.22.
//

import SwiftUI


struct CustomButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Text("Button")
                    .frame(maxWidth: .infinity)
                Image(systemName: "chevron.right")
                    .font(.callout)
            }
            .foregroundColor(.white)
        }
        .padding([.bottom, .horizontal], 20)
        .buttonStyle(ScaleButtonStyle())
        
        
    }
}
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(configuration.isPressed ? Color(.blue) : Color(.blue.withAlphaComponent(0.5)))
            .cornerRadius(10)
//            .frame(height: 30)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
        
    }
}
