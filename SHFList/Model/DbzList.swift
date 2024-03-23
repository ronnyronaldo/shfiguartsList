//
//  DbzList.swift
//  SHFList
//
//  Created by Ronaldo Rendón Loja on 22/1/24.
//

import Foundation

class DbzList {
    var characters: [Character]
    
    init(characters: [Character]) {
        self.characters = characters
        
        // Configura el tamaño máximo de la caché en 100 MB
        let cacheSizeMemory = 100 * 1024 * 1024 // 100 MB
        let cache = URLCache(memoryCapacity: cacheSizeMemory, diskCapacity: 0, diskPath: nil)
        URLCache.shared = cache
    }
    
    func getCharacter(at index: Int) -> Character? {
        guard index >= 0 && index < characters.count else {
            return nil
        }
        return characters[index]
    }
}
