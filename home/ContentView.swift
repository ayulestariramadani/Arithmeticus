//
//  ContentView.swift
//  home
//
//  Created by Adinda Dwi on 01/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var ChangeScreen: Bool = false
    var body: some View {
        
        return Group {
            if ChangeScreen{
                Guidance()
            }else{
                ZStack {
                    Image("home")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 400.0, height: 500.0).position(x: 200.0, y: 370.0)
                    
                    
                    VStack{
                        Text("ARITMATICUS")
                            .font(.system(size: 45, design: .monospaced))
                            .fontWeight(.bold)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .overlay{
                                Circle().stroke(.gray, lineWidth: 4)
                            }
                        
                        Button( action:{
                            withAnimation{
                                self.ChangeScreen = true
                            }
                           
                        
                            
                        },label:{Text("Mulai")
                                .font(.system(size: 32, design: .monospaced))
                                .fontWeight(.bold)
                                .padding(.horizontal, 40)
                                .frame(height: 60)
                                .background(Color("complementary color"))
                                .foregroundColor(.white)
                                .tint(.orange)
                                .cornerRadius(15)
                        })
                    }
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

