//
//  DetailsViewController.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 5/4/21.
//

import UIKit
import Kingfisher

protocol DetailsView: class {
    func updateCategory(category: CategoryViewModel) -> Void
    func updateGroceries(groceries: [GroceryItemViewModel]) -> Void
}

class DetailsViewController: UIViewController {
    
    var presenter: DetailsViewPresenter!
    
    var groceries: [GroceryItemViewModel] = [] {
        didSet{
            collectionView.reloadData()
        }
    }
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Go Back", for: .normal)
        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    private let backImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .clear
        return image
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.zero
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.clipsToBounds = true
        collection.backgroundColor = .clear
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never

        self.presenter.viewDidLoad()
        
        view.addSubview(backImage)
        backImage.anchorView(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 200)
        
        view.addSubview(collectionView)
        collectionView.anchorView(top: backImage.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductListCell.self, forCellWithReuseIdentifier: ProductListCell.cellName)
    }
    
    //MARK: - Setup Layouts
    //MARK: - Helper Functions
    //MARK: - Selectors
    
    @objc func gotoList() {
        presenter.backButtonPressed()
    }
    
}

extension DetailsViewController: DetailsView {
    
    func updateGroceries(groceries: [GroceryItemViewModel]) {
        self.groceries = groceries
    }
    
    func updateCategory(category: CategoryViewModel) {
        let url = URL(string: "http://shishir.xyz/grocery/admin/itemimg/\(category.image)")
        backImage.kf.setImage(with: url)
    }
    
    
}

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groceries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCell.cellName, for: indexPath) as! ProductListCell
        cell.configure(usingViewModel: groceries[indexPath.row])
        cell.backgroundColor = .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width , height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
}

