//
//  UpperButtons.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 14/08/24.
//

import SwiftUI

struct UpperButtons: View {
    @Binding var isShowingConfirmation: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    BackButton(isShowingConfirmation: $isShowingConfirmation)
                    Spacer()
                    FlashcardButton()

                }
                .frame(width: UIScreen.main.bounds.width - 60, height: 85)
            }
            
        }
    }
}

#Preview {
    UpperButtons(isShowingConfirmation: .constant(false))
}
