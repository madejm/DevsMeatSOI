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
    }
    
    // MARK: subscribe
    /**
     Subscribes an event handler to an observable sequence.
     
     - parameter on: Action to invoke for each event in the observable sequence.
     - returns: Subscription object used to unsubscribe from the observable sequence.
 
    public func subscribe(_ on: @escaping (RxSwift.Event<Self.E>) -> Swift.Void) -> Disposable
    */
    func subscribe() {

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
        
    }
    
}
