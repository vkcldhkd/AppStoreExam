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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            return UITableViewCell()
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommonEmptyCell", for: indexPath) as? CommonEmptyCell else { return CommonEmptyCell() }
            return cell
        }
        
    }
}

