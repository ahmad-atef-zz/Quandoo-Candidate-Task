//
//  ResuableView.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import UIKit
import Foundation


//MARK: - Protocol-Oriented Programming -

/// Adding Shared Properties to UITableViewCell Using POP.
public protocol ResuableView : class{}


/// Adding reuseIdentifier Property to Every UITableViewCell instance.
public extension ResuableView where Self : UIView{
    static var reuseIdentifier : String{
        return String(describing: self)
    }
}

extension UITableViewCell : ResuableView{}



/// Custome dequeueReusableCell method to every UITableView Instance.
public extension UITableView{
    func dequeueReusableCell<T : UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ResuableView  {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Couldn't dequeueReusableCell with Identifier : \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
