//
//  Card.swift
//  FireCardsRep
//
//  Created by slava bily on 05.01.2021.
//

import Foundation
import FirebaseFirestoreSwift

struct Card: Identifiable, Codable {
    
    @DocumentID var id: String?
    var question: String
    var answer: String
    var hint: String
    var successful: Bool = true
    var userId: String?
    
}

#if DEBUG
let testData = (1...10).map { i in
    Card(question: "Question #\(i)", answer: "Answer #\(i)", hint: "Hint #\(i)")
}
#endif
