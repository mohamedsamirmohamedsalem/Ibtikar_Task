//
//  sas.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import Foundation
import  UIKit

extension MainViewController : UITableViewDataSource{
    
    //Return number of charcters from the API (Data Source Method)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // deque cell according to number of Categories with in each time dequing a cell  (Data Source Method)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeue(IndexPath: indexPath) as NewEpisodesTableViewCell
            cell.reloadData()
            return cell
        }else if  indexPath.section == 4  {
        return UITableViewCell()
        }else if  indexPath.section == 8  {
            return UITableViewCell()
        }else{
            let cell = tableView.dequeue(IndexPath: indexPath) as MainTableViewCell
            cell.reloadData()
            return cell
        }
        //this for change backgroundColor of cell when select it
       
    }
}

