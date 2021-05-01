//
//  MainTableViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 02/05/2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    //MARK:- Instances
    var channel: Channel?
    
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
        let cell = collectionView.dequeue(IndexPath: indexPath) as SeriesCollectionViewCell
        cell.mainTitle.text =  channel?.title
        cell.subTitle.text = String(channel?.mediaCount ?? 0) + " episodes"
        //cell.image.image = getImage(channel?.iconAsset )
        cell.seriesImage.image = getImage(channel?.iconAsset?.url ?? "")
        cell.seriesTitle.text = channel?.latestMedia?[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150 , height: 400)
    }
    
    
    func getImage(_ url :String)->UIImage{
        var image = UIImage()
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async { /// execute on main thread
                    image =  UIImage(data: data) ?? UIImage()
            
                }
            }
            task.resume()
        }
        return image
    }
}
