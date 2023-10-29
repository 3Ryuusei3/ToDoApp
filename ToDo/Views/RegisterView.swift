//
//  RegisterView.swift
//  ToDo
//
//  Created by Manuel Atance on 30/9/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing your life", angle: -15, background: Color(UIColor.customPurple))
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .padding(.vertical, 8)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .padding(.vertical, 8)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .padding(.vertical, 8)
                    .textFieldStyle(DefaultTextFieldStyle())
                TDButton(title: "Create your account", background: Color(UIColor.customPurple)) {
                    viewModel.register()
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
            .offset(y: -100)
            
            Spacer ()
        }
    }
}

#Preview {
    RegisterView()
}
