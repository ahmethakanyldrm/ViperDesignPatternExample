//
//  HomeInteractor.swift
//  ViperSwift
//
//  Created by AHMET HAKAN YILDIRIM on 6.08.2023.
//

import Alamofire
import Foundation

class HomeInteractor {
    
    // TODO: Async await
    func fetchCats(url: String, onResponse: @escaping (Result<[Cat], Error>)-> Void) {
        // TODO: 1 return success
        AF.request(url, method: .get).validate().responseDecodable(of: [Cat].self) { response in
            guard let model = response.value else {
                guard let error = response.error else {
                    return
                }
                onResponse(.failure(error))
                return
               
            }
            onResponse(.success(model))
        }
    }
}

enum ServicePath: String {
    case http = "http.json"
}
