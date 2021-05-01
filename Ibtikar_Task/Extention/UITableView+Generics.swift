//
//  ViewController.swift
//  BestWayForCollectionViewInsideTableView
//
//  Created by mohamed samir on 01/05/2021.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
import Foundation
import UIKit


extension UITableView{
     //Simple way to Register table view using nib file
    func RegisterNib<Cell : UITableViewCell>(Cell : Cell.Type){
    
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
     //Simple way to deque cell using class name automatically
    func dequeue<Cell : UITableViewCell>(IndexPath : IndexPath) -> Cell{
        
        let identifier = String(describing: Cell.self)
        //let CellForIndex = Cell as UITableViewCell
        guard let Cell = self.dequeueReusableCell(withIdentifier: identifier, for: IndexPath ) as? Cell  else {
            fatalError("there is no Cell")
        }
        return Cell
    }
}
