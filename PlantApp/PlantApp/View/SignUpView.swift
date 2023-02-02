//
//  SignUpView.swift
//  PlantApp
//
//  Created by MacBOOK Pro on 1/2/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isLinkActive3 = false
    @State private var isLinkActive4 = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("signup")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    
                    Spacer()
                    
                    Text("Create \nAccount")
                        .font(.system(size: 40))
                        .foregroundColor(Color("lightGreen"))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 23)
                    
                    VStack {
                        TextField("Name", text: $name)
                            .padding()
                            .background(Color("bg"))
                            .cornerRadius(15)
                            .frame(height: 65)
                            .foregroundColor(Color("TextColor"))
                        
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
                        
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding()
                            .background(Color("bg"))
                            .cornerRadius(15)
                            .frame(height: 65)
                            .foregroundColor(Color("TextColor"))
                    }
                    .padding()
                    
                    NavigationLink(destination: LoginView(), isActive: $isLinkActive3) {
                        Button(action: {
                            self.isLinkActive3 = true
                        }, label: {
                            Text("Sign Up")
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
                    
                    Text("Or")
                        .font(.system(size: 20))
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
                    
                    Spacer()
                    
                    HStack {
                        Text("Have an account?")
                            .foregroundColor(Color("TextColor"))
                            .font(.system(size: 18))
                        
                        NavigationLink(destination: LoginView(), isActive: $isLinkActive4) {
                            Button(action: {
                                self.isLinkActive4 = true
                            }, label: {
                                Text("Sign In")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
