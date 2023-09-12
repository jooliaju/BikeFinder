//
//  MainView.swift
//  BikeFinder
//
//  Created by Julia Ju on 2023-09-07.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        VStack {
            // ?? is a or b, so either show email or empty
            Text("Hi " + (authModel.user?.email ?? "") + ":D")
        }.toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button(
                    action: {
                        authModel.signOut()
                    },
                    label: {
                        Text("Sign Out")
                            .bold()
                    }
                )
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
