//
//  NSObject+.swift
//  35th-SOPKATHON-Team3-iOS
//
//  Created by 조혜린 on 11/22/24.
//

import Foundation


extension NSObject {
    
    /// 클래스의 이름
    /// UICollectionView 혹은 UITableView에서 identifier를 하드코딩 하지 않기 위해 사용
    /// > 사용 예시 : `collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.className, for: indexPath)`
    static var className: String {
        return String(describing: self)
    }
    
}
