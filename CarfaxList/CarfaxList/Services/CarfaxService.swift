//
//  CarfaxService.swift
//  CarfaxList
//
//  Created by Khatib on 7/30/21.
//

import Foundation

enum CarfaxAPI  {
    static let host: String = "carfax-for-consumers.firebaseio.com"
    enum EndPoints {
        static let sampleListing = "/assignment.json"
    }
}

protocol CarfaxAPI_Protocol {
    func fetchSampleListing(completion: @escaping (Result<[Vehicle], Error>) -> Void)
}

class CarfaxService: CarfaxAPI_Protocol {
    
    private let httpManager: HTTPManager
    private let jsonDecoder: JSONDecoder
    
    init(httpManager: HTTPManager = HTTPManager.shared) {
        self.httpManager = httpManager
        self.jsonDecoder = JSONDecoder()
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    struct VehicleListingsResponseBody: Codable {
            let listings: [Vehicle]
    }
    
    func fetchSampleListing(completion: @escaping (Result<[Vehicle], Error>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = CarfaxAPI.host
        urlComponents.path = CarfaxAPI.EndPoints.sampleListing
        
        httpManager.get(urlString: urlComponents.url!.absoluteString) { result in
                switch result {
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            case .success(let data):
                print(data)
                completion(Result(catching: { try self.jsonDecoder.decode(VehicleListingsResponseBody.self, from: data).listings }))
            }
        }
    }
}
