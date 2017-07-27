//
//  UserViewModel.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation

/// Protcol for all UserViewable, the consumers are someone who is intersted in implmenting the User Viewing functions, like reloading data or Showing Errors.

public protocol UserViewable {
    
    func onDidStartLoading()
    func onDidFinishLoadingData()
    func onDidFailLoadingDataWithError(error:String)
}



/// Enum to switch between Data Collection Types [Remote - Local]
///
/// - local: load users from Mock Object.
/// - remote: load users from API side.

public enum dataCollectorType {
    case local, remote
}



public class UserViewModel {
    
    // MARK: - Injected Properties
    let dataCollector : UserService = DataCollectorFactory.getDataCollection(type: .remote)
    private let delegateView : UserViewable
    
    init(view : UserViewable) {
        self.delegateView = view
    }
    
    func loadData()
    {
        delegateView.onDidStartLoading()
        dataCollector.loadUsers(onSuccess: { (result) in
            self.delegateView.onDidFinishLoadingData()
            
        }) { (error) in
            
            self.delegateView.onDidFailLoadingDataWithError(error: error.description)
        }
    }
    
    func setupCell(cell : UserCell, user :User) -> UserCell {
        
        cell.nameLabel.text = user.name
        cell.usernameLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.addressLabel.text = "\(user.address.street), \(user.address.suite),\(user.address.city),\(user.address.zipcode)"
        return cell
    }
}




public class DataCollectorFactory {
    
    class func getDataCollection(type : dataCollectorType) -> UserService {
        switch type {
        case .local:
            return LocalUserCollection()
        case .remote:
            return CloudUserCollection()
        }
    }
}
