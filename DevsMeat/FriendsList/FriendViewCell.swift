//
//  FriendViewCell.swift
//  DevsMeat
//
//  Created by pc_mweglarz on 06/12/2016.
//  Copyright © 2016 SoInteractive. All rights reserved.
//

import UIKit

class FriendViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var gender: UIImageView!
    
    var friend: Friend? {
        didSet {
            self.updateCellView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func  updateCellView() {
        guard let friend = self.friend else { return }
        
        self.name.text = friend.name + " " + friend.surname
        self.quote.text = friend.quote
        self.gender.image = UIImage(named: friend.gender)
    }

}
