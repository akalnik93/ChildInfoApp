import UIKit

class ChildCell: UITableViewCell {
    
    var childNameField = ChildNameTextField()
    
    var childAgeField = ChildAgeTextField()
    
    static let cellId = "childCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.childNameField.headerTextField.text = "Имя"
        self.childAgeField.headerTextField.text = "Возраст"
        self.childNameFieldConstraints()
        self.buttonDeleteChildConstraints()
        self.labelForButtonDeleteChildConstraints()
        self.childAgeFieldConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var buttonDeleteChild: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        return button
    }()
    
    var labelForButtonDeleteChild: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Style.Font.regular(20)
        label.textColor = .blue
        label.text = "Удалить"
        return label
    }()
    
    private func childNameFieldConstraints() {
        self.contentView.addSubview(self.childNameField)
        NSLayoutConstraint.activate([
            childNameField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            childNameField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            childNameField.widthAnchor.constraint(equalToConstant: 200),
            childNameField.heightAnchor.constraint(equalToConstant: 90)
            ])
    }
    
    private func buttonDeleteChildConstraints() {
        self.contentView.addSubview(self.buttonDeleteChild)
        NSLayoutConstraint.activate([
            buttonDeleteChild.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 40),
            buttonDeleteChild.widthAnchor.constraint(equalToConstant: 100),
            buttonDeleteChild.leadingAnchor.constraint(equalTo: self.childNameField.trailingAnchor, constant: 24),
            buttonDeleteChild.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func labelForButtonDeleteChildConstraints() {
        self.buttonDeleteChild.addSubview(self.labelForButtonDeleteChild)
        NSLayoutConstraint.activate([
            labelForButtonDeleteChild.centerXAnchor.constraint(equalTo: self.buttonDeleteChild.centerXAnchor),
            labelForButtonDeleteChild.centerYAnchor.constraint(equalTo: self.buttonDeleteChild.centerYAnchor)
            ])
    }
    
    private func childAgeFieldConstraints() {
        self.contentView.addSubview(self.childAgeField)
        NSLayoutConstraint.activate([
            childAgeField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            childAgeField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            childAgeField.widthAnchor.constraint(equalToConstant: 200),
            childAgeField.heightAnchor.constraint(equalToConstant: 90)
            ])
    }

}
