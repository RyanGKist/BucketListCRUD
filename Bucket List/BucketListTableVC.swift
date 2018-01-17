//
//  BucketListTableVC.swift
//  Bucket List
//
//  Created by Ryan Kistner on 1/16/18.
//  Copyright © 2018 Ryan Kistner. All rights reserved.
//

import UIKit

class BucketListTableVC: UITableViewController, AddItemTableVCDelegate {
    
    var bucketListItems : [String] = ["Ryan","Simon","Lisa","Mark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucketListItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = bucketListItems[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        bucketListItems.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "AddItemSegue") {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableVC = navigationController.topViewController as! AddItemTableVC
            addItemTableVC.delegate = self
        } else if (segue.identifier == "EditItemSegue"){
            let navigationController = segue.destination as! UINavigationController
            let addItemTableVC = navigationController.topViewController as! AddItemTableVC
            addItemTableVC.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = bucketListItems[indexPath.row]
            addItemTableVC.itemToEdit = item
            addItemTableVC.indexPath = indexPath
        }
    }
    
    func itemSaved(by controller: AddItemTableVC, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath{
            bucketListItems[ip.row] = text
        }else{
            bucketListItems.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    func cancelButtonPressed(by controller: AddItemTableVC) {
        dismiss(animated: true, completion: nil)
    }
 
}
