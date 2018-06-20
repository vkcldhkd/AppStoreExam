//
//  DetailTitleViewCell.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

class DetailTitleViewCell: UITableViewCell {

    @IBOutlet weak var detailImgView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailSubTitleLabel: UILabel!
    @IBOutlet weak var detailOpenAppstoreButton: UIButton!
    @IBOutlet weak var detailRatingLabel: UILabel!
    @IBOutlet weak var detailRankingLabel: UILabel!
    @IBOutlet weak var detailAgeLabel: UILabel!
    
    var appstoreURL : String!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.detailImgView.layer.cornerRadius = 20
        self.detailOpenAppstoreButton.addTarget(self, action: #selector(self.openAppStore(_:)), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension DetailTitleViewCell {
    @objc func openAppStore(_ sender : UIButton){
        guard let appstoreURL = self.appstoreURL,
            let url = URL(string: appstoreURL) else { return }
        
        #if (arch(x86_64) || arch(i386)) && os(iOS)
            LogHelper.printLog("Simulator에서는 앱스토어 실행 불가!")
            
            guard let topVC = UIApplication.shared.topViewController() else { return }
            let alertVC = UIAlertController(title: "Simulator에서는 앱스토어 실행 불가!", message: nil, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
            
            DispatchQueue.main.async {
                topVC.present(alertVC, animated: true, completion: nil)
            }
            
        #else
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        #endif

        

    }
}
