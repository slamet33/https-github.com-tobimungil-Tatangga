//
//  DalemKategoriViewController.swift
//  Tatangga
//
//  Created by Mirza Fachreza 2 on 25/08/19.
//  Copyright © 2019 Mirza Fachreza. All rights reserved.
//

import UIKit


    let forumCollectionViewCell = "ForumCollectionViewCell"

class DalemKategoriViewController: UIViewController{

    @IBOutlet weak var forumCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Register Custom Berita Cell
        let nibCell = UINib(nibName: forumCollectionViewCell, bundle: nil)
        forumCollection.register(nibCell, forCellWithReuseIdentifier: forumCollectionViewCell)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: forumCollectionViewCell, for: indexPath) as! ForumCollectionViewCell
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
}
