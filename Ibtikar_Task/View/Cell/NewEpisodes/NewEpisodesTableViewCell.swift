//
//  NewEpisodesTableViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import UIKit

class NewEpisodesTableViewCell: UITableViewCell {

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
            collectionView.RegisterNib(Cell: GenericCollectionViewCell.self)
        }
    
        func reloadData() {
            collectionView.reloadData()
       }
}
/////////////////////////////////////////////////////////////////////////////////////
extension NewEpisodesTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(IndexPath: indexPath) as GenericCollectionViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN_WIDTH / 3.5 , height: SCREEN_HEIGHT / 5)
    }
}
