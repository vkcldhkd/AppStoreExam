//
//  DetailViewController.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailTableView: UITableView!
    
    var viewTitle : String!
    var appstoreID : String!
    var ranking : Int!
    var feedDetailModel : FeedDetailModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getInfo()
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let viewTitle = self.viewTitle else { return }
        self.setViewControllerTitle(title: viewTitle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.detailTableView.reloadData()
    }
}
extension DetailViewController {
    func getInfo(){
        DataResponser.getDetailInfo(id: self.appstoreID) { (model) in
//            LogHelper.printLog("model : \(model)")
            guard let model = model else { return }
            self.feedDetailModel = model
            
            DispatchQueue.main.async {
                self.detailTableView.reloadData()
            }
        }
    }
}

extension DetailViewController : UITableViewDataSource, UITableViewDelegate {
    //다이나믹뷰를 만들어주는 메소드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // 타이틀, 새로운기능, 미리보기, 내용
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let model = self.feedDetailModel, let results = model.results, results.count > 0{
            let result = results[0]
            
            switch indexPath.section {
            case 0 :
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTitleViewCell", for: indexPath) as? DetailTitleViewCell,
                    let imgURL = result.artworkUrl100,
                    let title = result.trackName,
                    let age = result.trackContentRating,
                    let artistName = result.artistName,
                    let rating = result.averageUserRating,
                    let appstoreURL = result.trackViewURL,
                    let ranking = self.ranking
                    else { return DetailTitleViewCell() }
                
                cell.appstoreURL = appstoreURL
                cell.detailImgView.downloadImage(urlString: imgURL)
                cell.detailTitleLabel.text = title
                cell.detailSubTitleLabel.text = artistName
                cell.detailRatingLabel.text = "\(rating)"
                cell.detailRankingLabel.text = "#\(ranking + 1)"
                cell.detailAgeLabel.text = age
                
                return cell
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailNewFunctionViewCell", for: indexPath) as? DetailNewFunctionViewCell ,
                let content = result.releaseNotes else { return DetailNewFunctionViewCell()}
                
                cell.contentLabel.text = content
                return cell
                
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailPreViewCell", for: indexPath) as? DetailPreViewCell ,
                let urls = result.screenshotUrls else { return DetailPreViewCell() }
                cell.setData(urls: urls)
                return cell
                
            case 3:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailContentViewCell", for: indexPath) as? DetailContentViewCell,
                    let content = result.description else { return DetailContentViewCell() }
                cell.contentLabel.text = content
                return cell
            default :
                return UITableViewCell()
            }
        }
        
        
        return UITableViewCell()
    }
}
