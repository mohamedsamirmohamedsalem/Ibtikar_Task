//
//  GenericCollectionViewCell.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import UIKit

class GenericCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBoutlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
