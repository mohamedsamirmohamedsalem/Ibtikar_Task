//
//  CategoryTableViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 02/05/2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    
    //MARK:- Instances
    var categories : [Category]?
    
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
        collectionView.RegisterNib(Cell: CategoryCollectionViewCell.self)
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    func getApiData(categories: [Category]){
        self.categories = categories
    }
}
/////////////////////////////////////////////////////////////////////////////////////
extension CategoryTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeue(IndexPath: indexPath) as CategoryCollectionViewCell
        cell.categoryText.text = self.categories?[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160 , height: 70)
    }
}
