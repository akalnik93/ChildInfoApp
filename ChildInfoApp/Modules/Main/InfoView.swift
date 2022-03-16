import UIKit

class InfoView: UIView {
    
    var personNameField = TextFieldWithInsets()
    
    var personAgeField = TextFieldWithInsets()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var labelHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = Style.Font.regular(20)
        label.textColor = .black
        label.text = "Персональные данные"
        return label
    }()

    var labelForTableHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = Style.Font.regular(20)
        label.textColor = .black
        label.text = "Дети (макс. 5)"
        label.clipsToBounds = true
        return label
    }()
    
    var buttonAddChild: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundColor(color: .white, forState: .normal)
        button.setBackgroundColor(color: .blue.withAlphaComponent(0.1), forState: .highlighted)
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
    }()
    
    var labelForButtonAddChild: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Style.Font.regular(20)
        label.textColor = .blue
        label.text = "Добавить ребёнка"
        return label
    }()
    
    var buttonDeleteAllChild: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundColor(color: .white, forState: .normal)
        button.setBackgroundColor(color: .red.withAlphaComponent(0.1), forState: .highlighted)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
    }()
    
    var labelForButtonDeleteAll: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Style.Font.regular(20)
        label.textColor = .red
        label.text = "Очистить"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.personNameField.headerTextField.text = "Имя"
        self.personAgeField.headerTextField.text = "Возраст"
        self.labelHeaderConstraints()
        self.textFieldNameConstraints()
        self.textFieldAgeConstraints()
        self.labelForTableHeaderConstraints()
        self.buttonAddChildConstraints()
        self.labelForButtonAddChildConstraints()
        self.buttonDeleteAllConstraints()
        self.labelForButtonDeleteAllConstraints()
        self.tableViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func labelHeaderConstraints() {
        self.addSubview(self.labelHeader)
        NSLayoutConstraint.activate([
            labelHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            labelHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            labelHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            labelHeader.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    private func textFieldNameConstraints() {
        self.addSubview(self.personNameField)
        NSLayoutConstraint.activate([
            personNameField.topAnchor.constraint(equalTo: self.labelHeader.bottomAnchor),
            personNameField.leadingAnchor.constraint(equalTo: self.labelHeader.leadingAnchor),
            personNameField.trailingAnchor.constraint(equalTo: self.labelHeader.trailingAnchor),
            personNameField.heightAnchor.constraint(equalToConstant: 90)
            ])
    }
    
    private func textFieldAgeConstraints() {
        self.addSubview(self.personAgeField)
        NSLayoutConstraint.activate([
            personAgeField.topAnchor.constraint(equalTo: self.personNameField.bottomAnchor, constant: 18),
            personAgeField.leadingAnchor.constraint(equalTo: self.labelHeader.leadingAnchor),
            personAgeField.trailingAnchor.constraint(equalTo: self.labelHeader.trailingAnchor),
            personAgeField.heightAnchor.constraint(equalToConstant: 90)
            ])
    }
    
    private func labelForTableHeaderConstraints() {
        self.addSubview(self.labelForTableHeader)
        NSLayoutConstraint.activate([
            labelForTableHeader.topAnchor.constraint(equalTo: self.personAgeField.bottomAnchor),
            labelForTableHeader.leadingAnchor.constraint(equalTo: self.labelHeader.leadingAnchor),
            labelForTableHeader.widthAnchor.constraint(equalToConstant: 140),
            labelForTableHeader.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    private func buttonAddChildConstraints() {
        self.addSubview(self.buttonAddChild)
        NSLayoutConstraint.activate([
            buttonAddChild.topAnchor.constraint(equalTo: self.personAgeField.bottomAnchor, constant: 10),
//            buttonAddChild.widthAnchor.constraint(equalToConstant: 220),
            buttonAddChild.leadingAnchor.constraint(equalTo: self.labelForTableHeader.trailingAnchor),
            buttonAddChild.trailingAnchor.constraint(equalTo: self.labelHeader.trailingAnchor),
            buttonAddChild.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    private func labelForButtonAddChildConstraints() {
        self.buttonAddChild.addSubview(self.labelForButtonAddChild)
        NSLayoutConstraint.activate([
            labelForButtonAddChild.centerXAnchor.constraint(equalTo: self.buttonAddChild.centerXAnchor),
            labelForButtonAddChild.centerYAnchor.constraint(equalTo: self.buttonAddChild.centerYAnchor)
            ])
    }
    
    private func buttonDeleteAllConstraints() {
        self.addSubview(self.buttonDeleteAllChild)
        NSLayoutConstraint.activate([
            buttonDeleteAllChild.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            buttonDeleteAllChild.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 96),
            buttonDeleteAllChild.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -96),
            buttonDeleteAllChild.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    private func labelForButtonDeleteAllConstraints() {
        self.buttonDeleteAllChild.addSubview(self.labelForButtonDeleteAll)
        NSLayoutConstraint.activate([
            labelForButtonDeleteAll.centerXAnchor.constraint(equalTo: self.buttonDeleteAllChild.centerXAnchor),
            labelForButtonDeleteAll.centerYAnchor.constraint(equalTo: self.buttonDeleteAllChild.centerYAnchor)
            ])
    }
    
    private func tableViewConstraints() {
        self.addSubview(self.tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.labelForTableHeader.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.buttonDeleteAllChild.topAnchor, constant: -10)
            ])
    }
    
}
