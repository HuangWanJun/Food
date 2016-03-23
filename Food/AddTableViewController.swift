//
//  AddTableViewController.swift
//  Food
//
//  Created by Samuelhuang on 20/3/2016.
//  Copyright © 2016年 Samuelhuang. All rights reserved.
//

import UIKit
import CoreData

class AddTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var loaction: UITextField!
    var restaurant :Restaurant!
    var isVistied = false
    
    
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @IBAction func SaveEvent(sender: AnyObject) {
    
        let buffer  = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
      let restaurant =   NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: buffer!) as! Restaurant
        restaurant.name = name.text
        restaurant.type = type.text
        restaurant.location = loaction.text
        
        if let image = imageView.image {
            restaurant.image = UIImagePNGRepresentation(image)
        }
        restaurant.isVisited = isVistied
        
        do{
            try buffer?.save()
        }catch{
            print(error)
        }
        
        performSegueWithIdentifier("unWindToHome", sender: sender)
    }
    
    
    @IBAction func isVisitedEvent(sender: AnyObject) {
        if sender.tag == 30 {
            isVistied = true
            lbl.text = "我来过"
        }else
        {
            isVistied = false
            lbl.text = "我没来过"
        }
    
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imagepicker = UIImagePickerController()
                imagepicker.allowsEditing = false
                imagepicker.sourceType = .PhotoLibrary
                imagepicker.delegate = self
                
                self.presentViewController(imagepicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

 
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = .ScaleAspectFit
        imageView.clipsToBounds = true
        
        let leftCon = NSLayoutConstraint(item: imageView, attribute: .Leading, relatedBy: .Equal, toItem: imageView.superview, attribute: .Leading, multiplier: 1, constant: 0)
        let rightCon = NSLayoutConstraint(item: imageView, attribute: .Trailing, relatedBy: .Equal, toItem: imageView.superview, attribute: .Trailing, multiplier: 1, constant: 0)
        let topCon = NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: imageView.superview, attribute: .Top, multiplier: 1, constant: 0)

         let bottomCon = NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: imageView.superview, attribute: .Bottom, multiplier: 1, constant: 0)
        
        
        leftCon.active = true
        rightCon.active = true
        topCon.active = true
        bottomCon.active = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   
}
