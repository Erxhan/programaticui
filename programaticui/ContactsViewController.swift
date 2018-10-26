//
//  ContactsViewController.swift
//  programaticui
//
//  Created by Exrhan Selmani on 26/10/2018.
//  Copyright © 2018 Exrhan Selmani. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let contactsTableView = UITableView()
    private let contacts = ContactAPI.getContacts()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Contacts Table View
        view.addSubview(contactsTableView)
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.contact = contacts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func setupNavigation() {
        navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.barTintColor = _ColorLiteralType(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:_ColorLiteralType(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    

}
