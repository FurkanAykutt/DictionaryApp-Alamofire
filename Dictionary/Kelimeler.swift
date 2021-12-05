//
//  Kelimeler.swift
//  Dictionary
//
//  Created by Ebubekir Aykut on 22.11.2021.
//

import Foundation
class Kelimeler:Codable {
    var kelime_id : String?
    var ingilizce : String?
    var turkce : String?
    
    init(){
        
    }
    
    init(kelime_id : String,ingilizce : String,turkce : String){
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
}
