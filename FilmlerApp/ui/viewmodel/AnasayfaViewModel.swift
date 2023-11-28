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
        veritabaniKopyala()
        filmlerListesi = frepo.filmlerListesi
        filmlerYukle()
    }
    func filmlerYukle(){
        frepo.filmlerYukle()
    }
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "filmler_app", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch{}
        }
    }
}
