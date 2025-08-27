//
//  SignInView.swift
//  ScannerBot
//
//  Created by Bjem on 8/24/25.
//

import SwiftUI

struct SignInView: View {
    @State var userName = ""
    @State var userPassword = ""
    @Binding var navigateToHome: Bool
    var body: some View {
        ZStack {
            Color.indigo.ignoresSafeArea(.all)
            VStack {
                TextField("User Name", text: $userName).foregroundColor(.white).textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Enter a Password", text: $userPassword).foregroundColor(.white).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                Button(action: {
                    navigateToHome.toggle()
                }){
                    Text("Sign In").foregroundColor(.white)
                }
                .background(.black)
                .cornerRadius(8)
                .padding(.top)
                
            }
            .buttonStyle(.bordered)
            .padding()
            
          
        }
    }
}


