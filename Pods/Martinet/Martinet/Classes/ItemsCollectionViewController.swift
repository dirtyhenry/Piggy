//
//  ItemsCollectionViewController.swift
//  Pods
//
//  Created by Mickaël Floc'hlay on 06/03/2017.
//
//

import UIKit

private let reuseIdentifier = "Cell"

open class ItemsCollectionViewController<Item, Cell: UICollectionViewCell>: UICollectionViewController {
    var items: [Item] = []
    var configure: (Cell, Item) -> () = { _ in }
    var didSelect: (Item) -> () = { _ in }
    let reuseIdentifier = "reuseIdentifier"

    public init(collectionViewLayout: UICollectionViewLayout, items: [Item], configure: @escaping (Cell, Item) -> ()) {
        self.configure = configure
        super.init(collectionViewLayout: collectionViewLayout)
        self.items = items
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        // self.collectionView!.register(Cell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.register(UINib(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Cell
    
        // Configure the cell
        let item = items[indexPath.row]
        configure(cell, item)

        return cell
    }

    // MARK: UICollectionViewDelegate

    override open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        didSelect(item)
    }
}
