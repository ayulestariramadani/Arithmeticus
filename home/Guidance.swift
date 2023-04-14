//
//  Guidance.swift
//  home
//
//  Created by Adinda Dwi on 13/04/23.
//

import SwiftUI

struct Guidance: View {
    @State private var buttonSkip: Bool = true
    @State private var exitModal: Bool = false
    @Binding var changeScreen:Bool
    var body: some View {
        ZStack{
            MainView(skipped: $buttonSkip, exitModal: $exitModal)
            
            if exitModal{
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.gray)
                    .opacity(0.7)
                Rectangle()
                    .frame(width: 350.0, height: 220.0)
                    .cornerRadius(15)
                    .foregroundColor(Color("main color"))
                VStack {
                    Text("Apakah anda ingin keluar?")
                        .font(.system(size: 26, design: .monospaced))
                        .fontWeight(.bold)
                        .lineSpacing(5)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack {
                        Button( action:{exitModal=false},
                                label:{Text("\(Image(systemName: "moonphase.waxing.gibbous.inverse")) Tidak")
                                .frame(width: 150, height: 50)
                                .font(.system(size: 26, design: .monospaced))
                                .fontWeight(.bold)
    //                            .padding(.horizontal, 30)
    //                            .frame(height: 60)
                                .background(Color("secondary color"))
                                .opacity(0.7)
                                .foregroundColor(.white)
                        
                                
                        })
                        
                        Button( action:{
                            ContentView()
                            
                        },
                                
                        
                        label:{Text("Iya \(Image(systemName: "globe.asia.australia.fill"))")
                                .frame(width: 150, height: 50)
                                .font(.system(size: 26, design: .monospaced))
                                .fontWeight(.bold)
    //                            .padding(.horizontal, 30)
    //                            .frame(height: 60)
                                .background(Color("complementary color"))
                                .foregroundColor(.white)
                            }
                        )
                    }.cornerRadius(30)
                }
            }
            
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
        Guidance(changeScreen: .constant(false))
    }
}
