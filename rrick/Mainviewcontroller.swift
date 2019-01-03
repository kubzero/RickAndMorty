//
//  Mainviewcontroller.swift
//  rrick
//
//  Created by Andrew on 03/10/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

enum Actions: String, CaseIterable {
    case downloading = "Rick Photo"
    case checkHeroes = "Check All Heroes"
}

class Mainviewcontroller: UICollectionViewController {
    private let reuseIdentifier = "Cell"
    private let actions = Actions.allCases
    @IBOutlet var rndmImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rndmImage.image = UIImage(named: "randm")
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.clear
        navigationController?.navigationBar.isHidden = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return actions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.userActionLabel.text = actions[indexPath.row].rawValue
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        
        switch action {
        case .downloading:
            performSegue(withIdentifier: "showImage", sender: self)
        case .checkHeroes:
            performSegue(withIdentifier:"toHeroes" , sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let heroesvc = segue.destination as? HeroesViewController
        switch segue.identifier {
        case "toHeroes":
            heroesvc!.fetchData()
        default:
            break
        }
    }
}
