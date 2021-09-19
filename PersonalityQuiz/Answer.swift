//
//  Answer.swift
//  PersonalityQuiz
//
//  Created by Jamaaldeen Opasina on 17/09/2021.
//

import Foundation

struct Answer{
    var text: String
    var type: AnimalType
}
enum AnimalType: Character {
    case Dog = "🐶", Cat = "🐱", Rabbit = "🐰", Tortoise = "🐢"
    
    
    var definition: String {
        switch self{
            case.Dog:
                return "You are incredibly outgoing. You surround yourself with the people you love, and enjoy activities wih your friends."
            case .Cat:
                return "Mischievious, yet mild-tempered, you enjoy doing things on your own terms."
            case .Rabbit:
                return "You love everything that's soft. You are healthy and full of energy."
            case .Tortoise:
                return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race🙂."
        }
    }
}
