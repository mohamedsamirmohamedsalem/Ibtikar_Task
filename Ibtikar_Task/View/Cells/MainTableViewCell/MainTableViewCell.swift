//
//  MainTableViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 02/05/2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    //MARK : IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        registerNibFiles()
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //MARK:- Methods
    //this function to set the layouts of MainViewController
      private func setLayout(){
        collectionView.delegate = self
        collectionView.dataSource = self
      }
     //This Funvtion to register cell in tableview
        private func registerNibFiles(){
            collectionView.RegisterNib(Cell: SeriesCollectionViewCell.self)
        }
    
        func reloadData() {
            collectionView.reloadData()
       }
}
/////////////////////////////////////////////////////////////////////////////////////
extension MainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(IndexPath: indexPath) as SeriesCollectionViewCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150 , height: 400)
    }
    
    
}
