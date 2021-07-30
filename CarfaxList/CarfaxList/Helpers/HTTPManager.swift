//
//  HTTPManager.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 7/30/21.
//

import Foundation

final class HTTPManager {
    static let shared: HTTPManager = HTTPManager()

    enum HTTPError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    
    public func get(urlString: String, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionBlock(.failure(HTTPError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }

            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                    completionBlock(.failure(HTTPError.invalidResponse(data, response)))
                    return
            }

            completionBlock(.success(responseData))
        }
        .resume()
    }
}

