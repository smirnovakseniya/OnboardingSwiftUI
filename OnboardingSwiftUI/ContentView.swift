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
    
    var player = AVPlayer(url: Bundle.main.url(forResource: "Rain", withExtension: "mp4")!)
    
    var body: some View {
            VStack {
                switch selection {
                case 0:
                    TabView {
                        Image(onboardingInfo[0].image![0]).customImage()
                        Image(onboardingInfo[0].image![1]).customImage()
                        Image(onboardingInfo[0].image![2]).customImage()
                    }
                    .padding(0)
                    .tabViewStyle(PageTabViewStyle())
                    .background(Color.gray)
                    
                case 1:
                    VideoPlayer(player: player)
                    //                    .frame(width: 900)
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
                case 2:
                    Text("3")
                default:
                    Text("Всё")
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(title).customGrayText()
                    Text(description).customBoldText()
                    Text(info).customText()
                }
                .background(Color.white)
                .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
                
                CustomButton {
                    print("Tap Button")
                    selection += 1
                    
                    title = onboardingInfo[selection].title
                    description = onboardingInfo[selection].description
                    info = onboardingInfo[selection].info
                    
                }
            }
            .padding(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
