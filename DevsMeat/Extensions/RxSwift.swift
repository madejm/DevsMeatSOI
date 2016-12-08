//
//  RxSwift+fromArray.swift
//  DevsMeat
//
//  Created by marcin on 12/5/16.
//  Copyright © 2016 SoInteractive. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType where E == Array<Friend> {
    
    func fromArray() -> Observable<Friend> {
        
        let observable = flatMap { friends -> Observable<Friend> in
            
            return Observable.from(friends)
        }
        
        return observable
    }
}
