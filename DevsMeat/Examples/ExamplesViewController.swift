//
//  ExamplesViewController.swift
//  DevsMeat
//
//  Created by Piotr on 07/12/2016.
//  Copyright © 2016 SoInteractive. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ExamplesViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeOn()
    }
    
    // MARK: just
    /**
     Returns an observable sequence that contains a single element.
     
     - seealso: [just operator on reactivex.io](http://reactivex.io/documentation/operators/just.html)
     
     - parameter element: Single element in the resulting observable sequence.
     - returns: An observable sequence containing the single specified element.
 
    public static func just(_ element: E) -> Observable<E> {
        return Just(element: element)
    }
    */
    func justObservable() {
        // Stwórz sekwencje z jednym stringiem
        let _ = Observable.just(1)
    }
    
    // MARK: from
    /**
     Converts an array to an observable sequence.
     
     - seealso: [from operator on reactivex.io](http://reactivex.io/documentation/operators/from.html)
     
     - returns: The observable sequence whose elements are pulled from the given enumerable sequence.
 
    public static func from(_ array: [E], scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<E> {
        return ObservableSequence(elements: array, scheduler: scheduler)
    }
    */
    func fromObservable() {
        // Stwórz sekwencje z paroma intami
        let _ = Observable.from([0,1,2])
    }
    
    // MARK: of
    /**
     This method creates a new Observable instance with a variable number of elements.
     
     - seealso: [from operator on reactivex.io](http://reactivex.io/documentation/operators/from.html)
     
     - parameter elements: Elements to generate.
     - parameter scheduler: Scheduler to send elements on. If `nil`, elements are sent immediatelly on subscription.
     - returns: The observable sequence whose elements are pulled from the given arguments.
 
    public static func of(_ elements: E ..., scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<E> {
        return ObservableSequence(elements: elements, scheduler: scheduler)
    }
    */
    func ofObservable() {
        // Stwórz sekwencje z paroma intami
        let _ = Observable.of(1, 2, 3)
    }
    
    // MARK: create
    /**
     Creates an observable sequence from a specified subscribe method implementation.
     
     - seealso: [create operator on reactivex.io](http://reactivex.io/documentation/operators/create.html)
     
     - parameter subscribe: Implementation of the resulting observable sequence's `subscribe` method.
     - returns: The observable sequence with the specified implementation for the `subscribe` method.
    public static func create(_ subscribe: @escaping (AnyObserver<E>) -> Disposable) -> Observable<E> {
        return AnonymousObservable(subscribe)
    }
    */
    func createObservable() {
        // Stwórz sekwencje z paroma intami
        let _ = Observable<Int>.create { (observer) -> Disposable in
            observer.onNext(1)
            observer.onNext(2)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    // MARK: subscribe
    /**
     Subscribes an event handler to an observable sequence.
     
     - parameter on: Action to invoke for each event in the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
 
    public func subscribe(_ on: @escaping (RxSwift.Event<Self.E>) -> Swift.Void) -> Disposable
    */
    func subscribe() {
        let _ = Observable.from([1,2,3,4]).subscribe { (event) in
            print(event)
        }.addDisposableTo(disposeBag)
    }
    
    // MARK: subscribe2
    /**
     Subscribes an element handler, an error handler, a completion handler and disposed handler to an observable sequence.
     
     - parameter onNext: Action to invoke for each element in the observable sequence.
     - parameter onError: Action to invoke upon errored termination of the observable sequence.
     - parameter onCompleted: Action to invoke upon graceful termination of the observable sequence.
     - parameter onDisposed: Action to invoke upon any type of termination of sequence (if the sequence has
     gracefully completed, errored, or if the generation is cancelled by disposing subscription).
     - returns: Subscription object used to unsubscribe from the observable sequence.
    public func subscribe(onNext: ((Self.E) -> Swift.Void)? = default, onError: ((Error) -> Swift.Void)? = default, onCompleted: (() -> Swift.Void)? = default, onDisposed: (() -> Swift.Void)? = default) -> Disposable
    */
    func subscribe2() {
        let _ = Observable.from([1,2,3,4,5])
            .map({ (n) -> Int in
                do {
                    try self.checkIfTwo(n)
                } catch (let error) {
                    print(error)
                    return -1
                }
                
                if n == 2 {
                    throw NSError(domain: "", code: 100, userInfo: nil)
                }
                return n
            })
            .subscribe(onNext: { (next) in
                print(next)
            }, onError: { (error) in
                print(error)
            }, onCompleted: {
                print("completed!")
            }).addDisposableTo(disposeBag)
    }
    
    func checkIfTwo(_ n: Int) throws {
        if n == 2 {
            throw NSError(domain: "", code: 100, userInfo: nil)
        }
    }
    
    // MARK: SubscribeOn
    /**
     Wraps the source sequence in order to run its subscription and unsubscription logic on the specified
     scheduler.
     
     This operation is not commonly used.
     
     This only performs the side-effects of subscription and unsubscription on the specified scheduler.
     
     In order to invoke observer callbacks on a `scheduler`, use `observeOn`.
     
     - seealso: [subscribeOn operator on reactivex.io](http://reactivex.io/documentation/operators/subscribeon.html)
     
     - parameter scheduler: Scheduler to perform subscription and unsubscription actions on.
     - returns: The source sequence whose subscriptions and unsubscriptions happen on the specified scheduler.
    public func subscribeOn(_ scheduler: ImmediateSchedulerType) -> RxSwift.Observable<Self.E>
    */
    func subscribeOn() {
        let _ = Observable<Int>.create { (observer) -> Disposable in
            Thread.sleep(forTimeInterval: 2)
            observer.onNext(1)
            observer.onCompleted()
            
            return Disposables.create()
        }.subscribe(onNext: { (element) in
            print(element)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("disposed")
        })
        
        print("koniec")
    }
    
    
    /**
     Wraps the source sequence in order to run its observer callbacks on the specified scheduler.
     
     This only invokes observer callbacks on a `scheduler`. In case the subscription and/or unsubscription
     actions have side-effects that require to be run on a scheduler, use `subscribeOn`.
     
     - seealso: [observeOn operator on reactivex.io](http://reactivex.io/documentation/operators/observeon.html)
     
     - parameter scheduler: Scheduler to notify observers on.
     - returns: The source sequence whose observations happen on the specified scheduler.
 
    public func observeOn(_ scheduler: ImmediateSchedulerType) -> RxSwift.Observable<Self.E>
    */
    func observeOn() {
        let _ = Observable<Int>.create { (observer) -> Disposable in
                Thread.sleep(forTimeInterval: 2)
                observer.onNext(1)
                observer.onCompleted()
                
                return Disposables.create()
            }
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS.default))
            .subscribe(onNext: { (element) in
                print(Thread.current)
                print(element)
            }, onError: { (error) in
                print(error)
            }, onCompleted: {
                print("completed")
            }, onDisposed: {
                print("disposed")
            })
    }
    
    /**
     Projects each element of an observable sequence into a new form.
     
     - seealso: [map operator on reactivex.io](http://reactivex.io/documentation/operators/map.html)
     
     - parameter transform: A transform function to apply to each source element.
     - returns: An observable sequence whose elements are the result of invoking the transform function on each element of source.
     
 
    public func map<R>(_ transform: @escaping (Self.E) throws -> R) -> RxSwift.Observable<R>
    */
    func map() {

    }
    
    /**
     Merges elements from all observable sequences in the given enumerable sequence into a single observable sequence.
     
     - seealso: [merge operator on reactivex.io](http://reactivex.io/documentation/operators/merge.html)
     
     - returns: The observable sequence that merges the elements of the observable sequences.
 
    public func merge() -> RxSwift.Observable<Self.E.E>
    */
    func merge() {
        let oddObservable = Observable.from([1,3,5,7])
        let evenObservable = Observable.from([2,4,6,8])
        
        let _ = Observable.of(oddObservable,evenObservable).merge().subscribe { (event) in
            switch event {
            case .next(let e):
                print(e)
            default:
                break
            }
        }.addDisposableTo(disposeBag)

    }
    
    func zip() {

    }
    
    /**
     Applies an accumulator function over an observable sequence and returns each intermediate result. The specified seed value is used as the initial accumulator value.
     
     For aggregation behavior with no intermediate results, see `reduce`.
     
     - seealso: [scan operator on reactivex.io](http://reactivex.io/documentation/operators/scan.html)
     
     - parameter seed: The initial accumulator value.
     - parameter accumulator: An accumulator function to be invoked on each element.
     - returns: An observable sequence containing the accumulated values.
     
     public func scan<A>(_ seed: A, accumulator: @escaping (A, Self.E) throws -> A) -> RxSwift.Observable<A>
     */
    func scan() {
        let _ = Observable<Int>
            .interval(1.0, scheduler: MainScheduler.instance)
            .take(7)
            .filter { $0 != 0 }
            .scan(1) { (before, after) in
                return before * after
            }
            .bindNext{ print ($0) }
    }
}
