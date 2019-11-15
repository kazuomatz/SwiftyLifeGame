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
    var runnning = false
    
    let columns: Int = LifeGame.shared.columns
    let rows: Int = LifeGame.shared.rows
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.layer.borderColor = UIColor.lightGray.cgColor
        collectionView.isHidden = true
        
        self.startButton.layer.borderWidth = 1.0
        self.startButton.layer.cornerRadius = 5
        self.startButton.layer.borderColor = UIColor.label.cgColor
        self.startButton.tintColor = UIColor.label

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: Selector(("refreshCells")))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: Selector(("clearCells")))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if animated == false {
            self.collectionView.reloadData()
        }
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
        cell.layer.borderColor = self.cellBorderColor()
        cell.layer.borderWidth = 0.5
        if LifeGame.shared.getStatus(index: indexPath.item) {
            cell.backgroundColor = AppData.shared.cellColor
        }
        else {
            cell.backgroundColor = .systemBackground
        }
        return cell
    }
    
    @IBAction func start(_ sender: Any) {
        toggleState();
    }
    
    func toggleState() {
        if !runnning {
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: { (timer) in
                if LifeGame.shared.checkLife() == 0 {
                    if self.runnning {
                        timer.invalidate()
                        self.toggleState()
                    }
                }
                self.collectionView.reloadData()
            })
            runnning = true
            self.startButton.setTitle(NSLocalizedString("Stop", comment: ""), for: .normal)
        }
        else {
            runnning = false
            timer.invalidate()
            self.startButton.setTitle(NSLocalizedString("Start", comment: ""), for: .normal)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let status = !LifeGame.shared.getStatus(index: indexPath.item)
        LifeGame.shared.setStatus(index: indexPath.item, status: status )
        self.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSettingSegue") {
            ((segue.destination as! UINavigationController).topViewController as! PatternTableViewController).masterViewController = self
        }
    }
    
    internal func cellBorderColor() -> CGColor {
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor.lightGray.cgColor
        }
        else {
            return UIColor.darkGray.cgColor
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.userInterfaceStyle == .dark {
            self.startButton.layer.borderColor = UIColor.white.cgColor
        }
        else {
            self.startButton.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @objc
    func refreshCells () {
        if runnning {
            toggleState();
        }
        performSegue(withIdentifier: "showSettingSegue", sender: nil)
    }
    
    @objc
    func clearCells() {
        LifeGame.shared.clear()
        self.collectionView.reloadData()
        if runnning {
            toggleState();
        }
    }
}

