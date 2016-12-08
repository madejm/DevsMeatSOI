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
    
    var friends = Variable([Friend])
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 80.0
        
        friends.asDriver().driver(self.tableView.rx.items(cellIdentifier: "cell", cellType: FriendViewCell.self)) { (row, friend, cell) in
            cell.fiend = friend
        }.addDisposableBag(disposeBag)
        
        self.tableView.rx.itemSelected.asObservable().flatMap { (indexPath: IndexPath) in
            print(indexPath.row)
        }
        
        // tableViewDataSource z wykorzystaniem rx 
        // tableViewDelegate z wykorzystaniem rx
    }

}
