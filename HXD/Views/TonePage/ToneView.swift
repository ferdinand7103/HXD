//
//  ToneView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 21/08/24.
//

import SwiftUI

struct ToneView: View {
    @ObservedObject var viewModel: StoryViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            if viewModel.toneView == "Quiz" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: viewModel.currentStory.toneTest.text, speak: viewModel.currentStory.toneTest.speak)
                if viewModel.showChoice {
                    RecordingView(mode: .pinyin, viewModel: viewModel, homeVM: homeViewModel)
                        .padding(.top, 550)
                        .padding([.leading, .trailing])
                }
            } else if viewModel.toneView == "Correct" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: viewModel.currentStory.toneTest.happyFlow)
                if viewModel.showChoice {
                    ToneCorrect(text: viewModel.currentStory.toneTest.happyDown, pad: 165, viewModel: viewModel)
                }
            } else if viewModel.toneView == "Wrong" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: viewModel.currentStory.toneTest.negativeFlow)
                if viewModel.showChoice {
                    ToneWrong(text: viewModel.currentStory.toneTest.negativeDown, pad: 165, viewModel: viewModel)
                        .padding(.top, 550)
                        .padding([.leading, .trailing])
                }
            }
        }
    }
}

#Preview {
    ToneView(viewModel: StoryViewModel(), homeViewModel: HomeViewModel())
}
