//
//  InfoView.swift
//  PokedexMVC
//
//  Created by mitsuyoshi matsuo on 2019/04/12.
//  Copyright © 2019 mitsuyoshi matsuo. All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    // MARK: - Properties
    
    // imageViewの設定
    let imageView: UIImageView = {
        let iv = UIImageView()
        // 縦横比率の設定: 縦横比率そのままで短い縦横比率そのままで短い辺を基準に全体を表示
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    // nameContainerViewの設定
    lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink()
        // nameLabelのsub_view追加
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 5
        nameLabel.center(inView: view)
        return view
    }()

    let nameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Charmander"
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "1 TEST: 80"
        return label
    }()
    
    let defenseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "2 TEST: 80"
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "3 TEST: 80"
        return label
    }()
    
    let pokedexIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "4 TEST: 80"
        return label
    }()
    
    let attackLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "5 TEST: 80"
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "6 TEST: 80"
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .mainPink()
        button.setTitle("View More Info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleViewMoreInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleViewMoreInfo() {
        print("Handle view more info..")
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        
        backgroundColor = .white
        self.layer.masksToBounds = true
        
        // nameContainerViewの追加
        addSubview(nameContainerView)
        // nameContainerViewのLayoutAnchor設定
        nameContainerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)

        // imageViewの追加
        addSubview(imageView)
        // imageViewのLayoutAnchor設定
        imageView.anchor(top: nameContainerView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 60)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // 1: typeLabelの追加
        addSubview(typeLabel)
        // typeLabelのLayoutAnchor設定
        typeLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        // 2: defenseLabelの追加
        addSubview(defenseLabel)
        // defenseLabelのLayoutAnchor設定
        defenseLabel.anchor(top: imageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: -8, width: 0, height: 0)

        let separatorView = UIView()
        separatorView.backgroundColor = .groupTableViewBackground
        addSubview(separatorView)
        separatorView.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: -4, width: 0, height: 1)
        
        // 3: heightLabelの追加
        addSubview(heightLabel)
        heightLabel.anchor(top: separatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // 4: weightLabelの追加
        addSubview(pokedexIdLabel)
        pokedexIdLabel.anchor(top: separatorView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: -8, width: 0, height: 0)
        
        // 5: attackLabelの追加
        addSubview(attackLabel)
        attackLabel.anchor(top: heightLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        // 6: weightLabelの追加
        addSubview(weightLabel)
        weightLabel.anchor(top: pokedexIdLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: -8, width: 0, height: 0)
        
        addSubview(infoButton)
        infoButton.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 12, paddingRight: -12, width: 0, height: 50)

    }

    
}
