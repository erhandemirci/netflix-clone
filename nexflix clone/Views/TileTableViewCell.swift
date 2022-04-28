//
//  TileTableViewCell.swift
//  nexflix clone
//
//  Created by erhan demirci on 25.04.2022.
//

import UIKit

class TileTableViewCell: UITableViewCell {

    static let identifier = "TileTableViewCell"
    
    private let playTitleButton : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle",withConfiguration: UIImage.SymbolConfiguration.init(pointSize: 40))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let titlePosterUIImageView:UIImageView = {
        let imagevieew = UIImageView()
        imagevieew.contentMode = .scaleAspectFill
        imagevieew.translatesAutoresizingMaskIntoConstraints = false
        imagevieew.clipsToBounds = true
        return imagevieew
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstrait()
    }
    private func applyConstrait()
    {
        let titlePosterUIImageViewConstraits = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        
        ]
        NSLayoutConstraint.activate(titlePosterUIImageViewConstraits)
        let titleLabelConstraits = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor,constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        
        ]
        NSLayoutConstraint.activate(titleLabelConstraits)
        let playTitleButtonConstraits = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        ]
        NSLayoutConstraint.activate(playTitleButtonConstraits)
        
       
    }
    public func configure(with model: TitleViewModel)
    {
        var newmodel = "https://image.tmdb.org/t/p/w500/\(model.posterURL)"
        guard let url = URL(string: newmodel) else {return}
        titlePosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

}
