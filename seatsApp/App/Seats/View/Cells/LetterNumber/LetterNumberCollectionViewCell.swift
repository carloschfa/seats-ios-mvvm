//
//  LetterCollectionViewCell.swift
//  seatsApp
//
//  Created by Carlos Henrique Antunes on 2/29/20.
//  Copyright © 2020 Carlos Henrique Antunes. All rights reserved.
//

import UIKit

class LetterNumberCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var labelText: UILabel!
  
  // MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  // MARK: - Public Methods
  
  func setupCell(with text: String) {
    labelText.text = text
  }
  
}
