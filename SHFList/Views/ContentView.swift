//
//  ContentView.swift
//  SHFList
//
//  Created by Ronaldo Rendón Loja on 22/1/24.
//

import AVFoundation
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            
            VStack {
                NavigationView {
                    Image("vegeta")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            VStack {
                                NavigationLink(destination: ShfDbzView(isAcquired: true)) {
                                    Text("Yala")
                                        .foregroundColor(.white)
                                        .padding()
                                        .font(.custom("PressStart2P", size: 16))
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.brown)
                                        )
                                        .cornerRadius(15)
                                }
                                .padding(.bottom, 20)
                                
                                NavigationLink(destination: ShfDbzViewNo(isAcquired: false)) {
                                    Text("Nola")
                                        .foregroundColor(.white)
                                        .padding()
                                        .font(.custom("PressStart2P", size: 16))
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.brown)
                                        )
                                        .cornerRadius(15)
                                }
                            }
                                .navigationTitle("Menú Principal")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.clear)
                        )
                }
                .onAppear {
                    let appearance = UINavigationBarAppearance()
                    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
                    appearance.backgroundColor = .clear 
                    
                    UINavigationBar.appearance().standardAppearance = appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
