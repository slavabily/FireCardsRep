//
//  AuthenticationService.swift
//  FireCardsRep
//
//  Created by slava bily on 06.01.2021.
//

import Foundation
import Firebase

class AuthenticationService: ObservableObject {
    
    @Published var user: User?
    private var authenticationStateHandler: AuthStateDidChangeListenerHandle?
    
    init() {
        addListeners()
    }
    
    static func signIn() {
        if Auth.auth().currentUser == nil {
          Auth.auth().signInAnonymously()
        }
    }
    
    private func addListeners() {
        
        if let handle = authenticationStateHandler {
          Auth.auth().removeStateDidChangeListener(handle)
        }
        
        authenticationStateHandler = Auth.auth()
              .addStateDidChangeListener { _, user in
                self.user = user
              }
    }
}
