//
//  ViewController.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK:- Instances
    var loadingApiData = false
    var channels: [ChannelsModel] = []
    var activityIndicator: UIActivityIndicatorView?
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        loadData()
        registerNibFiles()
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //MARK:- Methods
    //this function to set the layouts of MainViewController
    private func setLayout(){
        if channels.count == 0{
            self.initActivityIndicator()
        }
  
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor.clear
        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.reloadData()
        
       
    }
    //This Funvtion to register cell in tableview
    private func registerNibFiles(){
        tableView.RegisterNib(Cell: NewEpisodesTableViewCell.self)
//        tableView.RegisterNib(Cell: ComicsTableViewCell.self)
//        tableView.RegisterNib(Cell: RelatedLinksTableViewCell.self)
        tableView.reloadData()
        
    }
    
    func loadData(){
        loadingApiData = true
//        requestCharacter.loadCharacters(name: nameSearch, page: currentPage) { (response) in
//            switch response {
//            case .success(let model):
//                self.total = model.data.total
//                self.categories.append(contentsOf: model.data.results)
//                self.tableView.reloadData()
//                self.activityIndicator.stopAnimating()
//                self.loadingApiData = false
//            case .serverError(let description):
//                print("Server error: \(description) \n")
//            case .noConnection(let description):
//                print("Server error noConnection: \(description) \n")
//            case .timeOut(let description):
//                print("Server error timeOut: \(description) \n")
//            }
//        }
    }
    
}

