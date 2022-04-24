//
//  TitleCollectionViewCell.swift
//  nexflix clone
//
//  Created by erhan demirci on 23.04.2022.
//

import UIKit
import SDWebImage


class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    public func configure(with model: String)
    {
        var newmodel = "https://image.tmdb.org/t/p/w500/\(model)"
        guard let url = URL(string: newmodel) else {return}
        print(url)
        
    posterImageView.sd_setImage(with:url, completed: nil)
        
    }
    
    
}
