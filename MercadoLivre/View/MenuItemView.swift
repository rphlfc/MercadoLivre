//
//  MenuItemView.swift
//  MercadoLivre
//
//  Created by Raphael Cerqueira on 18/03/21.
//

import SwiftUI

struct MenuItemView: View {
    var item: MenuItem
    
    private let size: CGFloat = 70
    
    var body: some View {
        VStack {
            Image(systemName: item.image)
                .font(.system(size: 27))
                .frame(width: size, height: size)
                .background(Circle().foregroundColor(Color.white))
                .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 3)
            
            Text(item.title)
                .font(.system(size: 13))
                .multilineTextAlignment(.center)
                .padding(.top, 8)
        }
        .foregroundColor(.gray)
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: MenuItem(image: "qrcode", title: "Pagar com código QR"))
    }
}
