//
//  MasterViewController.swift
//  SwiftyLifeGame
//
//  Created by Kazuo Matsunaga on 2019/11/10.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var objects = [Any]()
    var timer = Timer()
    var start = false
    
    let columns: Int = LifeGame.shared.columns
    let rows: Int = LifeGame.shared.rows
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.layer.borderColor = UIColor.systemGray6.cgColor
        collectionView.isHidden = true
        
        self.startButton.layer.borderWidth = 1.0
        self.startButton.layer.cornerRadius = 5
        self.startButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: Selector(("refreshCells")))
    
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: Selector(("clearCells")))
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        
        let rect:CGRect = self.collectionView.frame
        
        let width = rect.size.width / CGFloat(columns)
        let height = rect.size.width / CGFloat(columns)
        
        layout.itemSize = CGSize(width:width,  height: height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.reloadData()
        collectionView.isHidden = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return columns * rows;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        if LifeGame.shared.getStatus(index: indexPath.item) {
            cell.backgroundColor = .systemPink
        }
        else {
            cell.backgroundColor = .systemGray6
        }
        return cell
    }
    
    @IBAction func start(_ sender: Any) {
        toggleState();
    }
    
    func toggleState() {
        if !start {
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { (timer) in
                LifeGame.shared.checkLife()
                self.collectionView.reloadData()
            })
            start = true
            self.startButton.setTitle("Stop", for: .normal)
        }
        else {
            start = false
            timer.invalidate()
            self.startButton.setTitle("Start", for: .normal)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let status = !LifeGame.shared.getStatus(index: indexPath.item)
        LifeGame.shared.setStatus(index: indexPath.item, status: status )
        self.collectionView.reloadData()
    }
    
    @objc
    func refreshCells () {
        LifeGame.shared.randamize()
        self.collectionView.reloadData()
        if start {
            toggleState();
        }
    }
    
    @objc
    func clearCells() {
        LifeGame.shared.clear()
        self.collectionView.reloadData()
        if start {
            toggleState();
        }
    }
}

