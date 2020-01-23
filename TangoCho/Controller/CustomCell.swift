//
//  CustomCell.swift
//  TangoCho
//
//  Created by higuchi の iMac on 2020/01/23.
//  Copyright © 2020 higuchiryunosuke. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    func showCellData(indexpath: IndexPath){
        self.wordLabel.text = String((indexpath.row)+1)
        self.meaningLabel.text = String((indexpath.row)+1)
        self.typeLabel.text = String((indexpath.row)+1)
    }
    
}
