//
//  AnasayfaViewModel.swift
//  FilmlerApp
//
//  Created by Zeynep Sevgi on 5.11.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())

    var frepo = FilmlerDaoRepository()
    init(){
        filmlerListesi = frepo.filmlerListesi
        filmlerYukle()
    }
    func filmlerYukle(){
        frepo.filmlerYukle()
    }
}
