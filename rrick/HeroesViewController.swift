//
//  HeroesViewController.swift
//  rrick
//
//  Created by Andrew on 03/10/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class HeroesViewController: UITableViewController {
    
    private let url = "https://rickandmortyapi.com/api/character/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.clear
        navigationController?.navigationBar.isHidden = true
    }

    
    var allHeroes2:[Hero] = []
    
    func fetchData() {
        guard let url = URL(string: url) else {return}
       
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let rim = try JSONDecoder().decode(Heroes.self, from: data)
                
                self.allHeroes2 = rim.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch  let error {
                print("Error total fuckup with serialization ", error)
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("heroes count: \(allHeroes2.count)")
        return allHeroes2.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let hero = allHeroes2[indexPath.row]
        
        cell.heroName.text = hero.name
        cell.heroInfo1.text = hero.species
        cell.heroInfo2.text = hero.status
        cell.heroInfo3.text = hero.gender
        
        DispatchQueue.global(qos: .background).sync {
      
            let imageUrl = URL(string: hero.image)
            let imagedata = try? Data(contentsOf: imageUrl!)
            cell.heroImage.image = UIImage(data: imagedata!)
        }
        
        return cell
    }
}
