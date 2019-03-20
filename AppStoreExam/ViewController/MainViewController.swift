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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAppList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setViewControllerTitle(title: "iOS 무료 앱 순위 1-100")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.appsTableView.reloadData()
    }
}

extension MainViewController{
    func getAppList(){
        DataResponser.getFeedList() { [weak self] model in
            guard let self = self else { return }
            
            self.feedModel = model
            DispatchQueue.main.async {
                self.appsTableView.reloadData()
            }
        }
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = self.feedModel,
            let results = model.results else { return 0 }
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppsTableViewCell", for: indexPath) as? AppsTableViewCell,
            let model = self.feedModel,
            let results = model.results else { return AppsTableViewCell() }
        
        if results.count > indexPath.row{
            let item = results[indexPath.row]
            
            
            if let title = item.name, let subTitle = item.copyright, let imImage = item.artworkUrl100 {
                
                cell.titleLabel.text = title
                cell.subTitleLabel.text = subTitle
                cell.imgView.downloadImage(urlString: imImage)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailVC = self.returnVC(sbName: Constants.STORYBOARD_TYPE_DETAIL, vcName: "DetailViewController") as? DetailViewController,
            let model = self.feedModel,
            let results = model.results else { return  }
        
        if results.count > indexPath.row {
            let item = results[indexPath.row]
            if let appstoreID = item.id, let title = item.name{
                //                LogHelper.printLog("appstoreID : \(appstoreID)")
                
                // set data
                detailVC.viewTitle = title
                detailVC.appstoreID = appstoreID
                detailVC.ranking = indexPath.row
                
                self.push(vc: detailVC)
            }
        }
    }
}

