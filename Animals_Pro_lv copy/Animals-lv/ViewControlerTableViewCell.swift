//
//  ViewControlerTableViewCell.swift
//  Animals-free-lv
//
//  Created by Kārlis Zars on 27/04/2018.
//  Copyright © 2018 KarlisZars. All rights reserved.
//

import UIKit



class ViewControlerTableViewCell: UITableViewCell {

    @IBOutlet weak var myToppic_name: UILabel!
    @IBOutlet weak var myToppicImage: UIImageView!
    @IBOutlet weak var Content_View: ViewControlerTableViewCell!
    @IBOutlet weak var Toppic_View: UIView!
    @IBOutlet weak var Image_View: UIView!
    
    var Background_color = UIColor(rgb: 0xf56c57)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
        // Configure the view for the selected state
    }


}
