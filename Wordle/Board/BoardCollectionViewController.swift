//
//  BoardCollectionViewController.swift
//  Wordle
//
//  Created by mpc on 5/26/22.
//

import UIKit

class BoardHeader: UICollectionReusableView {
    static let identifier = "headerIdentifier"

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

class BoardCollectionViewController: UICollectionViewController {

    var titleView: TitleView = {
        let view = TitleView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
        _ = createLayout()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     override func viewDidLoad() {
        super.viewDidLoad()

         view.backgroundColor = .yellow

        setupView()
        setupLayout()

        // Register cell classes
        self.collectionView!.register(BoardCell.self,
                                      forCellWithReuseIdentifier: BoardCell.identifier)
        collectionView.register(BoardCollectionViewController.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: BoardHeader.identifier)
    }

    private func setupView() {
        view.addSubview(titleView)
    }

    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide

        titleView.addConstraint(topAnchor: guide.topAnchor, leadingAnchor: guide.leadingAnchor, trailingAnchor: guide.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.08)

        titleView.backgroundColor = .magenta

        collectionView.addConstraint(topAnchor: titleView.bottomAnchor, leadingAnchor: guide.leadingAnchor, trailingAnchor: guide.trailingAnchor, bottomAnchor: guide.bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: 0.0)
    }

    private func setupActions() {

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier, for: indexPath) as! BoardCell

        cell.letter.backgroundColor = .systemRed

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (Screen.width / 5.0), height: 50.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: Screen.width * 0.20, bottom: 0.0, right: Screen.width * 0.20)
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.20), heightDimension: .fractionalHeight(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
      print("Perform action")
    }
     */
}

extension BoardCollectionViewController {

}
