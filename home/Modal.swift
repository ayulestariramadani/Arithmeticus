//
//  ExitModal.swift
//  home
//
//  Created by Ayu Lestari Ramadani on 14/04/23.
//

import SwiftUI

struct Modal: View {
    var body: some View {
        ZStack{
            Image("latar")
                .resizable()
                .ignoresSafeArea()
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.gray)
                .opacity(0.7)
            TabView{
               ExitModal()
            }
            .tabViewStyle(.page)
            .ignoresSafeArea()
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal()
    }
}
