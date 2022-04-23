//
//  ContentView.swift
//  BucketList
//
//  Created by Evi St on 4/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                let str = "Booboo test mesage"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do{
                    try str.write(to: url, atomically: true,encoding: .utf8)
                    
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
                
            }
    }
    
    func getDocumentsDirectory() -> URL {
        // returns user documets directory (for user for app)
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
