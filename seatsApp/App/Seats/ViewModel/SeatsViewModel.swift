//
//  SeatsViewModel.swift
//  seatsApp
//
//  Created by Carlos Henrique Antunes on 2/29/20.
//  Copyright © 2020 Carlos Henrique Antunes. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ViewModel Protocol

protocol SeatsViewModelDelegate {
  func loadData()
  func getCellsToRegister() -> [String]
  func numberOfSections(in collectionView: UICollectionView) -> Int
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class SeatsViewModel {
  
  // MARK: - View Delegate
  
  private weak var view: SeatsCollectionViewDelegate?
  
  // MARK: - Enums and Constants
  
  private enum SectionType: Int {
    case letters = 0
    case seats = 1
  }
  
  private enum CellReuseIdentifiers: String, CaseIterable {
    case seat = "SeatCollectionViewCell"
    case letter = "LetterNumberCollectionViewCell"
  }
  
  private enum SeatsProvider: String, CaseIterable {
    case filename = "seat-fnb"
    case fileExtension = "json"
  }
  
  private let numberOfHorizontalSeats = 8
  
  // MARK: - Private Properties
  
  private let seatsTitle: [String]
  private var rows: [[String]]
  private var seatItems: [Item]
  
  // MARK: - Public Initializers
  
  init(view: SeatsCollectionViewDelegate) {
    self.seatsTitle = [" ", "A", "B", " ", "D", "E", "F", "G", " ", "J", "K", " "]
    self.rows = [[]]
    self.seatItems = []
    self.view = view
  }
  
  // MARK: - Private Methods
  private func fetchSeats() {
    guard let fileURL = Bundle.main.url(forResource: SeatsProvider.filename.rawValue, withExtension: SeatsProvider.fileExtension.rawValue) else {
      NSLog("couldn't find the file")
      return
    }
    
    do {
      let content = try Data(contentsOf: fileURL)
      let seatMap = try! JSONDecoder().decode(SeatMapModel.self, from: content)
      self.seatItems = seatMap.items.filter({ $0.cabinClass == .j })
      
      for (index, item) in (self.seatItems.enumerated()) {
        self.rows.append(self.getRows(from: item, in: index + 1))
      }
      view?.didFinish()
    } catch let error {
      NSLog(error.localizedDescription)
    }
  }
  
  private func getRows(from item: Item?, in index: Int) -> [String] {
    var seats: [String] = []
    guard let item = item else { return [] }
    let mirror = Mirror(reflecting: item)
    
    seats.append("\(item.aisle)")
    for child in mirror.children {
      if let label = child.label, label.contains("cabinSide") {
        seats.append("\(child.value)")
      }
    }
    seats.append("\(item.aisle)")
    
    return seats
  }
  
  private func getItem(with index: Int) -> Item {
    return seatItems[index]
  }
  
}

// MARK: - ViewModel Delegate

extension SeatsViewModel: SeatsViewModelDelegate {
  func loadData() {
    self.fetchSeats()
  }
  
  func getCellsToRegister() -> [String] {
    return CellReuseIdentifiers.allCases.map { $0.rawValue }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return self.seatItems.count + 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.numberOfHorizontalSeats + 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.section == SectionType.letters.rawValue {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifiers.letter.rawValue, for: indexPath) as! LetterNumberCollectionViewCell
      cell.setupCell(with: seatsTitle[indexPath.row])
      return cell
    } else {
      if indexPath.row == 0 || indexPath.row == 11 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifiers.letter.rawValue, for: indexPath) as! LetterNumberCollectionViewCell
        cell.setupCell(with: rows[indexPath.section][indexPath.row])
        return cell
      } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifiers.seat.rawValue, for: indexPath) as! SeatCollectionViewCell
        let aisle = getItem(with: indexPath.section - 1).aisle
        cell.setupCell(with: rows[indexPath.section][indexPath.row], using: "\(aisle)\(seatsTitle[indexPath.row])", in: indexPath)
        return cell
      }
    }
  }
}
