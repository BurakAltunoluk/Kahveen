//
//  DetailsAndOrderVC.swift
//  Kahveen
//
//  Created by Burak Altunoluk on 21/05/2023.
//

import UIKit

class DetailsAndOrderVC: UIViewController {

    @IBOutlet weak var titleImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goback))
        titleImage.addGestureRecognizer(gesture)
    }
    
    @objc func goback() {
        dismiss(animated: true)
    }


}
