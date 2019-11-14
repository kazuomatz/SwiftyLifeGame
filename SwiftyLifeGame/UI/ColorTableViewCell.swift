//
//  ColorTableViewCell.swift
//  SwiftyLifeGame
//
//  Created by Kazuo Matsunaga on 2019/11/14.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    let colorViewSize = 64
    let colorViewMargein:CGFloat = 8
    
    var currentColor:UIColor = AppData.shared.cellColor

    override func awakeFromNib() {
        super.awakeFromNib()
        self.colorCollectionView.delegate = self
        self.colorCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: colorViewSize, height: colorViewSize)
        layout.sectionInset = UIEdgeInsets(top: CGFloat(colorViewMargein), left: colorViewMargein, bottom: colorViewMargein, right: colorViewMargein)
        layout.scrollDirection = .horizontal
        
        self.colorCollectionView.showsHorizontalScrollIndicator = false
        self.colorCollectionView.setCollectionViewLayout(layout, animated: false)
        self.colorCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppData.shared.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCollectionViewCell", for: indexPath) as! ColorCollectionViewCell

        cell.colorView.backgroundColor = AppData.shared.colors[indexPath.item]
        if indexPath.item == AppData.shared.cellColorIndex {
            cell.contentView.backgroundColor = .systemRed
        }
        else {
            cell.contentView.backgroundColor = .systemBackground
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AppData.shared.cellColorIndex = indexPath.item
        collectionView.reloadData()
    }
}
