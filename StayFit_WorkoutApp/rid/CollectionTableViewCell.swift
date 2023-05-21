//
//  CollectionTableViewCell.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-21.
//
import UIKit
protocol CollectionTableViewCellDelegate: AnyObject {

    func CollectionTableViewCellDidTapCell(_ cell: CollectionTableViewCell, viewModel: cipePreviewViewModel)
}


class CollectionTableViewCell: UITableViewCell {

   static let identifier = "CollectionTableViewCell"
    
    weak var delegate: CollectionTableViewCellDelegate?
    private var Workouts: [Workout] = [Workout]()
    
    private let collectionViews: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemGray5
        return collectionView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(collectionViews)
        
        collectionViews.delegate = self
        collectionViews.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionViews.frame = contentView.bounds
    }
    
    public func configure(with Workouts: [Workout]){
        self.Workouts = Workouts
        DispatchQueue.main.async { [weak self] in
            self?.collectionViews.reloadData()
        }
    }
    
 
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else { return UICollectionViewCell() }
        
        let model = Workouts[indexPath.row].url
        cell.configure(with: model)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Workouts.count
    }

    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let Workout = Workouts[indexPath.row].WorkoutName




    }
    

    
    
    
}
