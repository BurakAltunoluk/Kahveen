//
//  ViewController.swift
//  Kahveen
//  Created by Burak Altunoluk on 14/05/2023.
//

import UIKit

final class MainVC: UIViewController {
    
    //MARK: Priortiy
 
    @IBOutlet weak var mainBackgroundImage: UIImageView!
    @IBOutlet weak var tableViewMenu: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    private let screenY = UIScreen.main.bounds.height
    private let screenX = UIScreen.main.bounds.width
    private var orderItImage = UIImageView()
    private var imageLogo = UIImageView()
    private var coffeeOptionImageLogo = UIImageView()
    private var menuStatus = true
    private var menuOpen = false
    @IBOutlet weak var contactDetailsVC: UIView!
    @IBOutlet weak var menuButtonImage: UIImageView!
    @IBOutlet weak var menuView: UIView!
    
    private var menuList = ["My Orders","My Account","Contact Supplier","Sign Out"]
    
    //MARK: Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.isHidden = true
        menuButtonImage.isUserInteractionEnabled = true
        mainBackgroundImage.isUserInteractionEnabled = true
        createOrderOptionsImage()
        logoBrandCreat()
        mainButton()
        gestures()
        collectionView.alpha = 0
        coffeeOptionImageLogo.alpha = 0
        
        let menuGesture = UITapGestureRecognizer(target: self, action: #selector(menuButtonCommand))
        let backgroundGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundGesture))
       
        mainBackgroundImage.addGestureRecognizer(backgroundGesture)
       
        menuButtonImage.addGestureRecognizer(menuGesture)
        
        menuView.layer.cornerRadius = 15
        tableViewMenu.layer.cornerRadius = 15
    }
    
    //MARK: Functions
    func mainButton() {
        self.orderItImage = UIImageView(frame: CGRect(x: 0, y:0 , width: screenX / 2, height: screenX / 2))
        orderItImage.center = view.center
        orderItImage.image = UIImage(named: "MainCoffeeOrderButton")
        view.addSubview(orderItImage)
    }
    
    func gestures() {
        orderItImage.isUserInteractionEnabled = true
        coffeeOptionImageLogo.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(orderButtonCommand))
        coffeeOptionImageLogo.addGestureRecognizer(gesture)
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(orderButtonCommand))
        orderItImage.addGestureRecognizer(gesture1)
    }
    
    func logoBrandCreat() {

        print(screenY)
        self.imageLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: screenX / 2, height: screenY / 7))
        imageLogo.image = UIImage(named: "LogoBrand")
        imageLogo.center.x = view.center.x
        imageLogo.center.y += view.center.y - screenX / 3.5 - 180
        view.addSubview(imageLogo)
        
    }
    
    
    @objc func orderButtonCommand() {
        UIView.animate(withDuration: 0.3, animations:{
                self.orderItImage.alpha = self.menuStatus == true ? 0 : 1
                self.coffeeOptionImageLogo.alpha = self.menuStatus == true ? 1 : 0
                self.collectionView.alpha = self.menuStatus == true ? 1 : 0
                self.imageLogo.alpha = self.menuStatus == true ? 0 : 1
                self.contactDetailsVC.alpha = self.menuStatus == true ? 0 : 1
          })
        
        self.menuStatus.toggle()
      
    }
    
    func createOrderOptionsImage() {
        
        self.coffeeOptionImageLogo.frame = CGRect(x: 0, y: 30, width: screenX, height: screenX / 3.5)
        self.coffeeOptionImageLogo.center.x = view.center.x
        coffeeOptionImageLogo.image = UIImage(named: "OrderLine")
        view.addSubview(coffeeOptionImageLogo)
    }
    
    @objc func backgroundGesture() {
        if self.menuOpen {
           
                self.menuView.isHidden = true
                self.orderItImage.isHidden = false
                self.imageLogo.isHidden = false
                self.menuOpen.toggle()
        }
       
    }
    
    @objc func menuButtonCommand() {
        if self.menuOpen {
           
                self.menuView.isHidden = true
                self.orderItImage.isHidden = false
                self.imageLogo.isHidden = false
            
        } else {
            
            self.menuView.isHidden = false
            self.orderItImage.isHidden = true
            self.imageLogo.isHidden = true
            
        }
        self.menuOpen.toggle()
    }
  }

//MARK: Collection View
extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.frame = CGRect(x: 0, y: screenX / 3.5 + 35, width: screenX - 20, height: screenY -  screenX / 3.5 - 80 )
        collectionView.layer.cornerRadius = 15
        collectionView.center.x = view.center.x
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell1", for: indexPath) as! CollectionViewCell
        Cell.imageView.image = UIImage(named: "longBackground")
        Cell.layer.cornerRadius = 20
     
        return Cell
    }
}

 extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 368, height: 216)
    }
     
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
           DispatchQueue.main.asyncAfter(deadline: .now() ) {
               self.performSegue(withIdentifier: "detailsVC", sender: nil)
           }
       }
     
     
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableViewMenu.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        
        cell.title.text = menuList[indexPath.row]
     
        return cell
        
    }
    
}
