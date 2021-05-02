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
}
/////////////////////////////////////////////////////////////////////////////////////
extension MainTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultUrl = "shorturl.at/emMNY"
        let cell = collectionView.dequeue(IndexPath: indexPath) as SeriesCollectionViewCell
        mainTitle.text =  channel?.title
        subTitle.text = String(channel?.mediaCount ?? 0) + " episodes"
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        guard let seriesImage = URL(string: (channel?.latestMedia?[indexPath.row].coverAsset?.url)! )
        else{return UICollectionViewCell()}
        let seriesImageTask = URLSession.shared.dataTask(with: seriesImage) { (data, reponse, error) in
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                cell.seriesImage.image = image
            }}
        seriesImageTask.resume()
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        guard let iconImageUrl = URL(string: (channel?.coverAsset?.url) ?? defaultUrl )
        else{return UICollectionViewCell()}
        let iconImageTask = URLSession.shared.dataTask(with: iconImageUrl) { (data, reponse, error) in
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                self.iconImage.image = image
            }}
        iconImageTask.resume()
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            cell.seriesTitle.text = channel?.latestMedia?[indexPath.row].title
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 150 , height: 300)
        }
        
        
      
    
    func fetchImage(_ url :String){
        
       
    }

}
