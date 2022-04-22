//
//  HeroHeaderUIView.swift
//  nexflix clone
//
//  Created by erhan demirci on 21.04.2022.
//

import UIKit

class HeroHeaderUIView: UIView {
    private let playButton : UIButton = {
       let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let downloadButton : UIButton = {
       let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let heroImageView:UIImageView = {
       let imgview = UIImageView()
        imgview.contentMode = .scaleToFill
        imgview.clipsToBounds = true
        imgview.image = UIImage(named: "heroImage")
        return imgview
    }()
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstrait()
        
        
        
    }
    private func applyConstrait()
    {
        let playButtonConstrait = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 90),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        let downloadButtonConstrait = [
            downloadButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor,constant: 20),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65),
            downloadButton.widthAnchor.constraint(equalToConstant: 100)
        
        ]
        NSLayoutConstraint.activate(playButtonConstrait)
        NSLayoutConstraint.activate(downloadButtonConstrait)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

}
