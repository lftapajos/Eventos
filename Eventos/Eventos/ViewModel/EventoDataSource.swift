import UIKit

protocol EventoDataSourceProtocol: class {
    
}

class EventoDataSource: NSObject {
    
    weak var parentView: EventoViewController?
    
    init(attachView: EventoViewController) {
        super.init()
        self.parentView = attachView
        attachView.tableView.delegate = self
        attachView.tableView.dataSource = self
    }
    
}

// MARK: - UITableView Delegate And Datasource Methods
extension EventoDataSource: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parentView!.viewModel.eventos!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellIdentifier")
        }
        cell.textLabel?.text = self.parentView!.viewModel.eventos![indexPath.row].title ?? ""
        
        return cell
    }
}
