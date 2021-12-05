//
//  ViewController.swift
//  Dictionary
//
//  Created by Ebubekir Aykut on 22.11.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var kelimeListesi = [Kelimeler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
    
        tumKelimelerAl()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let destinationVC = segue.destination as! DetailsViewController
        destinationVC.gelenKelime = kelimeListesi[indeks!]
    }
    
    func tumKelimelerAl(){
        
        AF.request("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php",method: .get).responseJSON {
            response in
            
            if let data  = response.data {
                
                do {
                    
                    let cevap = try JSONDecoder().decode(KelimelerCevap.self, from: data)
                    
                    if let gelenListe = cevap.kelimeler{
                        
                        self.kelimeListesi = gelenListe
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                       
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
    
    func aramaYap(arananKelime:String){
        
        let parametreler:Parameters = ["ingilizce":"\(arananKelime)"]
        
        AF.request("http://kasimadalan.pe.hu/sozluk/kelime_ara.php",method: .post,parameters: parametreler).responseJSON { response in
            
            if let data  = response.data {
                
                do {
                    
                    let cevap = try JSONDecoder().decode(KelimelerCevap.self, from: data)
                    
                    if let gelenListe = cevap.kelimeler{
                        
                        self.kelimeListesi = gelenListe
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kelimeListesi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kelime = kelimeListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.ingilizceLabel.text = kelime.ingilizce
        cell.turkceLabel.text = kelime.turkce
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: indexPath.row)
    }
}



extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        aramaYap(arananKelime: searchText)
    }
}
