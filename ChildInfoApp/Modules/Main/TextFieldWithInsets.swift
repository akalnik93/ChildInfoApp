import UIKit

class TextFieldWithInsets: UITextField {
    
    var headerTextField: UILabel = {
        let label = UILabel()
        label.font = Style.Font.regular(18)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let insets: UIEdgeInsets
    
    init() {
        self.insets = UIEdgeInsets(top: 52, left: 18, bottom: 18, right: 18)
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = Style.Font.regular(18)
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemGray5.cgColor
        self.constraintsForLabelTextField()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    private func constraintsForLabelTextField() {
        self.addSubview(headerTextField)
        NSLayoutConstraint.activate([
            headerTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            headerTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            headerTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            ])
    }
    
}

class ChildNameTextField: TextFieldWithInsets {
    
    override init() {
        super.init()
        self.headerTextField.text = "Имя"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ChildAgeTextField: TextFieldWithInsets {
    
    override init() {
        super.init()
        self.headerTextField.text = "Возраст"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
