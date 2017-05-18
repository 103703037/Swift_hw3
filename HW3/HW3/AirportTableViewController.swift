//
//  AirportTableViewController.swift
//  HW3
//
//  Created by lisa on 2017/5/17.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit

class AirportTableViewController: UITableViewController {
    var filePath: String?
   
    var airportList: [[[String: String]]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        var tempList : [[String: String]] = []
        self.tableView.delegate = self
        self.tableView.dataSource = self
        filePath = Bundle.main.path(forResource: "Airports Data/airports", ofType: "plist")
        tempList = NSArray(contentsOfFile: filePath!) as! [[String: String]]
        for item in tempList {
            for index in 0...airportList.count{
                if index == airportList.count{
                    airportList.append([item])
                    break;
                }
                else if item["Country"] == airportList[index][0]["Country"]{
                    airportList[index].append(item)
                    break;
                }
            }
        }
        //print(airportList.count)
        
        /*for index in 0...airportList.count-1{
            print(airportList[index][0]["Country"]!)
            for lst in airportList[index]{
                print(lst["Airport"]!)
            }
        }*/

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return airportList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return airportList[section].count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60.0;//Choose your custom row height
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath) as! CustomTableViewCell
        cell.Title?.text = (airportList[indexPath.section][indexPath.row]["Airport"]!)
        cell.City.text = (airportList[indexPath.section][indexPath.row]["ServedCity"]!)
        cell.cityCode.text = (airportList[indexPath.section][indexPath.row]["IATA"]!)
        cell.cityCode.textColor = UIColor.gray
        cell.City.textColor = UIColor.gray
        // Configure the cell...
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return airportList[section][0]["Country"]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            guard let cell = sender as? UITableViewCell else {
                fatalError("Mis-configured storyboard! The sender should be a cell.")
            }
            self.prepareOpeningDetail(for: segue, sender: cell)
        }else {
            super.prepare(for: segue, sender: sender)
        }
    }
    func prepareOpeningDetail(for segue: UIStoryboardSegue, sender: UITableViewCell) {
        let noteViewController = segue.destination as! DetailViewController
        let senderIndexPath = self.tableView.indexPath(for: sender)!
        var temp : [String:String] = [:]
        temp.updateValue(airportList[senderIndexPath.section][senderIndexPath.row]["Country"]!, forKey: "Country")
        temp.updateValue(airportList[senderIndexPath.section][senderIndexPath.row]["Airport"]!, forKey: "Airport")
        temp.updateValue(airportList[senderIndexPath.section][senderIndexPath.row]["ServedCity"]!, forKey: "ServedCity")
        temp.updateValue(airportList[senderIndexPath.section][senderIndexPath.row]["IATA"]!, forKey: "IATA")
        noteViewController.passDetail = temp
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
