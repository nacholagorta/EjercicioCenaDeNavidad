//
//  AddViewControllerDelegate.swift
//  CenaNavidad
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 9/1/19.
//  Copyright © 2019 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import UIKit
protocol AddViewControllerDelegate: class {
    
    func addViewController(_vc: AddViewController, didEditTask task: Participantes)
}

class AddViewController: UIViewController {
    
    
    weak var delegate: AddViewControllerDelegate!
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    internal var task: Participantes!
    internal var repository: LocalPeopleRepository!
    convenience init(task: Participantes?)
    {
        self.init()
        if task == nil{
            self.task = Participantes()
            self.task.id = UUID().uuidString
            self.task.name = ""
        }
        else
        {
            self.task = task
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = LocalPeopleRepository()
        viewBack.layer.cornerRadius = 8.0
        viewBack.layer.masksToBounds = true
        
        saveButton.layer.cornerRadius = 8.0
        saveButton.layer.masksToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonPressed()
    {
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func saveButtonPressed()
    {
        if(repository.get(name: textField.text!) != nil) || (textField.text?.elementsEqual(""))!{
            print("Introduce un nombre válido")
        }
        else{
            self.task.name = textField.text
            delegate.addViewController(_vc: self, didEditTask: task)
        }

    }
    
}
