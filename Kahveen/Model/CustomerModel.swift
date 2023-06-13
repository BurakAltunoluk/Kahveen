//
//  CustomerModel.swift
//  Kahveen
//
//  Created by Burak Altunoluk on 13/06/2023.
//

import Foundation

struct CustomersModel:Codable {
    
    var customers: [CustomerModel]
    
}


struct CustomerModel:Codable {
    
    
    var cus_id: String
    var cus_name: String
    var cus_shopName: String
    var cus_tel: String
    var cus_address: String
    var cus_postcode: String
    var cus_point: String
    
    
    
}
