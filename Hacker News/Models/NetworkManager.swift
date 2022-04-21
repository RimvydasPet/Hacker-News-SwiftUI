//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Rimvydas Petniunas on 2022-04-21.
//

import Foundation

class NetworkManager: ObservableObject {
    
   @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?query=foo&tags=story") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeDate = data {
                        do {
                            let results = try decoder.decode(Result.self, from: safeDate)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            self.posts = results.hits
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
