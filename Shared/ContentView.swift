//
//  ContentView.swift
//  Shared
//
//  Created by nyannyan0328 on 2021/11/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct SplashScreen : View{
    
    @State var startAnimation : Bool = false
    @State var removeSplash : Bool = false
    @Environment(\.colorScheme) var scheme
    
    var body: some View{
        
        ZStack{
            
            Image(scheme == .dark ? "HomeDark" : "HomeLight")
                .resizable()
                .opacity(startAnimation ? 1 : 0)
                .statusBar(hidden: true)
            
            if !removeSplash{
                
                
                Color("BG")
                
                
                    .mask(
                    
                        Rectangle()
                              .overlay(
                                  Image("p1")
                                      .resizable()
                                      .aspectRatio(contentMode: .fit)
                                      .frame(width: 80, height: 80)
                                      .scaleEffect(startAnimation ? 35 : 1)
                                      .blendMode(.destinationOut)
                                  
                              
                              )
                    )
            
                
                
            }
            
            
            
          
            
            
        }
        .preferredColorScheme(startAnimation ? nil : .light)
        .ignoresSafeArea()
        .onAppear {
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                
                
                withAnimation(.easeOut(duration: 1).speed(0.7)){
                    
                    startAnimation.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    
                    removeSplash.toggle()
                }
            }
        }
        
    }
}
