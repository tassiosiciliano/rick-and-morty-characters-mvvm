//
//  Services.swift
//  Rick and Morty Database
//
//  Created by Tassio Siciliano Donati on 15/04/20.
//  Copyright © 2020 Tassio Siciliano Donati. All rights reserved.
//

import Foundation
import UIKit

class Services {

    enum NetworkError: Error {
        case badUrl
        case badDataTask
    }
    
    func fetch<T: Decodable>(url: String, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.badDataTask))
                return
            }
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(.badDataTask))
            }
        }.resume()
    }
    
    //MARK: UIImage
    func fetch(url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completion(.success(image))
        }.resume()
    }
}
