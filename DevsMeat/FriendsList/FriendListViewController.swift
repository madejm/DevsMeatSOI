//
//  FriendListViewController.swift
//  DevsMeat
//
//  Created by pc_mweglarz on 06/12/2016.
//  Copyright © 2016 SoInteractive. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class FriendListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 80.0
        
        // tableViewDataSource z wykorzystaniem rx 
        // tableViewDelegate z wykorzystaniem rx
    }

}
