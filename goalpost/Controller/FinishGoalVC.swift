//
//  FinishGoalVC.swift
//  goalpost
//
//  Created by Robihamanto on 06/12/17.
//  Copyright © 2017 Robihamanto. All rights reserved.
//

import UIKit


class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func initData(description: String, goalType: GoalType) {
        self.goalDescription = description
        self.goalType = goalType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalButton.bindToKeyboard()
        pointsTextField.delegate = self
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalButtonDidTap(_ sender: Any) {
        self.save { (finished) in
            if finished {
                
            }
        }
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = self.goalDescription
        goal.goalType = self.goalType.rawValue
        goal.goalCompletionValue = Int32(self.pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
            print("Succesfully save data")
            dismissDetail()
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
