//
//  ContentView.swift
//  BikeFinder
//

//  Created by Julia Ju on 2023-09-05.
//

import SwiftUI


struct ContentView: View {
    @State private var text = ""
    @EnvironmentObject private var authModel: AuthViewModel

//        VStack {
//            Image(systemName: "scribble.variable")
//                .foregroundColor(.blue)
//                .imageScale(.large)
//            Text("Hello, world!!!!")
//            Image("face")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300,height: 300)
//            Spacer()
//            TextField(
//                "placeholder text :)",
//                text: $text)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//
        var body: some View {
                Group {
                    if authModel.user != nil {
                        MainView()
                    } else {
                        SignUpView()
                    }
                }.onAppear {
                    authModel.listenToAuthState()
                }
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
