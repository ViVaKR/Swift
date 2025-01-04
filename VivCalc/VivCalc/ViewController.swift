import UIKit

class ViewController: UIViewController {
    @IBOutlet var firstOperandField: UITextField!
    
    @IBOutlet var secondOperandField: UITextField!
    
    @IBOutlet var operatorButton: UIButton!
    
    @IBAction func selectOperator(_ sender: Any) {
        // Action Sheet
        print("Action Sheet")
        
        let actionSheet = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        
        // `+`
        let plus = UIAlertAction(title: "+ (덧셈)", style: .default) { _ in
            self.operatorButton.setTitle("+", for: .normal)
        }
        actionSheet.addAction(plus)
        
        // `-`
        let minus = UIAlertAction(title: "- (뺄셈)", style: .default) { _ in
            self.operatorButton.setTitle("-", for: .normal)
        }
        
        // `X`
        actionSheet.addAction(minus)
        
        let multiply = UIAlertAction(title: "X (곱셈)", style: .default) { _ in
            self.operatorButton.setTitle("X", for: .normal)
        }
        
        actionSheet.addAction(multiply)
        
        // `/`
        let divide = UIAlertAction(title: "/ (나눗셈)", style: .default) { _ in
            self.operatorButton.setTitle("/", for: .normal)
        }
        actionSheet.addAction(divide)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func calculate(_ sender: Any) {
        let a = Int(firstOperandField.text!)!
        let b = Int(secondOperandField.text!)!
        
        var sum = 0
        
        let op = operatorButton.title(for: .normal)!
        
        if (a == 0 || b == 0) && op == "/" {
            resultLabel.text = "Can't divide by zero!"
            return
        }
        
        switch op {
            case "+": sum = a + b
            case "-": sum = a - b
            case "X": sum = a * b
            case "/": sum = a / b
            default: break
        }
        
        let result = "\(a) \(op) \(b) = \(sum)"
        resultLabel.text = "\(result)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
