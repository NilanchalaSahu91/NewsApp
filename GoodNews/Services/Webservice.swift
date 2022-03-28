//
//  Webservice.swift
//  GoodNews
//
//  Created by Nilanchala on 27/03/22.
//  Copyright © 2022 Nilanchala. All rights reserved.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                
               // print(articleList?.articles)
                                
            }
            
        }.resume()
        
    }
    
}
