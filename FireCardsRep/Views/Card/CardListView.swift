//
//  CardListView.swift
//  FireCardsRep
//
//  Created by slava bily on 05.01.2021.
//

import SwiftUI

struct CardListView: View {
    
    @ObservedObject var cardListViewModel = CardListViewModel()
    @State var showForm = false
    
    var body: some View {
      NavigationView {
        VStack {
          Spacer()
          VStack {
            GeometryReader { geometry in
              ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(cardListViewModel.cardViewModels) { cardViewModel in
                      CardView(cardViewModel: cardViewModel)
                        .padding([.leading, .trailing])
                    }
                }.frame(height: geometry.size.height)
              }
            }
          }
          Spacer()
        }
        .sheet(isPresented: $showForm) {
          NewCardForm(cardListViewModel: CardListViewModel())
        }
        .navigationBarTitle("🔥 Fire Cards")
          // swiftlint:disable multiple_closures_with_trailing_closure
          .navigationBarItems(trailing: Button(action: { showForm.toggle() }) {
            Image(systemName: "plus")
              .font(.title)
          })
      }
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }

  struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
      CardListView(cardListViewModel: CardListViewModel())
    }
  }
