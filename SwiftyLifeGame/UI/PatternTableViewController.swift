//
//  SettingTableViewController.swift
//  SwiftyLifeGame
//
//  Created by Kazuo Matsunaga on 2019/11/13.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import UIKit

class PatternTableViewController: UITableViewController {
    
    var masterViewController:MasterViewController?
   
    let colorRowHeight:CGFloat = 84
    let patternsRowHeight:CGFloat = 42
    
    let patterns = [
        Blinker(),
        TrafficLight(),
        Watch(),
        Pulsar(),
        Acorn(),
        Octagon(),
        Galaxy(),
        Pentadecathlon(),
        Glider(),
        DieHard(),
        SpaceShipHeavyWeight(),
        SchickEngineB(),
        SchickEngineT(),
        Random()
    ]

    var selectedIndex: Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Pattern", comment: "")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: Selector(("dismiss")))
        self.tableView.allowsMultipleSelection = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return patterns.count
        }
        else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let cell = tableView.cellForRow(at:indexPath)
            cell?.accessoryType = .checkmark
            self.selectedIndex = indexPath.row
        }
        else {
            
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section  == 0 {
            return NSLocalizedString("color of cell", comment: "")
        }
        else {
            return NSLocalizedString("Pattern", comment: "")

        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let cell = tableView.cellForRow(at:indexPath)
            cell?.accessoryType = .none
        }
        else {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return colorRowHeight;
        }
        else {
            return patternsRowHeight;
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.selectionStyle = .none
                let oscillator = self.patterns[indexPath.row]
                cell.textLabel?.text = oscillator.name
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
                return cell
        }
    }
    
    @objc
    internal func dismiss() {
        if self.selectedIndex >= 0  && self.masterViewController != nil {
            LifeGame.shared.clear()
            LifeGame.shared.setOscillator(oscillator: patterns[self.selectedIndex])
        }
        self.masterViewController?.viewWillAppear(false)
        self.dismiss(animated: true)
    }
}
