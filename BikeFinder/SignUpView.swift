//
//  SignUpView.swift
//  BikeFinder
//
//  Created by Julia Ju on 2023-09-07.
//

import SwiftUI

struct SignUpView: View {
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
                        authModel.signUp(
                            emailAddress: emailAddress,
                            password: password
                        )
                    },
                    label: {
                        Text("Sign Up")
                            .bold()
                    }
                )
            }
            
            //we pass the aut h
            NavigationLink(destination: LoginView().environmentObject(self.authModel)) {
                                Text("Login instead")
                                    .font(.headline)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
            }
        }.navigationTitle("Sign Up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
