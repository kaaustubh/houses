//
//  PostsService.swift
//  Audi_list
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import Foundation

class HousesService {
    
    private let client = NetworkEngine(baseUrl: "https://anapioficeandfire.com")
    
    @discardableResult
    func getHouses(completion: @escaping ([House]?, CustomError?) -> ()) -> URLSessionDataTask? {
        
        return client.load(path: "/api/houses/", method: .get, params: [:]) { result, nError in
            if (nError != nil) {
//                do {
//                    //let products = try LocalStorage().retriveProducts()
//                    completion(products, nil)
//                }
//                catch {
//
//                }
                completion(nil, nError)
                
            }
        
            else if (result != nil) {
                do {
                    let houses = try JSONDecoder().decode([House].self, from: result as! Data)
//                    try LocalStorage().save(products: products)
                    completion(houses, nil)
                } catch {
                    print(error)
                    completion(nil, CustomError(code: 405, type: "NoResult", message: "No results found"))
                }
            }
            else {
//                do {
//                    let products = try LocalStorage().retriveProducts()
//                    completion(products, nil)
//                }catch {
//                    completion(nil, CustomError(code: 405, type: "NoResult", message: "No results found"))
//                }
                completion(nil, CustomError(code: 405, type: "NoResult", message: "No results found"))
                
            }
        }
    }
}
