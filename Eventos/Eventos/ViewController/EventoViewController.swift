//
//  EventoViewController.swift
//  Eventos
//
//  Created by Luis Felipe Tapajos on 24/03/2021.
//  Copyright © 2021 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class EventoViewController: UIViewController {

    //MARK: Internal Properties
    
    let searchBar = UISearchBar()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    var stackView: UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        return stackView
    }
    
    let viewModel = EventoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 250/255.0, green: 204/255.0, blue: 122/255.0, alpha: 1)
        // Do any additional setup after loading the view.
        prepareUI()
        setData()
        fetchEventoList()
    }
    
    func setData() {
        self.navigationItem.title = "Lista de Eventos"
    }
}

//MARK: Prepare UI

extension EventoViewController {
    func prepareUI() {
        //prepareSearchBar()
        prepareTableView()
        prepareStackView()
        prepareViewModelObserver()
    }
    
    func prepareStackView() {
        let stackView = UIStackView(arrangedSubviews: [tableView]) //, filterButton
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0.0).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
    }
    
    func prepareTableView() {
        self.view.backgroundColor = UIColor(red: 250/255.0, green: 204/255.0, blue: 122/255.0, alpha: 1)
        self.tableView.separatorStyle   = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "EventoViewCell", bundle: nil), forCellReuseIdentifier: "EventoViewCell")
        
    }
    
}

//MARK: Private Methods
extension EventoViewController {
    
    func fetchEventoList() {
        viewModel.fetchEventoList()
    }
    
    func prepareViewModelObserver() {
        self.viewModel.eventoDidChanges = { (finished, error) in
            if !error {
                self.reloadTableView()
            }
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableView Delegate And Datasource Methods
extension EventoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventos!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: EventoViewCell = tableView.dequeueReusableCell(withIdentifier: "EventoViewCell", for: indexPath as IndexPath) as? EventoViewCell else {
            fatalError("EventoCell cell is not found")
        }
        
        let evento = viewModel.eventos![indexPath.row]
        cell.eventoItem = evento
        cell.contentView.backgroundColor = UIColor(red: 250/255.0, green: 204/255.0, blue: 122/255.0, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.evento = viewModel.eventos![indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

