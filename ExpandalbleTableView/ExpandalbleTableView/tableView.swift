//
//  tableView.swift
//  ExpandalbleTableView
//
//  Created by alan on 10/22/18.
//  Copyright © 2018 onedevz. All rights reserved.
//

import UIKit

struct cellData{
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}
class tableView: UIView,UITableViewDataSource,UITableViewDelegate {
    
    let tableViews = UITableView()
    var tableViewData = [cellData]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return tableViewData[section].sectionData.count + 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var dataIndex = indexPath.row - 1
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true{
            tableViewData[indexPath.section].opened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none) // this is for animation
        }else{
            tableViewData[indexPath.section].opened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none) // this is for animation
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    override func didMoveToSuperview() {
       setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        tableViewData = [cellData(opened: false, title: "Title1", sectionData: ["cell 1","cell 2","cell 3"]),
            cellData(opened: false, title: "Title2", sectionData: ["cell 1","cell 2","cell 3"]),
            cellData(opened: false, title: "Title3", sectionData: ["cell 1","cell 2","cell 3"])
        ]

        tableViews.delegate = self
        tableViews.dataSource = self
        tableViews.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableViews.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableViews)
        tableViews.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        tableViews.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        tableViews.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        tableViews.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true
    }
}
