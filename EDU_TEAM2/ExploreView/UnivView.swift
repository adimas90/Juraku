//
//  websiteView.swift
//  EDU_TEAM2
//
//  Created by Reinaldo Lordianto on 18/11/21.
//

import SwiftUI

struct websiteView: View {
    @ObservedObject var univ: UnivElement
    var body: some View {
        VStack{
            VStack{
                Image(univ.Universitas).resizable().scaledToFit().frame(width: 110, height: 110)
                Text(univ.Universitas).bold()
            }.padding()
            HStack{
                VStack{
                    HStack{
                        Image(systemName: "questionmark.circle").resizable().frame(width: 15, height: 15).foregroundColor(.gray)
                        Text("Tentang Kampus Ini").font(.system(size: 15)).foregroundColor(.gray)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text(univ.Tentang)
                    }
                    
                }.padding()
            }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10)

            
            HStack{
                VStack{
                    HStack{
                        Image(systemName: "books.vertical").resizable().frame(width: 15, height: 15).foregroundColor(.gray)
                        Text("Lokasi Kampus").font(.system(size: 15)).foregroundColor(.gray)
                        Spacer()
                    }
                    HStack{
                        Text(univ.Lokasi)
                        Spacer()
                    }.padding(.horizontal)
                    
                    
                }.padding()
            }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10)
            
            
            
            HStack{
                VStack{
                    HStack{
                        Image(systemName: "star.circle").resizable().frame(width: 15, height: 15).foregroundColor(.gray)
                        Text("Akreditasi").font(.system(size: 15)).foregroundColor(.gray)
                        Spacer()
                    }
                    HStack{
                        Text(univ.Akreditasi)
                        Spacer()
                        
                    }.padding(.horizontal)
                    
                    
                }.padding()
            }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10)
            
            
            HStack{
                VStack{
                    HStack{
                        Image(systemName: "globe").resizable().frame(width: 15, height: 15).foregroundColor(.gray)
                        Text("Website").font(.system(size: 15)).foregroundColor(.gray)
                        Spacer()
                    }
                    HStack{
                        Link(univ.Website, destination: URL(string: "\(univ.Website)") ?? URL(string: "www.google.com")!)
                        Spacer()
                    }.padding(.horizontal)
                    
                    
                }.padding()
            }.background(Color(hex: 0xFFFFFF)).cornerRadius(10).padding(.horizontal).padding(.bottom,10)
            
            
        }
    }
}


