import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var conditionImageView: UIImageView!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet var searchTextField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    searchTextField.delegate = self
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchTextField.endEditing(true)
    print(searchTextField.text)
    return true
    
  }
  
  @IBAction func searchPressed(_ sender: Any) {
    print(searchTextField.text!)
    searchTextField.endEditing(true)
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    if searchTextField.text != "" {
      return true
    } else {
      textField.placeholder = "Ты долбоеб!"
      return false
    }
     
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
    searchTextField.text = ""
    return true
    
    
  }
  
}

