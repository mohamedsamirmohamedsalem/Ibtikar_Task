//
//  File.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//



import UIKit

extension MainViewController : UITableViewDelegate{
    
    //return number of sections in tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    //define hight for cell  (Delgate Method)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { //first section (0)
            return 400
        }else if indexPath.section == 4 {
            return 300
        }else if indexPath.section == 8{
            return 450
        }else{
            //all other sections
            return 380
        }
        
    }
    
    //this function set action for taping in cell (Delgate Method)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    // set hight for header (before table view first cell)
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    // set view of header (before table view first cell) to be clear
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v: UIView = UIView.init()
        v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return v
    }
    
}
