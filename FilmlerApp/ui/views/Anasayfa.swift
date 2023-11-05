//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Zeynep Sevgi on 27.10.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmlerCollectionView.dataSource = self
        filmlerCollectionView.delegate = self
        _ = viewModel.filmlerListesi.subscribe(onNext: { liste in
            self.filmlerListesi = liste
            self.filmlerCollectionView.reloadData()
        })
                  
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //çevre boşlukları
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        //tasarımı ortaladık ekranı ikiye böldük
        //10x10x10 = 30
        //15x10x10x15 = 50 50 için 30 yerine 50 ve 3 e böl
        let ekranGenislik = UIScreen.main.bounds.width //bulunduğumuz ekranın genişliği
        let itemGenislik = (ekranGenislik - 30) / 2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.6)
        filmlerCollectionView.collectionViewLayout = tasarim
        
                                                                                             
    }


}
extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource , HucreProtocol{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        hucre.imageViewFilm.image = UIImage(named: film.resim!)
        hucre.labelFiyat.text = "\(film.fiyat!) ₺"
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10.0
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath

        return hucre
    }
    //seçtiğimiz filmi bana veriyor
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let film = sender as? Filmler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.film = film
            }
        }
    }
    func sepeteEkleTikle(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.ad) ürün sepete eklendi")
    }
    
    
}

