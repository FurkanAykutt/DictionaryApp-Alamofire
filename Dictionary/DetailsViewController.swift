//
//  DetailsViewController.swift
//  Dictionary
//
//  Created by Ebubekir Aykut on 22.11.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var ingilizceDetay: UILabel!
    @IBOutlet weak var turkceDetay: UILabel!
    
    var gelenKelime:Kelimeler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ingilizceDetay.text = gelenKelime?.ingilizce
        turkceDetay.text = gelenKelime?.turkce
    }
    


}
