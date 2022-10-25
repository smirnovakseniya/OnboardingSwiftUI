//
//  ContentView.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 21.10.22.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 0
    @State var title = onboardingInfo[0].title
    @State var description = onboardingInfo[0].description
    @State var info = onboardingInfo[0].info
    
    var body: some View {
        NavigationView {
            VStack() {
                switch selection {
                case 0:
                    ImagesView()
                case 1:
                    VideoView()
                default:
                    GifView()
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(title).customGrayText()
                    Text(description).customBoldText()
                    Text(info).customText()
                    
                    Spacer()
                    
                    if selection == 0 {
                        SubscribeButtonView()
                    }
                    ContinueButtonView(selection: $selection, title: $title, description: $description, info: $info)
                }
                .frame(height: 300)
                .background(.white)
                .padding([.top], 20)
                .padding(.horizontal, 20)
            }
            .padding(0)
        }
    }
}

private struct ImagesView: View {
    var body: some View {
        TabView {
            Image(images[0]).customImage()
            Image(images[1]).customImage()
            Image(images[2]).customImage()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

private struct VideoView: View {
    var model = Player()
    
    var body: some View {
        PlayerViewController(model.player)
            .onAppear {
                model.play()
            }
            .onDisappear {
                model.pause()
            }
    }
}

private struct GifView: View {
    var body: some View {
        Spacer()
        GifImage(gif)
            .aspectRatio(contentMode: .fit)
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
