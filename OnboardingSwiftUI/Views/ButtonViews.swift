//
//  ButtonViews.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 21.10.22.
//

import SwiftUI

struct ButtonView: View {
    let action: () -> Void
    var text: String
    
    var body: some View {
        Button(action: action) {
            ButtonViewHStack(text: text)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct ButtonViewHStack: View {
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
            .background(configuration.isPressed ? Color(.blue.withAlphaComponent(0.5)) : Color(.blue.withAlphaComponent(0.7)))
            .cornerRadius(10)
    }
}

struct ContinueButtonView: View {
    @Binding var selection: Int
    @Binding var title: String
    @Binding var description: String
    @Binding var info: String
    
    var body: some View {
        if selection < onboardingInfo.count - 1 {
            ButtonView(action: {
                selection += 1
                title = onboardingInfo[selection].title
                description = onboardingInfo[selection].description
                info = onboardingInfo[selection].info
            }, text: "Continue")
            .padding([.bottom], 20)
        } else {
            NavigationLink(destination: MainContentView()) {
                ButtonViewHStack(text: "Continue")
                    .padding(10)
                    .edgesIgnoringSafeArea(.all)
                    .background(Color(.blue.withAlphaComponent(0.7)))
                    .cornerRadius(10)
            }
            .buttonStyle(.plain)
            .padding([.bottom], 20)
        }
    }
}

struct SubscribeButtonView: View {
    var body: some View {
        NavigationLink(destination: SubscribeContentView()) {
            ButtonViewHStack(text: "Subscribe")
                .padding(10)
                .background(Color(.gray.withAlphaComponent(0.7)))
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}
