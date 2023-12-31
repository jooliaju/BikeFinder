//
//  MainView.swift
//  BikeFinder
//
//  Created by Julia Ju on 2023-09-07.
//

import SwiftUI
import GoogleMaps
import CoreLocation

    
struct MainView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
   
        
    var body: some View {
        ZStack {
            GoogleMapView()
                .edgesIgnoringSafeArea(.all) // Fill the whole screen
            
            VStack{
                Spacer()
                VStack {
                    
                    // ?? is a or b, so either show email or empty
                    Text("Hi " + (authModel.user?.email ?? ""))
                    .foregroundColor(.black)
                    
                    NavigationLink(destination: CameraView()) {
                        Text("Camera")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

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
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(Color(hex: "#F8F7F4"))
                .cornerRadius(30)

            }.edgesIgnoringSafeArea(.all)


        }
    
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
