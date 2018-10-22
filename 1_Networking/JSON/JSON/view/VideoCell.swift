//
//  VideoCell.swift
//  JSON
//
//  Created by alan on 7/27/18.
//  Copyright © 2018 Example. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class VideoCell: UICollectionViewCell {
    
    var title:UILabel = UILabel()
    var images:UIImageView = UIImageView()
    
    var videos:[String]?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupImage(){
        let video = Video()
        if let imageUrl = video.thumbnailImageName {
            print(imageUrl)
            
            guard let url = NSURL(string: imageUrl) else {return}
            let urls = URLRequest(url: url as URL)
            URLSession.shared.dataTask(with: urls) { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                
                DispatchQueue.global().async {
                    self.images.image = UIImage(data: data!)
                }
            }
        }
    }
    
    func setupViews(){
        //setupImage()
        
        //images.image = UIImage(data: video.thumbnailImageName)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(title)
        
        title.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        title.widthAnchor.constraint(equalToConstant: 100).isActive = true
        title.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        images.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(images)
        
        images.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        images.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        images.widthAnchor.constraint(equalToConstant: 50).isActive = true
        images.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
