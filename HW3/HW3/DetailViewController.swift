//
//  DetailViewController.swift
//  HW3
//
//  Created by lisa on 2017/5/18.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nev: UINavigationItem!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var airportName: UILabel!
    
        var passDetail : [String:String]? {
        didSet{
            if self.isViewLoaded{
                self.updateUIElements()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nev.title = passDetail!["IATA"]
        self.updateUIElements()
       
                    // Do any additional setup after loading the view.
    }
    func updateUIElements() {
        self.airportName.text = passDetail!["Airport"]
        self.airportName.numberOfLines = 0
        self.airportName.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        self.airportName.font = UIFont.systemFont(ofSize: 35)
        self.cityName.text = passDetail!["ServedCity"]
        self.cityName.font = UIFont.systemFont(ofSize: 17)
        self.picture.frame = CGRect(
            x: 0, y: 350, width: 420, height: 400)
        self.picture.image = UIImage(named:"Airports Data/"+passDetail!["IATA"]!+".jpg")
        self.country.text = passDetail!["Country"]
        self.country.font = UIFont.systemFont(ofSize: 17)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
