//
//  SubmitViewController.swift
//  Tatangga
//
//  Created by Mirza Fachreza 2 on 23/08/19.
//  Copyright © 2019 Mirza Fachreza. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var selectedKategori: String?
    var kategoriTypes = ["Sampah", "Keamanan", "Ketertiban", "Infrastruktur", "Personal", "Lain-lain"]

    @IBOutlet weak var kategoriPicker: UITextField!
    @IBOutlet weak var lokasiTxt: UITextField!
    @IBOutlet weak var judulTxt: UITextField!
    @IBOutlet weak var descTxt: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        descTxt.text = "Deskripsi"
        descTxt.textColor = UIColor.lightGray
        
        setupTxtField()
        textViewDidBeginEditing(descTxt)
        textViewDidEndEditing(descTxt)
        
        createPickerView()
        dismissPickerView()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kategoriTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return kategoriTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedKategori = kategoriTypes[row]
        kategoriPicker.text = selectedKategori
    }
    
    func createPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        kategoriPicker.inputView = pickerView
    }
    
    func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        kategoriPicker.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    //Setup Text View Attributes
    func setupTxtField(){
        self.descTxt.layer.borderColor = UIColor.lightGray.cgColor
        self.descTxt.layer.borderWidth = 0.5
        self.descTxt.layer.cornerRadius = 5
    }
    @IBAction func fotoBtn(_ sender: UIButton) {
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Deskripsi"
            textView.textColor = UIColor.lightGray
        }
    }
}
