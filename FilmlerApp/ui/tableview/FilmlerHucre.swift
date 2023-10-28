//
//  FilmlerHucre.swift
//  FilmlerApp
//
//  Created by Zeynep Sevgi on 27.10.2023.
//

import UIKit
protocol HucreProtocol {
    func sepeteEkleTikle(indexPath: IndexPath)
}

class FilmlerHucre: UICollectionViewCell {
    
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    
    var hucreProtocol: HucreProtocol?
    var indexPath: IndexPath?
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTikle(indexPath: indexPath!)
    }
    
}
