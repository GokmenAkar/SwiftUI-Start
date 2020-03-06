//
//  Service.swift
//  SwiftUI-Start
//
//  Created by Developer on 6.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import Combine

class Service {
    static let shared = Service()
    
    let api = "https://poised-echinacea-q201xlcpzr.glitch.me/top-news"
    
    var cancellable: AnyCancellable?
    @Published var message: String? = ""
    
    private init() {
        
    }
    
    func getRequest<T: Codable>(request: BaseServiceRequest<T>,completion: @escaping ([T]?, Error?) -> Void) {
        let url: URL = URL(string: api)!
        let request = URLRequest(url: url)
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] (completion) in
                self?.message = try? completion.error().localizedDescription
                print(self?.message ?? "")
                }, receiveValue: { (response) in
                    print(response)
            })
    }
}

extension Subscribers.Completion {
    func error() throws -> Failure {
        if case let .failure(error) = self {
            return error
        }
        throw ErrorFunctionThrowsError.error
    }
    
    private enum ErrorFunctionThrowsError: Error {
        case error
    }
    
}
