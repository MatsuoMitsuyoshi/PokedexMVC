//
//  PokedexController.swift
//  PokedexMVC
//
//  Created by mitsuyoshi matsuo on 2019/04/12.
//  Copyright © 2019 mitsuyoshi matsuo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PokedexCell"

// PokedexController: メインのコントローラー
class PokedexController: UICollectionViewController {
    
    // MARK: - Properties
    
    var pokemon = [Pokemon]()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        configureViewComponents()
        fetchPokemon()
    }
    
    // MARK: - Selectors
    // 検索アクション
    @objc func showSearchBar() {
        print(124)
    }
    
    // MARK: - API
    func fetchPokemon() {
        Service.shared.fetchPokemon { (pokemon) in
            DispatchQueue.main.async {
                self.pokemon = pokemon
                self.collectionView.reloadData()

            }
        }
    }
    
    // MARK: - Helper Functions
    // 構成コンポーネントの設定
    func configureViewComponents() {
        
        collectionView.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .mainPink()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.title = "Pokedex"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        
        // 検索ボタンの色
        navigationItem.rightBarButtonItem?.tintColor = .white
        // セルの登録
        collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}

extension PokedexController {
    
    // セルの数
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    // セルの生成
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // セルオブジェクトの再利用
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
        
        cell.pokemon = pokemon[indexPath.item]
        
        return cell
    }
}

// セルの大きさやセル同士の間隔などを個別に設定
extension PokedexController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 36) / 3
        return CGSize(width: width, height: width)
    }
}
