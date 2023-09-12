//
//  LoginView.swift
//  BikeFinder
//
//  Created by Julia Ju on 2023-09-11.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Email", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .keyboardType(.default)
            }
            Section {
                Button(
                    action: {
                        authModel.login(
                            emailAddress: emailAddress,
                            password: password
                        )
                    },
                    label: {
                        Text("Let's go!")
                            .bold()
                    }
                )
            }
            
            NavigationLink(destination: SignUpView()) {
                Text("Sign Up Instead")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }.navigationTitle("Login")
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
