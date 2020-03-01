//
//  SeatsCollectionViewController.swift
//  seatsApp
//
//  Created by Carlos Henrique Antunes on 2/28/20.
//  Copyright © 2020 Carlos Henrique Antunes. All rights reserved.
//

import UIKit

// MARK: - View Protocol

protocol SeatsCollectionViewDelegate: NSObject {
  func didFinish()
}

class SeatsCollectionViewController: UICollectionViewController {
  
  // MARK: - Public Properties
  
  var viewModel: SeatsViewModelDelegate!
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupUI()
    viewModel.loadData()
  }
  
  // MARK: - Private Methods
  
  private func setupUI() {
    let cells = self.viewModel.getCellsToRegister()
    cells.forEach { cellIdentifier in
      let cellNib = UINib(nibName: cellIdentifier, bundle: Bundle.main)
      self.collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
    self.collectionView.backgroundColor = .white
  }
}

// MARK: SeatsCollectionViewDelegate

extension SeatsCollectionViewController: SeatsCollectionViewDelegate {
  func didFinish() {
    self.collectionView.reloadData()
  }
}

// MARK: UICollectionViewDataSource

extension SeatsCollectionViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return self.viewModel.numberOfSections(in: collectionView)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.viewModel.collectionView(collectionView, numberOfItemsInSection: section)
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return self.viewModel.collectionView(collectionView, cellForItemAt: indexPath)
  }
}
