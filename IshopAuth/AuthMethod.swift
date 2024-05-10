//
//  AuthMethod.swift
//  IshopAuth
//
//  Created by Santiago Benítez Arenas on 6/05/24.
//

import Foundation


protocol AuthMethod {
    
    func signIn() -> Void
    
    func getToken() -> String
    
    func signUp() -> Void
    
}
