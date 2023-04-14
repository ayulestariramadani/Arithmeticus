//
//  ExitModal.swift
//  home
//
//  Created by Ayu Lestari Ramadani on 14/04/23.
//

import SwiftUI

struct ExitModal: View {
    var body: some View {
        ZStack{
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
                    Button( action:{print("Button Pressed!")},
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
                    
                    Button( action:{print("Button Pressed!")},
                            
                    
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
    }
}

struct ExitModal_Previews: PreviewProvider {
    static var previews: some View {
        ExitModal()
    }
}
