//
//  UICollectionView+Ext.swift
//  Rick and Morty Database
//
//  Created by Tassio Siciliano Donati on 07/05/20.
//  Copyright © 2020 Tassio Siciliano Donati. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
