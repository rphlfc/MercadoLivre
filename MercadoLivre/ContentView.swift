//
//  ContentView.swift
//  MercadoLivre
//
//  Created by Raphael Cerqueira on 18/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
                .background(Color(#colorLiteral(red: 0.9839407802, green: 0.8469364047, blue: 0.06334679574, alpha: 1)).edgesIgnoringSafeArea(.top))
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9839407802, green: 0.8469364047, blue: 0.06334679574, alpha: 1)), Color(#colorLiteral(red: 0.9625782371, green: 0.9626397491, blue: 0.9589756131, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                        
                        TabView {
                            ForEach(1..<8) { i in
                                Image("banner\(i)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width - 30)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    .frame(height: 100)
                    
                    MenuView()
                        .padding(.horizontal)
                    
                    CardView(title: "Visto recentemente", image: "keyboard", description: "Teclado Mecânico RGB para Computador - Pronta Entrega!", price: "R$ 250", payment: "12x R$ 20,82 sem juros")
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    CardView(title: "Oferta do dia", image: "tv", description: "Smart TV Samsung 55 TU7020 Crystal UHD 4k 2020 Bluetooth", price: "R$ 2.250", payment: "12x R$ 199,82 sem juros")
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                }
                .background(Color(#colorLiteral(red: 0.9625782371, green: 0.9626397491, blue: 0.9589756131, alpha: 1)))
            })
            .background(Color(#colorLiteral(red: 0.9839407802, green: 0.8469364047, blue: 0.06334679574, alpha: 1)))
        }
        .background(Color(#colorLiteral(red: 0.9625782371, green: 0.9626397491, blue: 0.9589756131, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HeaderView: View {
    @State var search = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Buscar no Mercado Livre", text: $search)
                    
                    Spacer()
                }
                .padding(.leading, 8)
                .foregroundColor(.gray)
                .frame(height: 45)
                .background(Capsule().foregroundColor(.white))
                .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0.0, y: 3)
                
                Button(action: {}, label: {
                    Image(systemName: "cart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35)
                        .foregroundColor(.black)
                })
                .padding(.leading)
            }
            .padding(.horizontal)
            
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "mappin")
                    
                    Text("Enviar para Raphael Cerqueira - Avenida Paulista")
                        .lineLimit(1)
                    
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.gray)
                .padding()
            })
        }
    }
}

struct MenuView: View {
    private let menuItems = [
        MenuItem(image: "qrcode", title: "Pagar com\ncódigo QR"),
        MenuItem(image: "tag", title: "Ofertas\ndo dia"),
        MenuItem(image: "bag", title: "Mercado"),
        MenuItem(image: "car", title: "Carros, motos\ne outros"),
        MenuItem(image: "plus", title: "Ver mais")
    ]
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(menuItems) { item in
                Button(action: {}, label: {
                    MenuItemView(item: item)
                        .frame(width: (UIScreen.main.bounds.width - 60) / CGFloat(menuItems.count))
                })
            }
        }
    }
}

struct CardView: View {
    var title: String
    var image: String
    var description: String
    var price: String
    var payment: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .fontWeight(.semibold)
                .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding()
                
                Text(description)
                    .fontWeight(.medium)
                
                Text(price)
                    .font(.title2)
                
                Text(payment)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.1941255331, green: 0.7167869806, blue: 0.4470788836, alpha: 1)))
            }
            .padding()
            
            Divider()
            
            Button(action: {}, label: {
                HStack {
                    Text("Ver histórico de navegação")
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.blue)
            })
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
