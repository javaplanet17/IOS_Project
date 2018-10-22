//
//  ViewController.swift
//  JSON
//
//  Created by alan on 7/27/18.
//  Copyright © 2018 Example. All rights reserved.
//

import UIKit


class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

//    var videos:[Video] = {
//       var blankVideo = Video()
//
//        var newVideo = Video()
//
//        return [blankVideo,newVideo]
//    }()
    // make it optional
    var videos:[String]?
    func fetchVideos(){
        
        guard let url = NSURL(string: "http://localhost/test/home.json") else {return}
        let urls = URLRequest(url: url as URL)
        URLSession.shared.dataTask(with: urls) { (data, response, error) in
            if error != nil {
                print(error ?? AnyClass.self)
                return
            }
            
            do
            {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                // initialize the variable
                self.videos = [String]()
                
                // printing out all title in the json file
                for dictionary in json as! [[String:AnyObject]]{
                    
                    let video = Video()

                    // have to be downcast as a string instead of anyobject
                    video.Title = dictionary["title"] as! String
                    //video.thumbnailImageName = dictionary["thumbnail_image_name"] as! String
                    
                    // add new video
                   // self.videos?.append(video)
                    print(dictionary["title"])
                }
                
                self.collectionView?.reloadData()
                
                // print json in a better view
                //print(json)
            }catch let jsonError{
                print(jsonError)
            }
            
            // printing out raw json file
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(str ?? AnyClass.self)
        }.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fetchVideos()
    
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "video")
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "video", for: indexPath) as! VideoCell
        cell.backgroundColor = .red
        cell.videos = [self.videos?[indexPath.row]] as! [String]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 400)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

