//
//  Network.swift
//  Star Wars Cats
//
//  Created by Brandon Jemison on 12/19/21.
//

import SwiftUI
import Foundation

class Network: ObservableObject {
    
    @Published var cats: [Cat] = []
    @Published var imageData: Data?
    
    func getCats() {
        guard let url = URL(string: "https://duet-public-content.s3.us-east-2.amazonaws.com/project.json") else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("There was an error with the request error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            DispatchQueue.main.async {
                do {
                    let decodedCats = try decoder.decode(Cats.self, from: data)
                    self.cats = decodedCats.results
                } catch let error {
                    print("Error decoding data: \(error)")
                }
            }
        }
        dataTask.resume()
    }
}




