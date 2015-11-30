//
//  StartViewController.swift
//  SampleSlidingMenu
//
//  Created by 二俣征嗣 on 2015/11/29.
//  Copyright © 2015年 Masatsugu Futamata. All rights reserved.
//

import UIKit

class ReposListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var bannerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        navigationItem.title = "リポジトリ一覧"

        createRightBarButton(title: "ログアウト")

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        setupSlidingView()
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

        cell?.textLabel?.text = "リポジトリ名"

        return cell!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 選択状態を解除する。
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func createRightBarButton(title title: String) {
        let action = Selector("rightBarButtonPressed:")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .Plain, target: self, action: action)
    }

    func rightBarButtonPressed(sender: UIButton) {
        let vc = TopViewController()
        let nc = UINavigationController(rootViewController: vc)

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = nc
    }

    func setupSlidingView() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        view.addGestureRecognizer(appDelegate.slidingViewController!.panGesture)
    }

}
