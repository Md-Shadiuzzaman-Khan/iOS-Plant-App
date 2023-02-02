//
//  DetailsView.swift
//  PlantApp
//
//  Created by MacBOOK Pro on 1/2/23.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        Image("plant1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        Spacer()
                        
                        DescriptionView()
                            .offset(y: -40)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                
                
                Button(action: {}, label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal, 100)
                        .background(Color("lightGreen"))
                        .cornerRadius(10)
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.bold)
                })
                .padding()
                .padding(.horizontal)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: customBackButtonView(action: {
                presentationMode.wrappedValue.dismiss()
            }), trailing: customTrailingButtonView())
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}

struct customBackButtonView: View {
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
            .padding(.all, 12)
            .background(Color.white)
            .cornerRadius(8)
            .foregroundColor(Color("TextColor"))
        })
    }
}

struct customTrailingButtonView: View {
    var body: some View {
        Image("heart")
            .resizable()
            .frame(width: 30, height: 30)
            .padding(.all, 12)
            .background(Color.white)
            .cornerRadius(8)
    }
}



struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Plant")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("TextColor"))
                .padding(.leading)
            
            HStack {
                ForEach(0 ..< 5) {item in
                    Image("star")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
                
                Text("$59")
                    .font(.title)
                    .foregroundColor(Color("TextColor"))
            }
            .padding()
            
            Text("Description")
                .font(.system(size: 22))
                .foregroundColor(Color("TextColor"))
                .fontWeight(.semibold)
                .padding(.all)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
                .padding(.leading)
                .lineSpacing(6)
                .opacity(0.5)
            
            HStack {
                Button(action:  {}, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("TextColor"))
                        .cornerRadius(40)
                })
                
                Text("1")
                    .font(.system(size: 30))
                    .padding()
                
                Button(action: {}, label: {
                    Image(systemName: "minus")
                        .foregroundColor(.white)
                        .frame(height: 14)
                        .padding()
                        .background(Color("TextColor"))
                        .cornerRadius(40)
                })
            }
            .padding()
        }
        .padding()
        .padding(.top)
        .background(Color("bg"))
        .cornerRadius(40)
        .frame(minHeight: 0, maxHeight: .infinity)
    }
}

