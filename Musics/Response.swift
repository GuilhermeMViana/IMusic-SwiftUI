//
//  Response.swift
//  Musics
//
//  Created by Guilherme Muniz Viana on 23/02/26.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
