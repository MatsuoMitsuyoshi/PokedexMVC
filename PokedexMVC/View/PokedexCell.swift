//
//  PokedexCell.swift
//  PokedexMVC
//
//  Created by mitsuyoshi matsuo on 2019/04/12.
//  Copyright © 2019 mitsuyoshi matsuo. All rights reserved.
//

import UIKit

// カスタムセルの設定
class  PokedexCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var pokemon: Pokemon? {
        didSet {
            nameLabel.text = pokemon?.name
            imageView.image = pokemon?.image
        }
    }
    
    // imageViewの設定
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .groupTableViewBackground
        // 縦横比率の設定: 縦横比率そのままで短い縦横比率そのままで長い編を基準に全体を表示
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // nameContainerViewの設定
    lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink()
        // nameLabelのsub_view追加
        view.addSubview(nameLabel)
        nameLabel.center(inView: view)
        
        return view
    }()
    
    // nameLabelの設定
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Bulbasaur"
        return label
    }()
    
    
    
    // MARK: - Init
    // コードの初期化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    // xibの初期化
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // 未実装
    }
    
    // MARK: - Selectors
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            print("Long press did begin..")
        }
    }
    
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        self.layer.cornerRadius = 10 // 角丸設定
        self.clipsToBounds = true // セルのぎ描画範囲を超えた表示はしない
        
        // imageViewの追加
        addSubview(imageView)
        // imageViewのLayoutAnchor設定
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 32)
        
        // nameContainerViewの追加
        addSubview(nameContainerView)
        // nameContainerViewのLayoutAnchor設定
        nameContainerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 32)
        
        //
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.addGestureRecognizer(longPressGestureRecognizer)
    }
}
