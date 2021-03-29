import UIKit

protocol DetalhesEventoDataSourceProtocol: class {
    
}

class DetalhesEventoDataSource: NSObject {
    
    weak var parentView: DetailViewController?
    
    init(attachView: DetailViewController) {
        super.init()
        self.parentView = attachView
        attachView.tableView.delegate = self
        attachView.tableView.dataSource = self
    }
    
}

// MARK: - UITableView Delegate And Datasource Methods
extension DetalhesEventoDataSource: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.parentView!.viewModel.detalhesEventos?.title!.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellIdentifier")
        }
        cell.textLabel?.text = self.parentView!.viewModel.detalhesEventos!.title ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width
    }
}

