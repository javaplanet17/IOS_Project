//
//  ViewController.swift
//  ExpandalbleTableView
//
//  Created by alan on 10/22/18.
//  Copyright © 2018 onedevz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let table = tableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        table.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(table)
    }
}

