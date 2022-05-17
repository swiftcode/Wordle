//
//  BoardCollectionViewController.swift
//  Wordle
//
//  Created by mpc on 5/6/22.
//

import UIKit

class BoardHeader: UICollectionReusableView {
    static let identifier = "headerIdentifier"
    var titleView = TitleView()

    override init(frame: CGRect) {
        let titleView = TitleView(frame: .zero)
        super.init(frame: .zero)

        addSubview(titleView)
        translatesAutoresizingMaskIntoConstraints = false

        addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.20)

        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.20)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

class BoardFooter: UICollectionReusableView {
    static let identifier = "footerIdentifier"

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

class BoardCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    //let boardHeaderId = BoardHeader.identifier

    var titleView: TitleView = {
        let view = TitleView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var collectionView = UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //setupView()

        collectionView.delegate = self
        collectionView.dataSource = self

        // Register classes
        collectionView.register(BoardCell.self,
                                forCellWithReuseIdentifier: BoardCell.identifier)
        collectionView.register(UICollectionViewCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: BoardHeader.identifier)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        view.addSubview(titleView)
        titleView.addConstraint(topAnchor: collectionView.topAnchor, leadingAnchor: collectionView.leadingAnchor, trailingAnchor: collectionView.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.20)
        titleView.addBorders(to: [.top, .bottom], in: .black, width: 1.0)
        view.addSubview(titleView)
    }

    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 1.0, leading: 1.0, bottom: 1.0, trailing: 1.0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)

                let section = NSCollectionLayoutSection(group: group)

                section.orthogonalScrollingBehavior = .none
                return section
        }
    }

    func makeHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.3)
        )

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: BoardHeader.identifier,
            alignment: .top
        )

        return sectionHeader
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier, for: indexPath) as! BoardCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BoardHeader.identifier, for: indexPath)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BoardFooter.identifier, for: indexPath)
            return footer

        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: Screen.width, height: Screen.height * 0.20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0.0, height: 0.0)
    }
}
