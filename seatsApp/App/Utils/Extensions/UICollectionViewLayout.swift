//
//  UICollectionViewLayout.swift
//  seatsApp
//
//  Created by Carlos Henrique Antunes on 2/29/20.
//  Copyright © 2020 Carlos Henrique Antunes. All rights reserved.
//

import UIKit

extension UICollectionViewLayout {
  
  func makeLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
      
      var height: CGFloat = 89
      if section == 0 { height = 32 }
      let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0), heightDimension: .absolute(height)))
      item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(height))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 12)
      let section = NSCollectionLayoutSection(group: group)
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
      return section
    }
    
    return layout
  }
}


