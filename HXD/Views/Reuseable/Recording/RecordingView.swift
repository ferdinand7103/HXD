//
//  RecordingView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//

import SwiftUI

struct RecordingView: View {
    var body: some View {
         ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: .infinity, height: 300)
                .cornerRadius(24)
            VStack {
                RecordViewWrapper(mode: .conversation)
                    .frame(width: 300, height: 250)
            }
            .padding()
        }
    }
}

#Preview {
    RecordingView()
}
