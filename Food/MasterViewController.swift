//
//  MasterViewController.swift
//  Food
//
//  Created by Samuelhuang on 19/3/2016.
//  Copyright © 2016年 Samuelhuang. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController ,NSFetchedResultsControllerDelegate{
/*
    var Restaurant = ["咖啡胡同", "霍米", "茶.家", "洛伊斯咖啡", "贝蒂生蚝", "福奇餐馆", "阿波画室", "伯克街面包坊", "黑氏巧克力", "惠灵顿雪梨", "北州", "布鲁克林塔菲", "格雷厄姆大街肉", "华夫饼 & 沃夫", "五叶", "眼光咖啡", "忏悔", "巴拉菲娜", "多尼西亚", "皇家橡树", "泰咖啡"]
    
    var RestaurantImage =
    ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeeRestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var RestaurantAdr = ["香港", "香港", "香港", "香港", "香港", "香港", "香港", "悉尼", "悉尼", "悉尼", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "纽约", "伦敦", "伦敦", "伦敦", "伦敦"]
    
    var RestaurantType = ["咖啡 & 茶店","咖啡", "茶屋", "奥地利式 & 休闲饮料","法式", "面包房", "面包房", "巧克力", "咖啡", "美式 & 海鲜", "美式", "美式","早餐 & 早午餐", "法式 & 茶", "咖啡 & 茶", "拉丁美式", "西班牙式", "西班牙式", "西班牙式", "英式", "泰式"]
    var cameArray = [Bool](count: 21, repeatedValue: false)
    */
    /*
    var Restaurants  = [Restaurant(name: "咖啡胡同", type: "咖啡 & 茶店", location: "香港上环德辅道西78号G/F", image: "cafedeadend.jpg", isVisited: false) ,
        Restaurant(name: "霍米", type: "咖啡", location: "香港上环文咸东街太平山22-24A，B店", image: "homei.jpg", isVisited: false) ,
        Restaurant(name: "茶.家", type: "茶屋", location: "香港葵涌和宜合道熟食市场地下", image: "teakha.jpg", isVisited: false) ,
        Restaurant(name: "洛伊斯咖啡", type: "奥地利式 & 休闲饮料", location: "香港新界葵涌屏富径", image: "cafeloisl.jpg", isVisited: false) ,
        Restaurant(name: "贝蒂生蚝", type: "法式", location: "香港九龙尖沙咀河内道18号(近港铁尖东站N3,N4出口) ", image: "petiteoyster.jpg", isVisited: false) ,
        Restaurant(name: "福奇餐馆", type: "面包房", location: "香港岛中环都爹利街13号乐成行地库中层", image: "forkeeRestaurant.jpg", isVisited: false) ,
        Restaurant(name: "阿波画室", type: "面包房", location: "香港岛铜锣湾轩尼诗道555号崇光百货地库2楼30号铺", image: "posatelier.jpg", isVisited: false) ,
        Restaurant(name: "伯克街面包坊", type: "巧克力", location: "4 Hickson Rd、The Rocks NSW 2000", image: "bourkestreetbakery.jpg", isVisited: false) ,
        Restaurant(name: "黑氏巧克力", type: "咖啡", location: "31 Wheat Rd、Sydney NSW 2001", image: "haighschocolate.jpg", isVisited: false) ,
        Restaurant(name: "惠灵顿雪梨", type: "美式 & 海鲜", location: "1/11-31 York Street Sydney NSW Australia、Sydney NSW 2000", image: "palominoespresso.jpg", isVisited: false) ,
        Restaurant(name: "北州", type: "美式", location: "Macy's、151 W 34th St Fifth Floor、New York, NY 10001", image: "upstate.jpg", isVisited: false) ,
        Restaurant(name: "布鲁克林塔菲", type: "美式", location: "250 8th Ave、New York, NY 10107", image: "traif.jpg", isVisited: false) ,
        Restaurant(name: "格雷厄姆大街肉", type: "早餐 & 早午餐", location: "55-1 Riverwalk Pl、West New York, NJ 07093", image: "grahamavenuemeats.jpg", isVisited: false) ,
        Restaurant(name: "华夫饼 & 沃夫", type: "法式 & 茶", location: "1585 Broadway、New York, NY 10036-8200", image: "wafflewolf.jpg", isVisited: false) ,
        Restaurant(name: "五叶", type: "咖啡 & 茶", location: "1460 Broadway、New York, NY 10036", image: "fiveleaves.jpg", isVisited: false) ,
        Restaurant(name: "眼光咖啡", type: "拉丁美式", location: "250 8th Ave、New York, NY 10107", image: "cafelore.jpg", isVisited: false) ,
        Restaurant(name: "忏悔", type: "西班牙式", location: "822 Lexington Ave、New York, NY 10065", image: "confessional.jpg", isVisited: false) ,
        Restaurant(name: "巴拉菲娜", type: "西班牙式", location: "Unit 2, Eldon Chambers、30-32 Fleet St、London EC4Y 1AA", image: "barrafina.jpg", isVisited: false) ,
        Restaurant(name: "多尼西亚", type: "西班牙式", location: "Waterloo Station、London SE1 7LY", image: "donostia.jpg", isVisited: false) ,
        Restaurant(name: "皇家橡树", type: "英式", location: "Unit 4a、44-58 Brompton Rd、London SW3 1BW", image: "royaloak.jpg", isVisited: false) ,
        Restaurant(name: "泰咖啡", type: "泰式", location: "7-9 Golders Green Rd、London NW11 8DY", image: "thaicafe.jpg", isVisited: false)
        
    ]
 */
    
    var restaurants:[Restaurant] = []
    var frc:NSFetchedResultsController!
    
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain , target: nil , action: nil )
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        let request = NSFetchRequest(entityName: "Restaurant")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let buffer = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: buffer, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        do{
            try frc.performFetch()
            restaurants = frc.fetchedObjects as! [Restaurant]
        }
        catch{
            print(error)
        }
        
    }

    override func viewWillAppear(animated: Bool) {
               super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CanteenCell", forIndexPath: indexPath) as! CanteenCell

         cell.canteenName.text = restaurants[indexPath.row].name
    
        cell.canteenAdr.text = restaurants[indexPath.row].location
        cell.canteenImage.image = UIImage(data: restaurants[indexPath.row].image!)
        cell.canteenImage.layer.cornerRadius = cell.canteenImage.frame.size.width/2
        cell.canteenImage.clipsToBounds = true
        
        if restaurants[indexPath.row].isVisited == true {
            cell.accessoryType = .Checkmark
        }else
        {
            cell.accessoryType = .None
        }
        
        
        return cell
    }

    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertController(title: "我选了你", message: "消息", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let callPhone = { (action2:UIAlertAction) -> Void in
            let alert = UIAlertController(title: "提示", message: "你拨打的电话是", preferredStyle: .Alert)
            let action2 = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(action2)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        let dialAction = UIAlertAction(title: "call", style: .Default, handler: callPhone)
        
        
        let iCame = UIAlertAction(title: "I Have Came here", style: .Default) { (_) -> Void in
            let cell  = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            
            self.cameArray[indexPath.row] = true
        }
        
        alert.addAction(cancelAction)
        alert.addAction(dialAction)
        alert.addAction(iCame)
        self.presentViewController(alert, animated: true, completion: nil)
    
    }
    */
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            restaurants.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: .Default, title: "Sharing") { (action, indexpath) -> Void in
            
            let alert = UIAlertController(title: "Share to", message: "selete what you want to share", preferredStyle: .ActionSheet)
            let qqAction = UIAlertAction(title: "QQ", style: .Default, handler: nil)
             let weiXinAction = UIAlertAction(title: "weixin", style: .Default, handler: nil)
             let weiboAction = UIAlertAction(title: "weibo", style: .Default, handler: nil)
             let facebookAction = UIAlertAction(title: "facebook", style: .Default, handler: nil)
            alert.addAction(qqAction)
            alert.addAction(weiboAction)
            alert.addAction(weiXinAction)
            alert.addAction(facebookAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delate") { (action, indexpath) -> Void in
            //self.restaurants.removeAtIndex(indexPath.row)
            //tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            let buffer = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
            let toDeleteRow = self.frc.objectAtIndexPath(indexpath) as! Restaurant
            buffer.deleteObject(toDeleteRow)
            
            do{
                try buffer.save()
            }catch{ print(error)}
        }

        shareAction.backgroundColor = UIColor.greenColor()
        return [shareAction,deleteAction,shareAction]
    }
    
    //MARK: controller 
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Automatic)
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        case .Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        default:
            tableView.reloadData()
        }
        restaurants = controller.fetchedObjects as! [Restaurant]
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    
        if segue.identifier == "show" {
            let descVc = segue.destinationViewController as! ShowDetailViewController
            descVc.canteen = restaurants[tableView.indexPathForSelectedRow!.row]
            
        }
    }

    @IBAction func unwindToHome(segue:UIStoryboardSegue){
        
    }
    
    
}

