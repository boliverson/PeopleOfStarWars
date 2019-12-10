//
//  PeopleOfStarWars.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import UIKit

class PeopleOfStarWars: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, IndividualDownloadComplete {
    
    @IBOutlet var tableview: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var searchBar: UISearchBar!
    var peopleOfStarWars = [Individual]()
    
    let downloadIndividuals = DownloadIndividual()
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
    var blurEffectView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        startActivityIndicator(blur: blurEffectView, ai: activityIndicator)
        
        tableview.register(UINib(nibName: String(describing: IndividualQuickView.self), bundle: nil), forCellReuseIdentifier: String(describing: IndividualQuickView.self))
        tableview.delegate = self
        tableview.dataSource = self
        
        DispatchQueue.global().async {
            self.downloadIndividuals.individualDownloadDelegate = self
            self.downloadIndividuals.downloadAction()
        }
    }
    
    func loadUI() {
        DispatchQueue.main.async {
            let count: Int = (self.searchBar.text?.count) ?? 0
            let searchText = self.searchBar.text ?? ""
            if count > 0 {
                self.peopleOfStarWars = EntityInteractor.getEntityWithPredicate(entityName: String(describing: Individual.self), predicate: String(format: "firstName CONTAINS[c] %@ OR lastName CONTAINS[c] %@", searchText, searchText)) as! [Individual]
            }else {
               self.peopleOfStarWars = EntityInteractor.getEntityWithPredicate(entityName: String(describing: Individual.self), predicate: "firstName.length > 0") as! [Individual]
            }
            self.tableview.reloadData()
            self.stopActivityIndicator(blur: self.blurEffectView, ai: self.activityIndicator)
        }
    }

    @IBAction func didSelectSort(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleOfStarWars.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: IndividualQuickView.self), for: indexPath) as! IndividualQuickView
        cell.setUpCell(individualId: peopleOfStarWars[indexPath.row].objectID)
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: IndividualDetail.self)) as! IndividualDetail
        controller.selectedIndividual = peopleOfStarWars[indexPath.row]
        
        self.present(controller, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.loadUI()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

