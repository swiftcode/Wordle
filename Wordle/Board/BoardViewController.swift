//
//  BoardViewController.swift
//  Wordle
//
//  Created by mpc on 5/18/22.
//

import UIKit


class BoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    enum Section {
        case main
    }

     var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemOrange
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()

        setupView()
        //setupLayout()
        //setupActions()
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    private func configureHierarchy() {
        collectionView.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.identifier)

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
    }

    //MARK: - CollectionView Setup

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier, for: indexPath)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemSize = CGSize(width: (Screen.width / 3.0) - 3, height: (Screen.width / 3.0) - 3)
        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    }


    //MARK: - Setup and Layout
    private func setupView() {
        [collectionView].forEach { view.addSubview($0) }
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.identifier)
    }

    private func setupLayout() {

    }

    private func setupActions() {

    }



}



/*
class BoardViewController: UIViewController {

    var titleView: TitleView = {
        let view = TitleView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var keyboardView: KeyboardView = {
        let view = KeyboardView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var button: KeyboardButton = {
        let b = KeyboardButton(frame: .zero)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("A", for: .normal)
        b.backgroundColor = .systemOrange
        return b
    }()

    var boardView: BoardView = {
        let view = BoardView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupView()
        setupLayout()
        setupActions()
    }


    //MARK: - Setup and Layout
    private func setupView() {
        [titleView, boardView, keyboardView].forEach { view.addSubview($0) }
    }

    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide

        titleView.addConstraint(topAnchor: guide.topAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.10)

        boardView.addConstraint(topAnchor: titleView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.40)

        keyboardView.addConstraint(topAnchor: boardView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 10.0, paddingLeft: 3.0, paddingRight: 0.0, paddingBottom: 0.0, width: 30.0, height: 30.0)
    }

    private func setupActions() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        print("buttonTapped")

        var guess: GuessValue

        let randomNumber = Int.random(in: 1...3)

        switch randomNumber {
            case 1: guess = .correct
            case 2: guess = .semicorrect
            case 3: guess = .incorrect
            default: guess = .initial
        }

        button.setBackgroundColor(to: guess)
    }
}
*/
