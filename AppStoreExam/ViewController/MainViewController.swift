//
//  ViewController.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 19..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var appsTableView: UITableView!
    var feedModel : Feed!
    var limit = Constants.APPSTORE_LIMIT
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setViewControllerTitle(title: "금융")
        self.getAppList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MainViewController{
    func getAppList(){
        DataResponser.getFeedList(limit: self.limit) { (model) in
            //            LogHelper.printLog("model : \(model)")
            self.feedModel = model
//            LogHelper.printLog("self.feedModel.entry?.count : \(self.feedModel.entry?.count)")
            DispatchQueue.main.async {
                self.appsTableView.reloadData()
            }
        }
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    //다이나믹뷰를 만들어주는 메소드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = self.feedModel,
            let entry = model.entry else { return 0 }
        return entry.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard let model = self.feedModel,
        let entry = model.entry else { return }
        if entry.count - 15 == indexPath.row {
            if self.limit < Constants.APPSTORE_MAX_LIMIT{
                self.limit += Constants.APPSTORE_LIMIT
                self.getAppList()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppsTableViewCell", for: indexPath) as? AppsTableViewCell,
            let model = self.feedModel,
            let entry = model.entry else { return AppsTableViewCell() }
        
        if entry.count > indexPath.row{
            let item = entry[indexPath.row]
            
            if let title = item.title, let titleLabel = title.label, let subTitle = item.rights, let subTitleLabel = subTitle.label, let imImage = item.imImage {
                
                cell.titleLabel.text = titleLabel
                cell.subTitleLabel.text = subTitleLabel
                
                if imImage.count > 0 && imImage[0].label != nil{
                    cell.imgView.downloadImage(urlString: imImage[0].label!)
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.returnVC(sbName: Constants.STORYBOARD_TYPE_DETAIL, vcName: "DetailViewController") as? DetailViewController,
            let model = self.feedModel,
            let entry = model.entry else { return  }
        
        if entry.count > indexPath.row {
            let item = entry[indexPath.row]
            if let id = item.id, let attributes = id.attributes , let appstoreID = attributes["im:id"] ,let imName = item.imName, let title = imName.label{
                LogHelper.printLog("appstoreID : \(appstoreID)")
                
                // set data
                detailVC.viewTitle = title
                detailVC.appstoreID = appstoreID
                detailVC.ranking = indexPath.row
                
                self.push(vc: detailVC)
            }
        }
    }
}

