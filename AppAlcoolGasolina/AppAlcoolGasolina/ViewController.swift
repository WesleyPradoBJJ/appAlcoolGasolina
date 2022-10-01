//
//  ViewController.swift
//  AppAlcoolGasolina
//
//  Created by Wesley Prado on 01/10/2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    @IBOutlet weak var ethanolPriceLabel: UILabel!
    @IBOutlet weak var ethanolPriceTextField: UITextField!
    
    @IBOutlet weak var gasPriceLabel: UILabel!
    @IBOutlet weak var gasPriceTextField: UITextField!
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configFontsAndColors()
    }

    func configFontsAndColors (){
        view.backgroundColor = .green
        //logoImageView.image = UIImage(named: "")
        ethanolPriceLabel.text = "Preço Álcool"
        ethanolPriceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        ethanolPriceTextField.placeholder = "Ex: 2.99"
        ethanolPriceTextField.textAlignment = .center
        ethanolPriceTextField.keyboardType = .decimalPad
        ethanolPriceTextField.delegate = self
        
        
        
        gasPriceLabel.text = "Preço Gasolina"
        gasPriceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        gasPriceTextField.placeholder = "Ex: 2.99"
        gasPriceTextField.textAlignment = .center
        gasPriceTextField.keyboardType = .decimalPad
        //gasPriceTextField.
        gasPriceTextField.delegate = self
        
        calculateButton.setTitle("Calcular", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.backgroundColor = .blue
        calculateButton.isEnabled = false
        calculateButton.setTitleColor(.white.withAlphaComponent(0.5), for: .disabled)
        
        resultLabel.text = "Digite os preços!"
        resultLabel.textColor = .white
        
    }
    
    @IBAction func tappedCalculateButton(_ sender: UIButton) {
        let ethanolPrice:Double = Double(ethanolPriceTextField.text ?? "") ?? 0.0
        let gasPrice:Double = Double(gasPriceTextField.text ?? "") ?? 0.0
        
        if ethanolPrice / gasPrice > 0.7 {
            resultLabel.text = "Melhor utilizar gasolina!"
        } else {
            resultLabel.text = "Melhor utilizar álcool!"
        }
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        if ethanolPriceTextField.text == "" || gasPriceTextField.text == ""{
            calculateButton.isEnabled = false
        } else {
            calculateButton.isEnabled = true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
