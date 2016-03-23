//
//  ShowDetailViewController.swift
//  Food
//
//  Created by Samuelhuang on 19/3/2016.
//  Copyright © 2016年 Samuelhuang. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var canteen:Restaurant!
    @IBOutlet weak var ratingBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        
//        title = canteen.name
        navigationItem.title = canteen.name
   
            ratingBtn.setImage(UIImage(named:canteen.rating!), forState: .Normal)
      
    
     
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    
    override func viewDidAppear(animated: Bool) {
         self.navigationController?.navigationBar.barStyle = .BlackTranslucent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
      func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
      func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ShowDetailCell") as! ShowDetailCell
        switch indexPath.row {
        case 0:
            cell.keyLbl.text = "cantenn Name"
            cell.fieladLbl.text = canteen.name
        case 1:
            cell.keyLbl.text = "cantenn type"
            cell.fieladLbl.text = canteen.type
        case 2:
            cell.keyLbl.text = "cantenn point"
            cell.fieladLbl.text = canteen.location
        case 3:
            cell.keyLbl.text = "cantenn Name"
            cell.fieladLbl.text = canteen.isVisited!.boolValue ? "Yes" : "NO"
        default:
            cell.keyLbl.text = "cantenn Name"
            cell.fieladLbl.text = ""
        }
        cell.backgroundColor = UIColor.clearColor()
        imageView.image = UIImage(data: canteen.image!)
        return cell
        
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
    
        if let revVC = segue.sourceViewController as? ReViewViewController {
            if let rating =  revVC.rating {
                self.canteen.rating = rating
                self.ratingBtn.setImage(UIImage(named: rating), forState: .Normal)
            
                let buffer = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
                
                do{
                    try buffer.save()
                    
                }catch{
                    print(error)
                }
            
            }
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showMap" {
            let desVc = segue.destinationViewController as! MapViewController
            desVc.canteen = self.canteen
        }
    }
}
