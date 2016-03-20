//
//  ReViewViewController.swift
//  Food
//
//  Created by Samuelhuang on 20/3/2016.
//  Copyright © 2016年 Samuelhuang. All rights reserved.
//

import UIKit

class ReViewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    var rating:String?
    
    @IBAction func TouchEvent(sender: AnyObject) {
        switch sender.tag {
        case 10:
            rating = "dislike"
        case 20: rating = "good"
        case 30: rating = "great"
        default :break
        }
        
        performSegueWithIdentifier("Exit", sender: sender)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffectViw = UIVisualEffectView(effect:UIBlurEffect(style: .Light))
        blurEffectViw.frame = view.frame
        imageView.addSubview(blurEffectViw)

        
        let scale = CGAffineTransformMakeScale(0, 0)
        let tranlate = CGAffineTransformMakeTranslation(0, 500)
        stackView.transform = CGAffineTransformConcat(scale, tranlate)
        
    }
    
    override func viewDidAppear(animated: Bool) {
       
    
        UIView.animateWithDuration(0.5) { () -> Void in
            self.stackView.transform = CGAffineTransformIdentity
        }
        /*
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
            self.stackView.transform = CGAffineTransformIdentity
            }, completion: nil)
*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
