//
//  Response.swift
//  Musics
//
//  Created by Guilherme Muniz Viana on 23/02/26.
//

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var artistName: String
    var trackName: String
    var collectionName: String
}
