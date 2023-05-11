//
//  File.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 10/05/2023.
//
/*
import Foundation

protocol PresenterProtocol {
    func fetchDataFromAPI()
}

class Presenter: PresenterProtocol {
    private let networkManager: NetworkManagerProtocol
    private var data: [String: Any] = [:]

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchDataFromAPI() {
        networkManager.fetchDataFromAPI { [weak self] result in
            switch result {
            case .success(let data):
                self?.data = data
                print("Data received from API: \(data)")

                // Prepare data if necessary
                // ...
                // Pass data to completion block
                // ...
            case .failure(let error):
                // Handle error
                // ...
                break
            }
        }
    }
}

*/
