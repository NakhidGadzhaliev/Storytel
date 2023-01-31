//
//  ProgrammaticallyViewController.swift
//  Storytel
//
//  Created by Нахид Гаджалиев on 31.01.2023.
//

import UIKit

class ProgrammaticallyViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let storyTitle: UILabel = {
        let story = UILabel()
        story.textAlignment = .center
        story.font = .systemFont(ofSize: 30)
        story.textColor = .white
        story.numberOfLines = 0
        
        return story
    }()
    
    lazy var choiceOneButton: UIButton = buttonCreator(background: UIImage(named: "choice1Background"))
    lazy var choiceTwoButton: UIButton = buttonCreator(background: UIImage(named: "choice2Background"))
    
    lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [storyTitle, choiceOneButton, choiceTwoButton])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewUpdates()
    }
    
}

// Adding functions
extension ProgrammaticallyViewController {
    
    private func viewUpdates() {
        view.addSubview(backgroundImage)
        view.addSubview(horizontalStack)
        setupConstraints()
        updateUI()
    }
    
    private func updateUI() {
        storyTitle.text = storyBrain.getStoryTitle()
        
        choiceOneButton.setTitle(storyBrain.getChoiceOne(), for: .normal)
        choiceTwoButton.setTitle(storyBrain.getChoiceTwo(), for: .normal)
    }
    
    private func setupConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        let viewSafeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            horizontalStack.leftAnchor.constraint(equalTo: viewSafeArea.leftAnchor, constant: 20),
            horizontalStack.rightAnchor.constraint(equalTo: viewSafeArea.rightAnchor, constant: -20),
            horizontalStack.topAnchor.constraint(equalTo: viewSafeArea.topAnchor, constant: 20),
            horizontalStack.bottomAnchor.constraint(equalTo: viewSafeArea.bottomAnchor, constant: -20),
            
            choiceOneButton.heightAnchor.constraint(equalToConstant: 100),
            choiceTwoButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func buttonCreator(background: UIImage?) -> UIButton {
        let button = UIButton()
        button.setBackgroundImage(background, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(choiceMade(sender: )), for: .touchUpInside)
        
        return button
    }
    
    @objc private func choiceMade(sender: UIButton) {
        guard let choice = sender.titleLabel?.text else { return }
        
        storyBrain.nextStory(userChoice: choice)
        updateUI()
    }
    
}
