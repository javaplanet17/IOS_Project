import UIKit

class mainCollectionView: UIView,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    var indexNumber:Int = 0
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            indexNumber = indexPath.row
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "one", for: indexPath) as! oneCollectionViewCell
            cell.backgroundColor = .blue
            return cell
        }else if indexPath.row == 1{
            indexNumber = indexPath.row
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "two", for: indexPath) as! twoCollectionViewCell
            cell.backgroundColor = .red
            return cell
        }else{
            indexNumber = indexPath.row
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "three", for: indexPath) as! threeCollectionViewCell
            cell.backgroundColor = .green
             return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }

    lazy var collectionViews: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        collectionViews.register(oneCollectionViewCell.self, forCellWithReuseIdentifier: "one")
        collectionViews.register(twoCollectionViewCell.self, forCellWithReuseIdentifier: "two")
        collectionViews.register(threeCollectionViewCell.self, forCellWithReuseIdentifier: "three")
        collectionViews.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        addSubview(collectionViews)
        collectionViews.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        collectionViews.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        collectionViews.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        collectionViews.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
