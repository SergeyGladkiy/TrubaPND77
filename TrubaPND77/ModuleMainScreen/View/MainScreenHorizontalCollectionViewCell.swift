//
//  MainScreenHorizontalCollectionViewCell.swift
//  TrubaPND77
//
//  Created by Serg on 11.08.2020.
//  Copyright © 2020 Sergey Gladkiy. All rights reserved.
//

import Foundation
import UIKit

class MainScreenHorizontalCollectionViewCell: UICollectionViewCell {
    
    private weak var imageViewCategory: UIImageView!
    private weak var titleCategory: UILabel!
    private weak var descriptionCategory: UILabel!
    private weak var heightAnchorImage: NSLayoutConstraint!
    private var padding: CGFloat = 10
    
    var viewModel: AttachmentItemMainScreen! {
        didSet {
            imageViewCategory.image = UIImage(named: viewModel.imageName)
            titleCategory.text = viewModel.attachmentTitle
            guard let descriptionText = viewModel.attechmentDescription
                else {
                descriptionCategory.isHidden = true
                return
            }
            
            //MARK: for 3th group
            heightAnchorImage.constant = self.frame.height/2 - 1*padding
            descriptionCategory.text = descriptionText
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if traitCollection.horizontalSizeClass == .regular {
            titleCategory.font = .boldSystemFont(ofSize: 21)
            descriptionCategory.font = .systemFont(ofSize: 14)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizingLayerShadow()
        layoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewCategory.image = nil
    }
    
    private func customizingLayerShadow() {
        self.backgroundView = UIView()
        addSubview(self.backgroundView!)
        self.backgroundView?.fillSuperview()
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 16

        self.backgroundView?.layer.shadowOpacity = 0.2
        self.backgroundView?.layer.shadowRadius = 7
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 5)
        
        //MARK: чтобы при скролинге не было заеданий
        self.backgroundView?.layer.shouldRasterize = true
    }
    
    private func layoutCell() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "truba")
        imageView.contentMode = .scaleAspectFit
        self.imageViewCategory = imageView
        let heightImage = imageViewCategory.heightAnchor.constraint(equalToConstant: self.frame.height/2 + 1*padding)
        self.heightAnchorImage = heightImage
        self.heightAnchorImage.isActive = true

        let label = UILabel()
        label.text = "Category"
        label.font = .boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .black
        self.titleCategory = label
        
        let description = UILabel()
        description.text = "Description"
        description.font = .systemFont(ofSize: 10)
        description.numberOfLines = 0
        description.textAlignment = .center
        description.textColor = .black
        description.adjustsFontSizeToFitWidth = true
        self.descriptionCategory = description
        
        let stackView = UIStackView(arrangedSubviews: [
            imageViewCategory, titleCategory, descriptionCategory
        ])
        
        stackView.axis = .vertical
        addSubview(stackView)
        let paddingStack: CGFloat = 4
        stackView.fillSuperview(padding: .init(top: paddingStack, left: paddingStack, bottom: paddingStack, right: paddingStack))
    }
}