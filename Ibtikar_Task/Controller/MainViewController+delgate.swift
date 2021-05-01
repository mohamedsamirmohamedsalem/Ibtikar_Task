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
        return 6
    }
    
    //define hight for cell  (Delgate Method)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { //first section (0)
            return SCREEN_HEIGHT / 2
        }else if indexPath.section == 5 {//last section(5)
            return SCREEN_HEIGHT / 2
        }else{ //all section from 1 to 4
            return SCREEN_HEIGHT / 3.8
        }
        
    }
    
    //this function set action for taping in cell (Delgate Method)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
