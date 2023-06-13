//
//  AllCustomerAdminPanelVC.swift
//  Kahveen
//
//  Created by Burak Altunoluk on 13/06/2023.
//

import UIKit

class AllCustomerAdminPanelVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getCustomers()
    
    }
    

    
    func getCustomers() {
        
        let url = URL(string: "https://www.kahveen.com/test/tum_kisiler.php")
        URLSession.shared.dataTask(with: url!) { data, response, error in
        
            if let data = data {
                
                let datam = try! JSONDecoder().decode(CustomersModel.self, from: data)
                
                for name in datam.customers {
                    
                    self.nameArray.append(name.cus_name)
                    print(self.nameArray)
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
            
        }.resume()
        
       
        
        
    }
    
    
    
    

}


extension AllCustomerAdminPanelVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    
    
    
    
    
}
