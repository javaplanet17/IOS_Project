//
//  tableViewCell.swift
//  ExpandalbleTableView
//
//  Created by alan on 10/22/18.
//  Copyright © 2018 onedevz. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    let label = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier) // the common code is executed in this super call
        // code unique to CellOne goes here
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        label.text = "new"
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
