//
//  HomeViewModel.swift
//  Rick and Morty Database
//
//  Created by Tassio Siciliano Donati on 23/04/20.
//  Copyright © 2020 Tassio Siciliano Donati. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    let services = Services()
    var results = [Results]()
    var user: User? = nil
    var dataSource: UICollectionViewDiffableDataSource<Sections, Results>?
    
    func fetchCharacters() {
        let endpoint = "https://rickandmortyapi.com/api/character/"
        
        services.fetch(url: endpoint, type: User.self) { (result) in
            switch result {

            case .success(let user):
                self.user = user
                user.results.forEach({ result in
                    self.results.append(result)
                })
                self.snapshot(from: self.results)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchMore(urlString: String) {
        services.fetch(url: urlString, type: User.self) { (result) in
            switch result {

            case .success(let user):
                self.user = user
                user.results.forEach({ result in
                    self.results.append(result)
                })
                self.snapshot(from: self.results)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func willDisplay(_ indexPath: IndexPath) {
        if results.last?.id == results[indexPath.item].id {
            guard let nextUrl = user?.info.next else { return }
            DispatchQueue.main.async {
                self.fetchMore(urlString: nextUrl)
            }
        }
    }
    
    func snapshot(from results: [Results]) {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Results>()
        snapshot.appendSections([.main])
        snapshot.appendItems(results)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    func didSelectItemAt(_ indexPath: IndexPath, completion: () -> ()) {
        
    }
}
