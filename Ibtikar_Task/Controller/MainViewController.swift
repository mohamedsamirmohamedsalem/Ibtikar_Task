//
//  ViewController.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK:- Instances
    var loadingApiChannelsData = false
    var channels: [Channel] = []
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
        tableView.RegisterNib(Cell: MainTableViewCell.self)
        //        tableView.RegisterNib(Cell: RelatedLinksTableViewCell.self)
        tableView.reloadData()
        
    }
    
    func loadData(){
        loadingApiChannelsData = true
        DispatchQueue.main.async {
            let url = "https://pastebin.com/raw/Xt12uVhM"
            APIManager.get(url: url, parameter: nil, headers: nil, completion: { (check,Response:ChannelsModel?) in
                        guard let response = Response else {return}
                        self.channels = response.data?.channels ?? []
                        self.tableView.reloadData()
                        self.activityIndicator?.stopAnimating()
                        self.loadingApiChannelsData = false
                    })
        }
    }
    
}

