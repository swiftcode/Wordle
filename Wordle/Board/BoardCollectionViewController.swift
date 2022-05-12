//
//  BoardCollectionViewController.swift
//  Wordle
//
//  Created by mpc on 5/6/22.
//

import UIKit

private let reuseIdentifier = "cell"

class BoardHeader: UICollectionReusableView {
    var titleView = TitleView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = .systemMint
        addSubview(titleView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleView.frame = bounds
    }
}

class BoardCollectionViewController: UICollectionViewController {

    static let boardHeaderId = "boardHeaderId"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.identifier)
    }

    init() {
        super.init(collectionViewLayout: BoardCollectionViewController.createLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1.0, leading: 1.0, bottom: 1.0, trailing: 1.0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)

        let section = NSCollectionLayoutSection(group: group)
        let spacing = CGFloat(10.0)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 1.0, bottom: 0.0, trailing: 1.0)

        //Section Header
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0)), elementKind: boardHeaderId, alignment: .topLeading)
        ]

        section.orthogonalScrollingBehavior = .none

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout

    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BoardCell

        return cell
    }
}
