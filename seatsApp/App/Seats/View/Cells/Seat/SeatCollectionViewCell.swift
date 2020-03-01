//
//  SeatCollectionViewCell.swift
//  seatsApp
//
//  Created by Carlos Henrique Antunes on 2/28/20.
//  Copyright © 2020 Carlos Henrique Antunes. All rights reserved.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var seatView: UIView!
  @IBOutlet weak var bottomSeparatorView: UIView!
  @IBOutlet weak var dividerView: UIView!
  @IBOutlet weak var label: UILabel!
  
  // MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    contentView.isHidden = false
    seatView.isHidden = false
    bottomSeparatorView.isHidden = false
    dividerView.isHidden = true
    label.text = ""
  }
  
  // MARK: - Public Methods
  
  func setupCell(with seat: String, using text: String, in indexPath: IndexPath) {
    if indexPath.row == 3 || indexPath.row == 8 {
      seatView.isHidden = true
      bottomSeparatorView.isHidden = true
      dividerView.isHidden = false
    } else {
      seatView.roundCornersWithBorders(corners: [.topLeft, .topRight], radius: 5, borderColor: UIColor.gray.cgColor, width: 1.5)
      seatView.isHidden = false
      bottomSeparatorView.isHidden = false
      dividerView.isHidden = true
      
      let nonAllowedSeats = ["XB","XL","XP","XR","XS","XU","XU"]
      if nonAllowedSeats.contains(seat) {
        contentView.isHidden = true
      } else {
        label.text = text
      }
    }
  }
}
