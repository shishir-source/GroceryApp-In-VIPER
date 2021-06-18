//
//  HomeViewController.swift
//  GroceryViper
//
//  Created by Shishir Ahmed on 4/4/21.
//

import UIKit

protocol HomeView: class {
    func updateTitle(title: String) -> (Void)
    func updateCategory(categoryList: [CategoryViewModel]) -> ()
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresentation!

    var categories: [CategoryViewModel] = [] {
        didSet{
            collectionView.reloadData()
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Grocery With Viper"
        self.presenter.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height - 100).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.cellName)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

}

extension HomeViewController: HomeView {
    
    func updateCategory(categoryList: [CategoryViewModel]) {
        categories = categoryList
    }
    
    func updateTitle(title: String) {
        titleLabel.text = title
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.cellName, for: indexPath) as! ProductCell
        cell.configure(usingViewModel: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 
        return CGSize(width: collectionView.frame.size.width / 2 - 20, height: collectionView.frame.size.width / 2 - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didTapSelected(usingCategory: categories[indexPath.row])
    }
}
