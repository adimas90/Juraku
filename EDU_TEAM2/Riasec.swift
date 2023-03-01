//
//  Riasec.swift
//  EDU_TEAM2
//
//  Created by Reinaldo Lordianto on 05/11/21.
//

import SwiftUI

struct BottomViewRiasec: View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        NavigationView{
            ScrollView{
                VStack{
                    
                    HStack(spacing: 15){
                        VStack{
                            
                        }.frame(width: 83, height: 98)
                            .background(Image("Realistic_Crop").resizable().scaledToFill())
                        VStack{
                            HStack{
                                Text("Realistic (R)").bold()
                                Spacer()
                            }
                            HStack{
                                Text("Tipe yang pertama ini memiliki kecenderungan berorientasi pada penerapan yang teratur dan sistematis. Kamu menyukai tugas-tugas yang konkrit, praktis, mengutamakan keterampilan fisik, dan kekuatan otot.").font(.system(size: 11))
                                Spacer()
                            }
                            
                        }
                    }.padding()
                    HStack(spacing: 15){
                        VStack{
                           
                        }.frame(width: 83, height: 98)
                            .background(Image("Investigative_Crop").resizable().scaledToFill())
                        VStack{
                            HStack{
                                Text("Investigative (I)").bold()
                                Spacer()
                            }
                            HStack{
                                Text("Pada tipe ini kamu memiliki kecenderungan untuk memilih pekerjaan yang bersifat akademik dan intelektual. Kamu akan menyukai tugas-tugas yang abstrak, membutuhkan inteligensi dan kreativitas yang tinggi.").font(.system(size: 11))
                                Spacer()
                            }
                            
                        }
                    }.padding()
                    
                    HStack(spacing: 15){
                        VStack{
                            
                        }.frame(width: 83, height: 98)
                            .background(Image("Artistic_Crop").resizable().scaledToFill())
                        VStack{
                            HStack{
                                Text("Artistic (A)").bold()
                                Spacer()
                            }
                            HStack{
                                Text("Tipe kepribadian ini memiliki kecenderungan untuk menjalin hubungan dengan orang lain secara gak langsung, dan juga mengalami kesulitan untuk menyesuaikan diri. Kamu akan menyukai tugas-tugas yang berkaitan dengan hal-hal yang membutuhkan interpretasi atau kreasi melalui perasaan dan imajinasi.").font(.system(size: 11))
                                Spacer()
                            }
                            
                        }
                    }.padding()
                    
                    HStack(spacing: 15){
                        VStack{
                            
                        }.frame(width: 83, height: 98)
                            .background(Image("Social_Crop").resizable().scaledToFill())
                        VStack{
                            HStack{
                                Text("Social (S)").bold()
                                Spacer()
                            }
                            HStack{
                                Text("Sesuai dengan namanya, tipe kepribadian yang satu ini dikenal sebagai “Helpers”. Tipe ini memiliki kecenderungan untuk membantu dan mementingkan orang lain. Kamu juga menyukai membangun hubungan dengan banyak orang, dan berkomunikasi merupakan kelebihan yang kamu miliki.").font(.system(size: 11))
                                Spacer()
                            }
                            
                        }
                    }.padding()
                    
                    
                    HStack(spacing: 15){
                        VStack{
                           
                        }.frame(width: 83, height: 98)
                            .background(Image("Enterprising_Crop").resizable().scaledToFill())
                        VStack{
                            HStack{
                                Text("Enterprising (E)").bold()
                                Spacer()
                            }
                            HStack{
                                Text("Tipe kepribadian ini adalah tipe yang paling menyukai kegiatan membujuk orang lain. Kamu paling jago untuk mengajak, menawarkan, dan merayu lawan bicaramu. Kelebihanmu adalah kamu mampu menyampaikan sesuatu secara efektif dan menarik, hingga dapat memengaruhi orang lain.").font(.system(size: 11))
                                Spacer()
                            }
                            
                        }
                    }.padding()
                    
                    
                    HStack(spacing: 15){
                        VStack{
                            
                        }.frame(width: 83, height: 98)
                            .background(Image("Conventional_Crop").resizable().scaledToFill())
                        VStack{
                            HStack{
                                Text("Conventional (C)").bold()
                                Spacer()
                            }
                            HStack{
                                Text("Tipe kepribadian yang terakhir cenderung menyukai kegiatan yang teratur dan terorganisir. Kamu menyukai menjalani sehari-hari dengan rutinitas yang jelas, dengan jadwal-jadwal yang tersusun rapi.").font(.system(size: 11))
                                Spacer()
                            }
                            
                        }
                    }.padding()
                }
            }.navigationBarItems(trailing: Button("Selesai"){
                self.presentationMode.wrappedValue.dismiss()
            })
            .navigationBarTitleDisplayMode(.inline).navigationTitle("RIASEC")
            //                .toolbar{
            //                    Button("Selesai"){
            //
            //                    }
            //                }
        }
        
    }
}

