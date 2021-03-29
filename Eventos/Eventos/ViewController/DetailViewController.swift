import UIKit
import Alamofire

class DetailViewController: UIViewController {

    //MARK: Internal Properties
    
    var evento: ListaEventos?
    var detalhesEvento: DetalhesEventos?
    
    var eventoId: String?
    
    let tableView = UITableView(frame: .zero, style: .plain)
    var stackView: UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        return stackView
    }
    
    let viewModel = DetalhesEventoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        setData()
        eventoId = evento!.id
        fetchEventoList()
    }
    
    func setData() {
        self.navigationItem.title = "Detalhes do Evento"
    }

}

//MARK: Prepare UI

extension DetailViewController {
    func prepareUI() {
        prepareTableView()
        prepareStackView()
        prepareViewModelObserver()
        
    }
    
    func prepareTableView() {
        self.view.backgroundColor = .white
        self.tableView.separatorStyle   = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "DetalhesEventoViewCell", bundle: nil), forCellReuseIdentifier: "DetalhesEventoViewCell")
    }
    
    func prepareStackView() {
        let stackView = UIStackView(arrangedSubviews: [tableView])
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
}

//MARK: Action

extension DetailViewController {
    
    @objc func shareButtonTapped(_ button: UIButton) {
        //viewModel.eventos = viewModel.eventos?.sorted(by: .title)
        //print("compartilhar o evento: \(evento!.title!)")
    }
    
    @objc func favoriteButtonTapped(_ button: UIButton) {
        //viewModel.eventos = viewModel.eventos?.sorted(by: .title)
        //print("Favoritar o evento: \(evento!.title!)")
    }
}

//MARK: Private Methods

extension DetailViewController {
    
    func fetchEventoList() {
        viewModel.eventoId = eventoId
        viewModel.fetchDetalhesEventoList()
    }
    
    func prepareViewModelObserver() {
        self.viewModel.detalhesEventoDidChanges = { (finished, error) in
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
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: DetalhesEventoViewCell = tableView.dequeueReusableCell(withIdentifier: "DetalhesEventoViewCell", for: indexPath as IndexPath) as? DetalhesEventoViewCell else {
            fatalError("DetalhesEventoViewCell cell is not found")
        }
        
        let evento = viewModel.detalhesEventos
        cell.eventoItem = evento
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width
    }
    
}
