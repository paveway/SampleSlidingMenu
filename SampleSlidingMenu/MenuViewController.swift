//
//  MenuViewController.swift
//  SampleSlidingMenu
//
//  Created by 二俣征嗣 on 2015/11/29.
//  Copyright © 2015年 Masatsugu Futamata. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let kCellTitleList = ["リポジトリ一覧", "ギスト一覧"]

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var bannerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        navigationItem.title = "メニュー"

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kCellTitleList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得する。
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        // セルが取得できない場合
        if (cell == nil) {
            // セルを生成する。
            cell = UITableViewCell()
        }

        let row = indexPath.row

        cell?.textLabel?.text = kCellTitleList[row]

        return cell!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 選択状態を解除する。
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let row = indexPath.row

        switch (row) {
        case 0:
            let vc = ReposListViewController()
            resetTopView(vc)
            break

        case 1:
            let vc = GistsListViewController()
            resetTopView(vc)
            break

        default:
            break
        }
    }

    func resetTopView(vc: UIViewController) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let slidingViewController = appDelegate.slidingViewController!
        let nc = UINavigationController(rootViewController: vc)
        slidingViewController.topViewController = nc
        slidingViewController.resetTopViewAnimated(true)
    }
}
