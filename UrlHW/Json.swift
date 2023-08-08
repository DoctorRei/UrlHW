//
//  Json.swift
//  UrlHW
//
//  Created by Акира on 05.08.2023.
//


struct ModelJSon: Decodable {
    
    let url: String
    let artist: String?
    let artist_url: String?
    let source_url: String?
    let error: String?
    
}
