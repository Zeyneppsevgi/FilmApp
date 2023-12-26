//
//  FilmlerCevap.swift
//  FilmlerApp
//
//  Created by Zeynep Sevgi on 26.12.2023.
//

import Foundation
//json dosyasından web servisi yazdık bu formata göre bu en dış kısım 
class FilmlerCevap : Codable {
    var filmler:[Filmler]?
    var success:Int?
}
