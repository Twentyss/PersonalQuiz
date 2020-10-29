//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки возврата на предыдущий экран

    @IBOutlet weak var answerTitleLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var answers: [Answer]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        calculateResult()
    }
    
    private func calculateResult(){
        var animalTypesDictionary: [AnimalType: Int] = [.cat: 0,
                                                        .dog: 0,
                                                        .rabbit: 0,
                                                        .turtle: 0]
        for answer in answers {
            animalTypesDictionary[answer.type]! += 1
        }
        
        guard let resultAnimalType = animalTypesDictionary
                .sorted(by:{ $0.value > $1.value }).first?.key
        else { return }
        
        answerTitleLabel.text = "Вы - \(resultAnimalType.rawValue)"
        definitionLabel.text = "\(resultAnimalType.definition)"
    }

}

