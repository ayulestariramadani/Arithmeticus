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
    @State private var reviewModal: Bool = false
    @State private var moveContent: Bool = false
    @State private var isShowingScreenshot = false
    var body: some View {
        ZStack{
            MainView(skipped: $buttonSkip, exitModal: $exitModal, reviewModal: $reviewModal)
            if reviewModal{
                ZStack{
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(.white)
//                        .opacity(0.7)
                    VStack {
                        Spacer()
                        
                        HStack(spacing: 40) {
                            Spacer()
                            Button(action: {
                                guard let image = captureScreen(),
                                      let fileURL = saveScreenshot(image)
                                else {
                                    return
                                }
                                self.isShowingScreenshot = true
                                print("Screenshot saved to: \(fileURL)")
                            }) {
                                Image(systemName: "square.and.arrow.down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.trailing)
                                    .frame(width: 45.0, height: 40.0)
                            }
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                        TabView {
                            Screen1()
                            Screen2()
                            Screen3()
                            
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        
                    }.background(Color("ThirdColor"))
                }
            }
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
                            moveContent.toggle()
                            exitModal.toggle()
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
            
            if moveContent{
                ContentView()
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

func captureScreen() -> UIImage? {
    guard let window = UIApplication.shared.windows.first else {
        return nil
    }
    let renderer = UIGraphicsImageRenderer(bounds: window.bounds)
    return renderer.image { _ in
        window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
    }
}

func saveScreenshot(_ image: UIImage) -> URL? {
    guard let data = image.jpegData(compressionQuality: 1.0),
          let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return nil
    }
    let fileURL = documentsDirectory.appendingPathComponent("aritmaticusscreenshot.jpg")
    do {
        try data.write(to: fileURL)
        return fileURL
    } catch {
        print("Error saving screenshot: \(error.localizedDescription)")
        return nil
    }
}

struct Guidance_Previews: PreviewProvider {
    static var previews: some View {
        Guidance()
    }
}
