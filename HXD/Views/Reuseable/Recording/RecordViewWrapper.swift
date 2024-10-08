//
//  RecordViewWrapper.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//

import SwiftUI
import UIKit

struct RecordViewWrapper: UIViewRepresentable {
    var mode: RecordingMode
    var viewModel: StoryViewModel
    var homeVM: HomeViewModel

    func makeUIView(context: Context) -> RecordView{
        return RecordView(frame: .zero, mode: mode, viewModel: viewModel, homeVM: homeVM)
    }

    func updateUIView(_ uiView: RecordView, context: Context) {
        if uiView.currentMode != mode {
            uiView.setMode(mode)
        }
    }
}

