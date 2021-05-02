//
//  NewEpisodesTableViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import UIKit

class NewEpisodesTableViewCell: UITableViewCell {

    
    
    var channel : Channel?
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
    func getApiData(channel: Channel){
        self.channel = channel
    }
}
/////////////////////////////////////////////////////////////////////////////////////
extension NewEpisodesTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(IndexPath: indexPath) as GenericCollectionViewCell
        cell.title.text = channel?.title
        cell.subTitle.text = channel?.slug
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        guard let seriesImage = URL(string: (channel?.latestMedia?[indexPath.row].coverAsset?.url)! )
        else{return UICollectionViewCell()}
        let seriesImageTask = URLSession.shared.dataTask(with: seriesImage) { (data, reponse, error) in
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                cell.image.image = image
            }}
        seriesImageTask.resume()
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150 , height: 310)
    }
    
    
}
