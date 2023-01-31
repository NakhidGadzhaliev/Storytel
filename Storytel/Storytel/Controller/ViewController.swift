//
//  ViewController.swift
//  Storytel
//
//  Created by Нахид Гаджалиев on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var storyTextLabel: UILabel!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    @IBAction func keyButtonPressed(_ sender: UIButton) {
        
        guard let userChoice = sender.titleLabel?.text else { return }
        
        storyBrain.nextStory(userChoice: userChoice)
        
        updateUI()
        
    }
    
}

// Adding functions
extension ViewController {
    
    private func updateUI() {
        storyTextLabel.text = storyBrain.getStoryTitle()
        
        choiceOneButton.setTitle(storyBrain.getChoiceOne(), for: .normal)
        choiceTwoButton.setTitle(storyBrain.getChoiceTwo(), for: .normal)
    }
    
}
