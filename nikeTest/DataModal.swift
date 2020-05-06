//
//  DataModal.swift
//  nikeTest
//
//  Created by karthik yalamanchili on 5/4/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import Foundation

// struct to parse response

struct Apifeed:  Decodable {
    
    var feed : ApiResults?
}


struct ApiResults: Decodable {
    
    var results : [AlbumInfo]?
}

struct AlbumInfo: Decodable {
    
    var artistName : String?
    var name : String?
    var copyright : String?
    var releaseDate :  String?
    var url : String?
    var artworkUrl100 :  String?
    var genres : [GenreType]?
    
}

struct GenreType : Decodable {
    
    var name : String?
}
