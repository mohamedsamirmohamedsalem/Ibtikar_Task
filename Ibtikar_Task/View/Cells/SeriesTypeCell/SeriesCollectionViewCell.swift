//
//  SeriesCollectionViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var seriesTitle: UILabel!
    @IBOutlet weak var seriesImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
