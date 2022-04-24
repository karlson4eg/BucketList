//
//  ContentView.swift
//  BucketList
//
//  Created by Evi St on 4/23/22.
//
import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    
    
    var body: some View {
        VStack{
            if isUnlocked{
                Text("Unclocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    // good to go
                    isUnlocked = true
                    
                } else {
                    // mask on
                    
                }
                
            }
        } else {
            // no biometrics
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
