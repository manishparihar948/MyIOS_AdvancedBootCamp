//
//  NewMockDataService.swift
//  SwiftAdvancedLearning
//
//  Created by Manish Parihar on 07.08.23.
//

import Foundation
import SwiftUI
import Combine


protocol NewDataServiceProtocol {
    func downloadItemsWithEscaping(completing: @escaping (_ items:[String]) -> ())
    func downloadItemsWithCombine() -> AnyPublisher<[String], Error>
}

class NewMockDataService : NewDataServiceProtocol {
    
    let items: [String]
    
    init(items: [String]?) {
        self.items = items ?? [
            "One", "Two", "Three"
        ]
    }
    
    func downloadItemsWithEscaping(completing: @escaping (_ items:[String]) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            completing(self.items)
        }
    }
    
    func downloadItemsWithCombine() -> AnyPublisher<[String], Error> {
        Just(items)
            .tryMap({ publishedItems in
                guard !publishedItems.isEmpty else {
                    throw URLError(.badServerResponse )
                }
                return publishedItems
            })
            .eraseToAnyPublisher()
    }
    
}
