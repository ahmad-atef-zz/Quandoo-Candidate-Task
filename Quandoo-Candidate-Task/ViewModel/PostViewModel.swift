//
//  PostViewModel.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation

public protocol PostViewable {
    func onDidStartLoading()
    func onDidFinishLoadingData()
    func onDidFailLoadingDataWithError(error:String)
}

public protocol PostDataSourceProtcol {
    /// Use this method to list user Posts from any diffrent services [Remote or Local].
    func loadData()
}

public class PostViewModel : PostDataSourceProtcol{
    
    // MARK: - Injected Properties
    let dataCollector : PostService = PostsDataCollectorFactory.getDataCollection(type: .remote)
    private let delegateView : PostViewable
    private var userObject : User
    
    // MARK: - Object Lifecycle
    
    init(view : PostViewable, userObject : User) {
        self.delegateView = view
        self.userObject = userObject
        
    }
    
    
    //MARK: - PostDataSourceProtcol -
    public func loadData(){
        delegateView.onDidStartLoading()
        self.loadData(userId: "\(userObject.id)")
    }
    
    //MARK: - Helper Private Methods -
    
    private func loadData(userId:String) {
        dataCollector.loadUserPosts(userId: userId, onSuccess: { (posts) in
            self.delegateView.onDidFinishLoadingData()
        }) { (error) in
            print(error)
            self.delegateView.onDidFailLoadingDataWithError(error: error.description)
            
        }
    }
}


//MARK: - PostsDataCollectorFactory -
public class PostsDataCollectorFactory {
    
    /// Use this class method to generate PostService instance based on the dataCollectorType instance type.
    ///
    /// - Parameter type: DataCollectorType enum and based on thatm the type of Service are Returned.
    /// - Returns: Post service instance that can load user Posts.
    class func getDataCollection(type : DataCollectorType) -> PostService {
        switch type {
        case .local:
            return LocalPostCollection()
        case .remote:
            return CloudPostCollection()
        }
    }
    
}
