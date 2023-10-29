//
//  LoginView.swift
//  ToDo
//
//  Created by Manuel Atance on 30/9/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do", subtitle: "Get things done", angle: 15, background: Color(UIColor.customPurple))
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .padding(.vertical, 8)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .padding(.vertical, 8)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TDButton(title: "Log In", background: Color(UIColor.customPurple)) {
                        viewModel.login()
                    }
                    .padding()
                }
                .scrollContentBackground(.hidden)
                .offset(y: -70)
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                
                Spacer ()
            }
        }
    }
}

#Preview {
    LoginView()
}
