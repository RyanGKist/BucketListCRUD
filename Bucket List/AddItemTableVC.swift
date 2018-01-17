//
//  AddItemTableVC.swift
//  Bucket List
//
//  Created by Ryan Kistner on 1/16/18.
//  Copyright © 2018 Ryan Kistner. All rights reserved.
//

import UIKit

class AddItemTableVC: UITableViewController {
    
    weak var delegate : AddItemTableVCDelegate?
    
    var itemToEdit: String?
    var indexPath: NSIndexPath?

    @IBOutlet weak var textInputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textInputField.text = itemToEdit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
        
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let text = textInputField.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath)
    }
    
}
