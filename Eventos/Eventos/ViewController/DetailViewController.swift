import UIKit

class DetailViewController: UIViewController {

    //MARK: Internal Properties
    
    var evento: ListaEventos?
    let textView = UITextView()
    var stackView: UIStackView {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        return stackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        setData()
    }
    
    func setData() {
        self.navigationItem.title = "Detalhes do Evento"
        print(evento?.title! ?? "")
    }

}

//MARK: Prepare UI

extension DetailViewController {
    func prepareUI() {
        prepareTextView()
        prepareStackView()
    }
    
    func prepareStackView() {
        let stackView = UIStackView(arrangedSubviews: [textView]) //, filterButton
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
    
    func prepareTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.white
        textView.text = evento?.description
        textView.isEditable = false
    }
}
