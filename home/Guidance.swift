//
//  Guidance.swift
//  home
//
//  Created by Adinda Dwi on 13/04/23.
//

import SwiftUI

struct Guidance: View {
    @State private var buttonSkip: Bool = true
    var body: some View {
        ZStack{
            MainView()
            if buttonSkip{
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
                VStack{
                    Button("Skip") {
                        buttonSkip.toggle()
                    }
                    Spacer()
                }
            }
            
        }
    }
}

struct Guidance_Previews: PreviewProvider {
    static var previews: some View {
        Guidance()
    }
}
