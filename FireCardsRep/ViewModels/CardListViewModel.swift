//
//  CardListViewModel.swift
//  FireCardsRep
//
//  Created by slava bily on 05.01.2021.
//

import Foundation
import Combine

class CardListViewModel: ObservableObject {
    
    @Published var cardRepository = CardRepository()
    @Published var cardViewModels: [CardViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
      // 1
      cardRepository.$cards.map { cards in
        cards.map(CardViewModel.init)
      }
      .assign(to: \.cardViewModels, on: self)
      .store(in: &cancellables)
    }
    
    func add(_ card: Card) {
        cardRepository.add(card)
    }
}
