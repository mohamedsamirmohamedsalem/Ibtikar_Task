//
//  SeriesCollectionViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var seriesTitle: UILabel!
    @IBOutlet weak var seriesImage: UIImageView!

    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    @IBOutlet weak var titleWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
