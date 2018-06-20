//
//  DetailPreViewCell.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

class DetailPreViewCell: UITableViewCell {

    @IBOutlet weak var imgCollectionView: UICollectionView!
    
    var urlArray : [String]!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension DetailPreViewCell {
    func setData(urls : [String]){
        self.urlArray = urls
        
        DispatchQueue.main.async {
            self.imgCollectionView.reloadData()
        }
    }
}
//UICollectionView 관련
extension DetailPreViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.urlArray != nil ? self.urlArray.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailPreViewItemCell", for: indexPath) as? DetailPreViewItemCell,
        let array = self.urlArray else { return DetailPreViewItemCell() }
        
        if array.count > indexPath.row {
            cell.imgView.downloadImage(urlString: array[indexPath.row])
        }
        return cell
    }
}
