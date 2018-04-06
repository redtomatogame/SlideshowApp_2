//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 赤津亮太 on 2018/04/05.
//  Copyright © 2018年 Ryota.Akatsu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var filename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: filename)
        
        BigImage.image = image
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var BigImage: UIImageView!
    
    @IBAction func Back(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
