//
//  Filmler.swift
//  FilmlerApp
//
//  Created by Zeynep Sevgi on 27.10.2023.
//

import Foundation
class Filmler: Codable { //burada ise web servisin iç kısmına uygun JSON a uygun yazdık 
    var id: Int?
    var ad: String?
    var resim: String?
    var fiyat: Int?
    
    init(){
        
    }
    init(id: Int, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
}
