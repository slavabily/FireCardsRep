//
//  CardViewModel.swift
//  FireCardsRep
//
//  Created by slava bily on 05.01.2021.
//

import Foundation
import Combine

class CardViewModel: ObservableObject, Identifiable {
    
    private let cardRepository = CardRepository()
    @Published var card: Card
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(card: Card) {
        self.card = card
        // 5
        $card
          .compactMap { $0.id }
          .assign(to: \.id, on: self)
          .store(in: &cancellables)
    }
    
    func update(card: Card) {
      cardRepository.update(card)
    }
    
    func remove() {
      cardRepository.remove(card)
    }
}
