//
//  IssueTrackerModel.swift
//  LearnRxSwift
//
//  Created by Piotr on 29/11/2016.
//  Copyright © 2016 Piotr Więcaszek. All rights reserved.
//

import Foundation
import Moya
import Mapper
import Moya_ModelMapper
import RxOptional
import RxSwift

struct IssueTrackerModel {
    
    let provider: RxMoyaProvider<GitHub>
    let repositoryName: Observable<String>
    
}
