//
//  FilmlerDaoRepository.swift
//  FilmlerApp
//
//  Created by Zeynep Sevgi on 5.11.2023.
//

import Foundation
import RxSwift

class FilmlerDaoRepository {
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    let db:FMDatabase?
    
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func filmlerYukle(){
        var liste = [Filmler]()
       // let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
       // let f2 = Filmler(id: 2, ad: "Intersteller", resim: "interstellar", fiyat: 32)
       // let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16)
       // let f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 40)
       // let f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18)
       // let f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10)
      //  liste.append(f1)
       // liste.append(f2)
        //liste.append(f3)
       // liste.append(f4)
       // liste.append(f5)
       // liste.append(f6)
        
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM filmler", values: nil)
            while rs.next() { //hep bir sonraki satırı getirir
                let film = Filmler(id: Int(rs.string(forColumn: "id"))!,
                                   ad: rs.string(forColumn: "ad")!,
                                   resim: rs.string(forColumn: "resim")!,
                                   fiyat: Int(rs.string(forColumn:"fiyat"))!)
                liste.append(film)
            }
            filmlerListesi.onNext(liste)
        }catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
