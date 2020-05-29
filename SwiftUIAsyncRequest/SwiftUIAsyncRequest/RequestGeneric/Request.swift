//
//  Request.swift
//  SwiftUIAsyncRequest
//
//  Created by Pankaj Bhalala on 14/04/20.
//  Copyright © 2020 Solution Analysts. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class Resource<A>: ObservableObject {
    let didChange = PassthroughSubject<A?, Never>()
    let endpoint: Endpoint<A>
    var value: A? {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self.value)
            }
        }
    }
    init(endpoint: Endpoint<A>) {
        self.endpoint = endpoint
        reload()
    }
    func reload() {
        URLSession.shared.load(endpoint) { result in
            switch result {
            case .success(let a):
                self.value = try? result.get()
            case .failure(let error):
                print("Error:",error.localizedDescription)
            }
        }
    }
}

let baseURL = "https://jsonplaceholder.typicode.com/"

func getMethodRequest(endpoint: String) -> Endpoint<[User]> {
    let url = "\(baseURL)\(endpoint)"
    return Endpoint(json: .get, url: URL(string: url)!)
}
