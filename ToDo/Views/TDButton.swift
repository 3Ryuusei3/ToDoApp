//
//  TDButtonView.swift
//  ToDo
//
//  Created by Manuel Atance on 30/9/23.
//

import SwiftUI

struct TDButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TDButton(title: "Title", background: Color(UIColor.customPurple)) {}
}
