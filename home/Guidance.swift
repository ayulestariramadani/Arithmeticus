//
//  Guidance.swift
//  home
//
//  Created by Adinda Dwi on 13/04/23.
//

import SwiftUI

struct Guidance: View {
    var body: some View {
        ZStack{
            Image("home")
                .resizable()
                .ignoresSafeArea()
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.gray)
                .opacity(0.7)
            TabView{
                GuideOne()
                GuideTwo()
                GuideThree()
            }
            .tabViewStyle(.page)
            .ignoresSafeArea()
        }
    }
}

struct Guidance_Previews: PreviewProvider {
    static var previews: some View {
        Guidance()
    }
}
