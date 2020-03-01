# Seats iOS App using MVVM

Airplane Seats project using Swift 5, Xib's and MVVM architecture.

## Explaining the ViewModel

In this project the used architecture were MVVM using delegates for layers communication.

In our ViewModel ```SeatsViewModel``` we have the ```SeatsViewModelDelegate``` protocol which will be responsible
for making our View interact with the ViewModel. These are the methods in the protocol:

```func loadData()```
Will be called from View to fetch the seats from the ViewModel using the provided JSON file.

```func getCellsToRegister() -> [String]```
Returns an array of reusable identifiers to register in the CollectionView from the View.

```func numberOfSections(in collectionView: UICollectionView) -> Int```
Returns the number of items to the CollectionView delegate.

```func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int```
Returns the number of seats per item to the CollectionView delegate.

```func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell```
Configures all the cells based on section and row number, then returns to the CollectionView delegate a complete formated cell.

Inside the ViewModel class we have a View delegate ```private weak var view: SeatsCollectionViewDelegate?``` which is our delegate to call the view to update the presented info, for example to reload the CollectionView after the data is fetched from the ```loadData()``` function.

We have three main properties in ViewModel which is:

```private let seatsTitle: [String]```
A property that in the initialisation receives an array of string that contains the seats title.

```private var rows: [[String]]```
This is the property that will be used to mount the cells. Basically the structure is:
[
  Section0 (Item) [ 
    "J",
    "XL",
    "XL",
    "XL",
    "L",
    "XL",
    "XR",
    "R",
    "XR",
    "XR",
    "XR" 
   ],
   Section1 (Item) [ .... ]
]
      
```private var seatItems: [Item]```
Array of Items which will be return by the fetchSeats method.

The main Methods of ViewModel are ```fetchSeats()``` and ```getRows()```.

```fetchSeats()```
This method will try to load the data from the provided JSON and with the result will filter to only show the Items that the cabinClass equals to "J" and with result will call ```getRows()``` method to mount the rows property to be used in the CollectionView later.

```getRows(from item: Item?, in index: Int)```
Our model contains the following structure for the cabinSides: cabinSideA, cabinSideB, cabinSideC, cabinSideD .... to convert it from property to an array we use Mirror in the Item parameter to do a loop in it's children, that way we go through all the properties of the object and we get only the properties which has "cabinSide" in the name.

## Explaining the View

Our main View is ```SeatsCollectionViewController``` which has a protocol called ```SeatsCollectionViewDelegate``` that contains the ```didFinish()``` method. This method is called from the ViewModel to tell the View that the Items were fully fetched and it's ready to reload the CollectionView with the new Items. 

## SceneDelegate

Due to the size of the application it was not necessary to implement a wireframe or flowcontroller for navigation between views, so all ViewModel and View instantiation and dependency injection were done in SceneDelegate.

### Prerequisites

Xcode 11 with at least iOS 12.4.

## Running the tests

This application doesn't have tests implemented yet.


## Built With

* [Swift 5](https://swift.org/)

## Authors

* **Carlos Antunes** - *Initial work* - [carloschfa](https://github.com/carloschfa/)

