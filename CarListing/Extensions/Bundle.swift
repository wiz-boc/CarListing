//
//  Bundle.swift
//  CarListing
//
//  Created by wizz on 9/11/22.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T?{
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            print("couldnt not get URL")
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            print("couldnt not get Data")
            return nil
        }
        let decoder = JSONDecoder()
        let output = try? decoder.decode(T.self, from: data)
        return output
    }
    
}
