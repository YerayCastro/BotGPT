//
//  ContentView.swift
//  BotGPT
//
//  Created by Yery Castro on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var texto = ""
    @StateObject var bot = BotViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Pregunta", text: $texto)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    bot.getResponse(texto: texto)
                } label: {
                    Text("Preguntar")
                }
                
                ScrollView{
                    Text(bot.resultado)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(Int.max)
                }
                Spacer()

            }.padding(.all)
                .navigationTitle("Bot GPT")
        }
    }
}


