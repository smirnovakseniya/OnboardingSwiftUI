//
//  ContentView.swift
//  OnboardingSwiftUI
//
//  Created by Kseniya Smirnova on 21.10.22.
//

import SwiftUI
import AVKit

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
                case 2:
                    GifView()
                default:
                    Text("Всё")
                }
                
                VStack(alignment: .leading, spacing: 15) {
                        Text(title).customGrayText()
                        Text(description).customBoldText()
                        Text(info).customText()
                    
                    switch selection {
                    case 0:
                        SubscribeButton()
                        ContinueButton(selection: $selection, title: $title, description: $description, info: $info)
                    case 1, 2:
                        ContinueButton(selection: $selection, title: $title, description: $description, info: $info)
                            .padding([.top], 50)
                    default:
                        Text("Всё")
                    }
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

private struct ContinueButton: View {
    @Binding var selection: Int
    @Binding var title: String
    @Binding var description: String
    @Binding var info: String
    
    var body: some View {
        CustomButton(action: {
            selection += 1
            title = onboardingInfo[selection].title
            description = onboardingInfo[selection].description
            info = onboardingInfo[selection].info
        }, text: "Continue")
        .padding([.bottom], 20)
    }
}

private struct SubscribeButton: View {
    var body: some View {
        NavigationLink(destination: SubscribeContentView()) {
            CustomButtonHStack(text: "Subscribe")
            .padding(10)
            .background(Color(.gray.withAlphaComponent(0.5)))
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}


private struct ImagesView: View {
    var body: some View {
        TabView {
            Image(onboardingInfo[0].image![0]).customImage()
            Image(onboardingInfo[0].image![1]).customImage()
            Image(onboardingInfo[0].image![2]).customImage()
        }
        .padding(0)
        .tabViewStyle(PageTabViewStyle())
        .background(.gray)
    }
}

private struct VideoView: View {
    var player = AVPlayer(url: Bundle.main.url(forResource: onboardingInfo[1].video, withExtension: "mp4")!)
    
    var body: some View {
        VideoPlayer(player: player)
            .frame(width: 1000)
            .padding(0)
            .onAppear {
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player.currentItem, queue: .main) { _ in
                    self.player.seek(to: CMTime.zero)
                    self.player.play()
                }
                player.play()
            }
            .onDisappear {
                player.pause()
            }
    }
}

private struct GifView: View {
    var body: some View {
        Image(onboardingInfo[0].image![0]).customImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
