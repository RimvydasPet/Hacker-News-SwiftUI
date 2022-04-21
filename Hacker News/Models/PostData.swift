//
//  PostData.swift
//  Hacker News
//
//  Created by Rimvydas Petniunas on 2022-04-21.
//

import Foundation

struct Result: Decodable{
    let hits: [Post]
            
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
