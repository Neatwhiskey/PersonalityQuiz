//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Jamaaldeen Opasina on 17/09/2021.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answerChosen)
    }
    
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var Button4: UIButton!
    
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    
    
   
    
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangeLabel1: UILabel!
    @IBOutlet var rangeLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBAction func singleButtonPresed(_ sender: UIButton) {
           let currentAnswers = questions[QuestionIndex].answers
           switch sender{
               case Button1:
                   answerChosen.append(currentAnswers[0])
               case Button2:
                   answerChosen.append(currentAnswers[1])
               case Button3:
                   answerChosen.append(currentAnswers[2])
               case Button4:
                   answerChosen.append(currentAnswers[3])
               default:
                   break
           }
           nextQuestion()
       }
    
    @IBAction func multipleAnswerButtonPressed(_ Sender:UIButton) {
        let currentAnswers = questions[QuestionIndex].answers
        if multiSwitch1.isOn{
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answerChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answerChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answerChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed(_ Sender: UIButton) {
        let currentAnswers = questions[QuestionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    @IBOutlet var QuestionProgressBar: UIProgressView!
    var questions:[Question] = [
    Question(
        text: "Which food do you like most?",
        type: .single,
        answers: [
            Answer(text: "Steak", type: .Dog),
            Answer(text: "Fish", type: .Cat),
            Answer(text: "Carrot", type: .Rabbit),
            Answer(text: "Corn", type: .Tortoise)
        ]
    ),
    Question(
        text: "Which activities do you enjoy?",
        type: .multiple,
        answers: [
            Answer(text: "Swimming", type: .Tortoise),
            Answer(text: "Sleeping", type: .Cat),
            Answer(text: "Cuddling", type: .Rabbit),
            Answer(text: "Eating", type: .Dog)
        ]
    ),
    Question(
        text: "How much do you enjoy car rides?",
        type: .range,
        answers: [
            Answer(text: "I dislike them.", type: .Cat),
            Answer(text: "I get a little nervous.", type: .Rabbit),
            Answer(text: "I barely notice them.", type: .Tortoise),
            Answer(text: "I love them.", type: .Dog)
        ]
    )
    ]
    var QuestionIndex = 0
    var answerChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        
        let currentQuestion = questions[QuestionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(QuestionIndex)/Float(questions.count)
        navigationItem.title = "Question #\(QuestionIndex + 1)"
        questionLabel.text = currentQuestion.text
        QuestionProgressBar.setProgress(totalProgress, animated: true)

        switch currentQuestion.type{
            case.single:
                updateSingleStackView(using: currentAnswers)
            case.multiple:
                updateMultipleStackView(using: currentAnswers)
            case.range:
                updaterangeStackView(using: currentAnswers)
            
        }
    }
    func updateSingleStackView(using answers:[Answer]){
        singleStackView.isHidden = false
        Button1.setTitle(answers[0].text, for: .normal)
        Button2.setTitle(answers[1].text, for: .normal)
        Button3.setTitle(answers[2].text, for: .normal)
        Button4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStackView(using answers:[Answer]){
        multipleStackView.isHidden = false
        multiSwitch4.isOn = false
        multiSwitch3.isOn = false
        multiSwitch2.isOn = false
        multiSwitch1.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updaterangeStackView(using answers:[Answer]){
        rangeStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangeLabel1.text = answers.first?.text
        rangeLabel2.text = answers.last?.text
        
    }
    
    func nextQuestion(){
        QuestionIndex += 1
        
        if QuestionIndex < questions.count{
            updateUI()
        }else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
