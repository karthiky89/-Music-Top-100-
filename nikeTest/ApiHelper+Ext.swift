//
//  ApiHelper+Ext.swift
//  nikeTest
//
//  Created by karthik yalamanchili on 5/4/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import Foundation

enum apiError:Error {
    case noData
    case badData
}


struct appleRequest {
    
    let resourceURL :URL
    
    init() {
        
        let resourceString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
        guard let resourceURL = URL(string: resourceString)  else {fatalError()}
        self.resourceURL = resourceURL
        
    }
    
    
    func fetchData(completion: @escaping (Result<[AlbumInfo],apiError>) ->Void ) {
        let dataTask =  URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let JsonData = data else   {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder ()
                let acquiredResponse = try decoder.decode(Apifeed.self, from: JsonData)
                let responseDetails = acquiredResponse.feed?.results
                completion(.success(responseDetails!))
                print(responseDetails!)
            }catch{
                completion(.failure(.badData))
            }
        }
        dataTask.resume()
    }
}



