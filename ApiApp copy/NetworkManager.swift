//
//  NetworkManager.swift
//  ApiApp
//
//  Created by admin on 31/01/25.
//

import Foundation
import Combine


struct User:Codable,Identifiable {
    let id:Int
    let name:String
    let email:String
    
}


class NetworkManager : ObservableObject {
    @Published var  users:[User] = []
    private var cancellable:AnyCancellable?
    
    func fetchuser()
    {
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/users") else
        {
            print("error invalid url")
            return
        }
        cancellable = URLSession.shared.dataTaskPublisher(for: url).map {$0.data}
            .decode(type: [User].self, decoder: JSONDecoder())
         //   .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                cat in
                switch cat{
                case .finished:
                    break
                case.failure(let error):print("fdetching problem\(error)")
                }
            },receiveValue: {[ self ] users in self.users = users})
    }
    
    deinit
    {
        cancellable?.cancel()
    }
    
}
