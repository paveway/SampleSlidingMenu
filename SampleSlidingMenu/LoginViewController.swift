//
//  LoginViewController.swift
//  SampleSlidingMenu
//
//  Created by 二俣征嗣 on 2015/11/29.
//  Copyright © 2015年 Masatsugu Futamata. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var bannerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        navigationItem.title = "ログイン"
        navigationItem.setHidesBackButton(true, animated: false)

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得する。
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        // セルが取得できない場合
        if (cell == nil) {
            // セルを生成する。
            cell = UITableViewCell()
        }

        cell?.textLabel?.text = "スタート"

        return cell!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 選択状態を解除する。
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        presentReposList()
    }

    func presentReposList() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

        appDelegate.slidingViewController = ECSlidingViewController()

        let topVc = ReposListViewController()
        let topNc = UINavigationController(rootViewController: topVc)
        appDelegate.slidingViewController!.topViewController = topNc

        let menuVc = MenuViewController()
        let menuNc = UINavigationController(rootViewController: menuVc)
        appDelegate.slidingViewController!.underLeftViewController = menuNc
        appDelegate.slidingViewController!.anchorRightRevealAmount = 250.0

        //シャドウの設定
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5.0
        view.layer.shadowColor = UIColor.grayColor().CGColor

        appDelegate.window?.rootViewController = appDelegate.slidingViewController
    }
}
