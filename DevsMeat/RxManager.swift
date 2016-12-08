//
//  RxManager.swift
//  DevsMeat
//
//  Created by marcin on 12/5/16.
//  Copyright © 2016 SoInteractive. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireObjectMapper

class RxManager {
    
    
    // Imitujemy logowanie
    static func login() -> Observable<User> {
        return Observable.just(User())
    }

    // Sciaganie ustawien uzytkownika
    static func getSettings() -> Observable<Bool> { // isTableView: Bool
        return Observable.just(true)
    }

    // Pobranie listy przyjaciol z API
    static func getFriends(count: Int, gender: Gender) -> Observable<[Friend]> {
        
        let friendsObservable = Observable<[Friend]>.create { (observer) -> Disposable in
            
                let request = Alamofire.request("http://uinames.com/api/?amount=\(count)&gender=\(gender.rawValue)&region=poland")
                    .validate(statusCode: 200...300)
                    .responseArray(completionHandler: { (response: DataResponse<[Friend]>) in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value)
                        case .failure(let error):
                            observer.onError(error)
                        }
                    })
            
            return Disposables.create {
                request.cancel()
            }
        }
        
        return friendsObservable
    }
    
    // Wywolanie getFriends + manipulacja danymi
    static func friends() -> Observable<[Friend]> {
        let men = getFriends(count: 10, gender: .male)
        let women = getFriends(count: 10, gender: .female)
        
        let obsevrable = Observable.of(men, women).merge().fromArray().flatMap({ (friend) -> Observable<Friend> in
            
            return RxManager.getQuote(for: friend)
            })
            .toArray()
        
        return obsevrable
    }
    
    // Pobieranie cytatu dla kazdego uzytkownika
    static func getQuote(for friend: Friend) -> Observable<Friend> {
        
        let observable = Observable<Friend>.create { (observer) -> Disposable in
        
            let key = Int(arc4random()) % QuoteProvider.quoteArray.count
            let quote = QuoteProvider.quoteArray[key]
            
            friend.quote = quote
            
            observer.onNext(friend)
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        return observable
    }
    
}

extension RxManager {
    
    enum Gender: String {
        case male = "male"
        case female = "female"
    }
}

class QuoteProvider {
    
    static var quoteArray: [String] = [
    "The weak can never forgive. Forgiveness is the attribute of the strong.",
    "The universe is made of stories, not atoms.",
    "What you do not want done to yourself, do not do to others.",
    "If one does not know to which port is sailing, no wind is favorable.",
    "We all have problems. The way we solve them is what makes us different.",
    "Sometimes the biggest act of courage is a small one.",
    "There is no way to happiness, happiness is the way."]
}
