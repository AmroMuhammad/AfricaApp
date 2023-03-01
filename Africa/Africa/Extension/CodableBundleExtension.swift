//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Amr Muhammad on 01/03/2023.
//

import Foundation

extension Bundle{
    
    func decode<T: Codable>(_ file : String) -> T{
        // 1. locate json file
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        // 2. create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to convert data of \(file)")
        }
        
        // 3. crate a decoder
        let decoder = JSONDecoder()
        
        // 4. create a property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode data of \(file)")
        }
        
        // 5. return the ready to use data
        return decodedData
    }
}
