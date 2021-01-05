//
//  CardRepository.swift
//  FireCardsRep
//
//  Created by slava bily on 05.01.2021.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class CardRepository: ObservableObject {
    
    private let path: String = "cards"
    
    private let store = Firestore.firestore()
    
    func add(_ card: Card) {
        do {
            _ = try store.collection(path).addDocument(from: card)
        } catch {
            fatalError("Unable to add card: \(error.localizedDescription).")
        }
    }
}
