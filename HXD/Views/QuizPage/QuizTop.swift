//
//  QuizTop.swift
//  HXD
//
//  Created by Ferdinand Jacques on 14/08/24.
//

import SwiftUI

struct QuizTop: View {
    @State private var isShowingConfirmation: Bool = false
    @State private var isShowingDict: Bool = false
    @StateObject private var talkingAnimation = TalkingAnimation()
    @ObservedObject var viewModel: StoryViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    @State var text: String
    
    var body: some View {
        ZStack{
            Image(viewModel.currentStory.background)
                .padding(.bottom, 195)
            if isShowingConfirmation {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                ConfirmationView(isShowingConfirmation: $isShowingConfirmation, homeVM: homeViewModel)
                    .frame(width: 313, height: 282)
                    .transition(.scale)
                    .zIndex(3)
                    .padding(.bottom, 85)
            }
            if isShowingDict{
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                DictionaryView(isShowingDict: $isShowingDict, viewModel: viewModel)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .transition(.scale)
                    .zIndex(100)
            }
            UpperButtons(isShowingConfirmation: $isShowingConfirmation, isShowingDict: $isShowingDict, viewModel: viewModel)
                .padding(.bottom, 680)
            TalkingView(images: ["Orange1","Orange2"],talkingAnimation: talkingAnimation)
                .onAppear {
                    talkingAnimation.startTalking(duration: 5)
                }
                .padding(.trailing, 190)
                .padding(.bottom, 50)
            Image("OrangeStay")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.leading, 190)
                .padding(.bottom, 50)
            BubbleChat(text: text)
                .padding(.bottom, 330)
        }
        .animation(.easeInOut, value: isShowingConfirmation)
    }
}

#Preview {
    QuizTop(viewModel: StoryViewModel(), homeViewModel: HomeViewModel(), text: "Ok, you already know some words! Do you know how to say “Hello” in Mandarin?")
}
