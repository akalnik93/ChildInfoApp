import UIKit

class InfoViewController: UIViewController {
    
    var person = Person(personName: "", personAge: "")
    
    var childs: [Child] = []
    
    var infoView: InfoView {
        return self.view as! InfoView
    }
    
    override func loadView() {
        self.view = InfoView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoView.tableView.register(ChildCell.self, forCellReuseIdentifier: ChildCell.cellId)
        self.infoView.tableView.dataSource = self
        self.infoView.tableView.delegate = self
        self.infoView.personNameField.addTarget(self, action: #selector(self.savePersonName(_:)), for: .editingDidEndOnExit)
        self.infoView.personAgeField.addTarget(self, action: #selector(self.savePersonAge(_:)), for: .editingDidEndOnExit)
        self.infoView.buttonAddChild.addTarget(self, action: #selector(self.addChild as () -> Void), for: .touchUpInside)
        self.infoView.buttonDeleteAllChild.addTarget(self, action: #selector(self.deleteAllChild), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        print(self.infoView.tableView.contentInset)
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.infoView.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        self.infoView.tableView.contentInset = .zero
    }
    
    @objc func savePersonName(_ textField: UITextField) {
        self.person.personName = textField.text!
    }
    
    @objc func savePersonAge(_ textField: UITextField) {
        self.person.personAge = textField.text!
    }
    
    @objc func addChild() {
        self.createChild()
        self.scrollToFirstRow()
        self.buttonIsHidden()
    }
    
    @objc func deleteAllChild() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { _ in
            self.clearAll()
        }))
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(actionSheet, animated: true)
    }
    
    func clearAll() {
        self.childs.removeAll()
        self.buttonIsHidden()
        self.infoView.personNameField.text = nil
        self.infoView.personAgeField.text = nil
        self.infoView.tableView.reloadData()
    }
    
    func createChild() {
        self.childs.append(Child(childName: "", childAge: ""))
        self.infoView.tableView.reloadData()
    }

    func scrollToFirstRow() {
        if self.childs.count > 0 {
            let indexPathFirstRow = IndexPath(row: 0, section: 0)
            self.infoView.tableView.scrollToRow(at: indexPathFirstRow, at: .top, animated: true)
        }
    }
    
    func buttonIsHidden() {
        self.infoView.buttonAddChild.isHidden = self.childs.count >= 5
    }

}

extension InfoViewController: UITableViewDataSource, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.childs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.infoView.tableView.dequeueReusableCell(withIdentifier: ChildCell.cellId, for: indexPath) as? ChildCell else {
            return UITableViewCell()
        }
        let index = self.childs.count - 1 - indexPath.row
        cell.selectionStyle = .none
        cell.childNameField.delegate = self
        cell.childAgeField.delegate = self
        cell.childNameField.tag = index
        cell.childAgeField.tag = index
        cell.buttonDeleteChild.tag = index
        cell.childNameField.text = self.childs[index].childName
        cell.childAgeField.text = self.childs[index].childAge
        cell.childNameField.addTarget(self, action: #selector(self.saveEditChild(_:)), for: .editingDidEndOnExit)
        cell.childAgeField.addTarget(self, action: #selector(self.saveEditChild(_:)), for: .editingDidEndOnExit)
        cell.buttonDeleteChild.addTarget(self, action:#selector(deleteChild(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func deleteChild(_ sender: UIButton){
        self.childs.remove(at: sender.tag)
        self.buttonIsHidden()
        self.infoView.tableView.reloadData()
    }
    
    @objc func saveEditChild(_ textField: UITextField) {
        let child = self.childs[textField.tag]
        if type(of: textField) == ChildNameTextField.self {
            child.childName = textField.text!
        } else {
            child.childAge = textField.text!
        }
    }

}

extension InfoViewController: UITableViewDelegate {
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        240
    }
    
}
