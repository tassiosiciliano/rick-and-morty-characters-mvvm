//
//  HomeCollectionViewCell.swift
//  Rick and Morty Database
//
//  Created by Tassio Siciliano Donati on 23/04/20.
//  Copyright © 2020 Tassio Siciliano Donati. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    //MARK: Constants
    private enum Constants {
        static var imageCornerRadius: CGFloat = 12
        static var fontSize: CGFloat = 12
        static var numberOfLines: Int = 0
    }
    
    // Character Image
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.imageCornerRadius
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Character Name Label
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: Constants.fontSize, weight: .bold)
        label.numberOfLines = Constants.numberOfLines
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(character: Results) {
        self.nameLabel.text = character.name
        guard let charImage = character.image else { return }
        self.characterImageView.loadInCacheImage(from: charImage, key: charImage)
    }
    
    func setupUI() {
        addSubview(characterImageView)
        
        NSLayoutConstraint.activate([
            
            // Character Image
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 120),
            characterImageView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}
