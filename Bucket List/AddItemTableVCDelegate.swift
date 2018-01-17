//
//  AddItemTableVCDelegate.swift
//  Bucket List
//
//  Created by Ryan Kistner on 1/16/18.
//  Copyright © 2018 Ryan Kistner. All rights reserved.
//

import UIKit

protocol AddItemTableVCDelegate : class {
    func itemSaved(by controller : AddItemTableVC, with text: String, at indexPath: NSIndexPath? )
    func cancelButtonPressed(by controller : AddItemTableVC)
}
