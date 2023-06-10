//
//  BotViewModel.swift
//  BotGPT
//
//  Created by Yery Castro on 11/3/23.
//

import Foundation
import OpenAISwift

class BotViewModel: ObservableObject {
    
    @Published var resultado = ""
    var client: OpenAISwift?
    
    init(){
       setup()
    }
    func setup(){
        client = OpenAISwift(authToken: "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")
    }
    func getResponse(texto: String){
        client?.sendCompletion(with: texto, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                DispatchQueue.main.async {
                    self.resultado = output
                }
            case .failure(let error):
                print("Falló el bot",error.localizedDescription)
            }
        })
    }
    
}
