//
//  LoginView.swift
//  PlantApp
//
//  Created by MacBOOK Pro on 1/2/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLinkActive1 = false
    @State private var isLinkActive2 = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("login")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    
                    Spacer()
                    
                    Text("Welcome To our Plant World!")
                        .foregroundColor(Color("lightGreen"))
                        .font(.system(size: 40))
                        .fontWeight(.semibold)
                        .padding()
                    
                    Spacer()
                    
                    VStack {
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color("bg"))
                            .cornerRadius(15)
                            .frame(height: 65)
                            .foregroundColor(Color("TextColor"))
                        
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color("bg"))
                            .cornerRadius(15)
                            .frame(height: 65)
                            .foregroundColor(Color("TextColor"))
                    }
                    .padding()
                    
                    NavigationLink(destination: HomeView(), isActive: $isLinkActive1) {
                        Button(action: {
                            self.isLinkActive1 = true
                        }, label: {
                            Text("Log In")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                                .foregroundColor(Color("TextColor"))
                                .frame(height: 52)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color("lightGreen"))
                                .cornerRadius(15)
                                .padding(.horizontal)
                        })
                    }
                    
                    Text("Forgot Password?")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    HStack {
                        Image("gmail")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .padding()
                            .background(Color("bg"))
                            .cornerRadius(40)
                        
                        Spacer()
                        
                        Image("apple")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .padding()
                            .background(Color("bg"))
                            .cornerRadius(40)
                        
                        Spacer()
                        
                        Image("facebook")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .padding()
                            .background(Color("bg"))
                            .cornerRadius(40)
                    }
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(Color("TextColor"))
                            .font(.system(size: 18))
                        
                        NavigationLink(destination: SignUpView(), isActive: $isLinkActive2) {
                            Button(action: {
                                self.isLinkActive2 = true
                            }, label: {
                                Text("Sign Up")
                                    .foregroundColor(Color("TextColor"))
                                    .fontWeight(.heavy)
                                    .font(.system(size: 18))
                            })
                        }
                    }
                    .frame(height: 60)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("lightGreen"))
                    .ignoresSafeArea()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
