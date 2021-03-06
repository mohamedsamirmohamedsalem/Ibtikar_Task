//
//  MainTableViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 02/05/2021.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {
    
    //MARK:- Instances
    var channel: Channel?
    var index:Int?
    
    //MARK : IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
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
    func getApiData(channel: Channel){
        self.channel = channel
    }
    func getIndex(_ index :Int){
        self.index =  index
    }
}
/////////////////////////////////////////////////////////////////////////////////////
extension MainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let defaultUrl = "shorturl.at/emMNY"
        let cell = collectionView.dequeue(IndexPath: indexPath) as SeriesCollectionViewCell
        if index == 4 {
            cell.imageWidth.constant = 300
            cell.imageHeight.constant = 180
            cell.titleWidth.constant = 300
        }
        mainTitle.text =  channel?.title
        subTitle.text = String(channel?.mediaCount ?? 0) + " episodes"
        cell.seriesTitle.text = channel?.latestMedia?[indexPath.row].title
        guard let seriesImageUrl = URL(string: (channel?.latestMedia?[indexPath.row].coverAsset?.url)! ),let iconImageUrl = URL(string: (channel?.coverAsset?.url) ?? defaultUrl )
        else{return UICollectionViewCell()}
        cell.seriesImage.sd_setImage(with: seriesImageUrl, placeholderImage: UIImage(), options: .continueInBackground, completed:nil)
        iconImage.sd_setImage(with: iconImageUrl, placeholderImage: UIImage(), options: .continueInBackground, completed:nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = 150
        if index == 4 {
            width =  300
        }
        return CGSize(width: width , height: 300)
    }
}
