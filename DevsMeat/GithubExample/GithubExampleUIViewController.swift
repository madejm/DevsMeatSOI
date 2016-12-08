//
//  ThirdExampleUIViewController.swift
//  LearnRxSwift
//
//  Created by Piotr on 28/11/2016.
//  Copyright © 2016 Piotr Więcaszek. All rights reserved.
//

import Moya
import Moya_ModelMapper
import UIKit
import RxCocoa
import RxSwift

class GithubExampleUIViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    let provider = RxMoyaProvider<GitHub>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
    }
    
    func setupRx() {

    }

}
