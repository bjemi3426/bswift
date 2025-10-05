//
//  UserLoginView.swift
//  ProductsDemo
//
//  Created by Bjem on 10/3/25.
//

import SwiftUI

struct UserLoginView: View {
    @State var username = ""
    @State var password = ""
    @Binding var loginButtonTapped: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color("AppPrimary").opacity(0.9), Color("AppAccent").opacity(0.9)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                logoView
                
                VStack(spacing: 16) {
                    loginTextFieldsView
                    loginButtonsView
                }
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
    }

    var logoView: some View {
        VStack {
            Image("productlogo")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .shadow(radius: 6)
            
            Text("Products Demo")
                .font(.title.bold())
                .foregroundColor(.white.opacity(0.9))
                .padding(.top, 8)
        }
    }

    var loginTextFieldsView: some View {
        VStack(spacing: 12) {
            TextField("User Name", text: $username)
                .padding()
                .background(Color.white.opacity(0.15))
                .cornerRadius(10)
                .foregroundColor(.white)
                
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white.opacity(0.15))
                .cornerRadius(10)
                .foregroundColor(.white)
               
        }
        .textInputAutocapitalization(.never)
        .padding(.top, 20)
    }

    var loginButtonsView: some View {
        VStack(spacing: 12) {
            Button("Sign In") {
                loginButtonTapped.toggle()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("AppSecondary"))
            .cornerRadius(10)
            .foregroundColor(.white)
            .bold()
            
            Text("OR")
                .foregroundColor(.white.opacity(0.7))
                .bold()
            
            Button("Create an account") {
                loginButtonTapped.toggle()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("AppAccent"))
            .cornerRadius(10)
            .foregroundColor(.white)
            .bold()
        }
    }
}




