//
//  HomeView.swift
//  PlantApp
//
//  Created by MacBOOK Pro on 1/2/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var gridLayout = [GridItem(.adaptive(minimum: 100)), GridItem(.flexible())]
    
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Indoor", "Outdoor", "Garden", "Rooftop"]
    
    var body: some View {
        
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Color("bg")
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image("menu")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Spacer()
                                
                                Image("user")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .padding()
                            
                            HStack {
                                Text("Find Your Best ")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color("TextColor"))
                                    .fontWeight(.semibold)
                                
                                Text("Plant!")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color("TextColor"))
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            
                            SearchView()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< categories.count) { i in
                                        Button(action: {
                                            selectedIndex = i
                                            
                                        }, label: {
                                            CategoriesView(isActive: selectedIndex == i, text: categories[i])
                                        })
                                    }
                                }
                                .padding()
                            }
                            
                            Text("Recomended")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .padding(.horizontal, 20)
                                .foregroundColor(Color("TextColor"))
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< 4) { index in
                                        NavigationLink(destination: DetailsView(), label: {
                                            ProductCartView(image: Image("plant\(index + 1)"), size: 210)
                                        })
                                        .navigationBarHidden(true)
                                    }
                                    .padding(.trailing)
                                }
                                .padding(.leading)
                            }
                            
                            Text("Popular")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .padding(.horizontal, 20)
                                .foregroundColor(Color("TextColor"))
                            
                            ScrollView {
                                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 20) {
                                    ForEach(0 ..< 6) { i in
                                        ProductView2(image: Image("plant\(i+1)"), size: geometry.size.width / 2 - 60)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .navigationBarHidden(true)
                            .padding(.bottom, 70)
                        }
                    }
                    VStack {
                        Spacer()
                        BottomNavigationBarView()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct SearchView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("TextColor"))
                TextField("Search", text: $search)
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.semibold)
            }
            .padding()
            .background(.white)
            .cornerRadius(15)
            
            Image("scan")
                .resizable()
                .frame(width: 20, height: 20)
                .padding()
                .background(.white)
                .cornerRadius(15)
        }
        .padding(.horizontal)
    }
}

struct CategoriesView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.all, 15)
                .frame(minWidth: 90)
            
                .foregroundColor(isActive ? Color.white : Color("TextColor"))
                .background(isActive ? Color("TextColor") : Color.white)
                .cornerRadius(15)
        }
        .padding(.trailing, 5)
    }
}

struct ProductCartView: View {
    
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(100)
                .background(Color("bg"))
            
            Text("Plant")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color("TextColor"))
            
            HStack {
                ForEach(0 ..< 5) {item in
                    Image("star")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                Spacer()
                
                Text("4.9")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("TextColor"))
            }
            
            HStack {
                Text("$59")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("TextColor"))
                
                Spacer()
                
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(.all, 8)
                    .background(Color("TextColor"))
                    .cornerRadius(30)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct ProductView2: View {
    
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack(spacing: 15) {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            VStack(spacing: 8) {
                HStack {
                    Text("Plant")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextColor"))
                    
                    Spacer()
                    
                    Image("star")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("4.9")
                        .foregroundColor(Color("TextColor"))
                }

                HStack(spacing: 2) {
                    Text("$")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("99.0")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(width: size)
        .padding(.all, 10)
        .background(Color.white)
        .cornerRadius(20)
        .cornerRadius(60, corners: [.topLeft, .bottomRight])
    }
}


struct BottomNavigationBarView: View {
    var body: some View {
        HStack {
            NavigationBarItem(image: Image("home"), action: {})
            NavigationBarItem(image: Image("heart"), action: {})
            NavigationBarItem(image: Image("chat"), action: {})
            NavigationBarItem(image: Image("cart"), action: {})
        }
        .padding()
        .background(Color("lightGreen"))
        .cornerRadius(15)
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

struct NavigationBarItem: View {
    
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: {}, label: {
            image
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.horizontal, 30)
        })
    }
}


//from stackOverflow
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
