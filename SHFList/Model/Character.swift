//
//  Character.swift
//  SHFList
//
//  Created by Ronaldo Rendón Loja on 22/1/24.
//

import Foundation

class Character {
    var name: CharacterName
    var description: String
    
    init(name: CharacterName, description: String) {
        self.name = name
        self.description = description
    }
    
    func imageURL() -> URL? {
        return URL(string: name.rawValue)
    }
}
