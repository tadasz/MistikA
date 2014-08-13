//
//  PuzzleEnum.swift
//  MistikA
//
//  Created by Tadas Ziemys on 29/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import Foundation

// MARK: - Protocol

protocol PuzzleEnum {
    var fileName: String { get }
    var answers: [String] { get }
    func isCorrectAnswer(answer: String) -> Bool
}

// MARK: - Optical Illusion Puzzle

enum OpticalIllusionPuzzle: Int {
    case Kareivis = 0
    case Delfinai
    case Asilas
    case Fermeris
    case Vovere
    case Geles
    case Arklys
    case Moteris
    case Ponas
    case Mociute
    case Seneliai
    case Meska
    case Antis
    case Kiskis
    
    static let allValues = [Kareivis, Delfinai, Asilas, Fermeris, Vovere, Geles, Arklys, Moteris, Ponas, Mociute, Seneliai, Meska, Antis, Kiskis]
}

extension OpticalIllusionPuzzle: PuzzleEnum {
    var fileName: String {
        get {
            return "illiusion\(self.toRaw()+1).jpg"
        }
    }
    
    var answers: [String] {
        get {
            switch self {
            case .Kareivis:
                return ["kareivis", "mociute", "boba", "sikna"]
            case .Delfinai:
                return ["porele", "seksas", "delfinai", "delfinas"]
            case .Asilas:
                return ["asilas", "ruonis"]
            case .Fermeris:
                return ["fermeris", "moteris", "zmona"]
            case .Vovere:
                return ["vovere", "antis"]
            case .Geles:
                return ["moteris", "geles", "gele"]
            case .Arklys:
                return ["arklys", "varle"]
            case .Moteris:
                return ["moteris", "vaikas", "berniukas"]
            case .Ponas:
                return ["ponas", "asilas"]
            case .Mociute:
                return ["mociute", "sene", "mergina", "jaunuole", "mergaite"]
            case .Seneliai:
                return ["seneliai", "senukai", "seniai", "daininkai", "girtuokliai"]
            case .Meska:
                return ["meska", "ruonis"]
            case .Antis:
                return ["antis", "kiskis", "zuikis"]
            case .Kiskis:
                return ["kiskis", "zuikis", "anciukas", "antis"]
            default:
                return [""]
            }
        }
    }
    
    func isCorrectAnswer(answer: String) -> Bool {
        var correctWords = 0
        
        let array = answer.componentsSeparatedByString(" ")
        if array.count != 2 {
            return false
        }
        
        for answerString in array {
            for string in self.answers {
                println("string = \(string) answerString = \(answerString)")
                let compareResult =  string.compare(answerString.lowercaseString, options: NSStringCompareOptions.DiacriticInsensitiveSearch, range: nil, locale: nil)
                if compareResult == NSComparisonResult.OrderedSame {
                    correctWords++
                    break;
                }
            }
        }
                
        if correctWords > 1 {
            return true
        }
        
        return false
    }
}

// MARK: - Stereo Illusion Puzzle

enum StereoIllusionPuzzle: Int {
    case Cow = 0
    case Vilkas
    case Dolphins
    case Drakonas
    case Drugelis
    case Flying_bird
    case Gorilla
    case Heart
    case Infinity
    case Kaukole
    case Kirvis
    case Pianinas
    case Skateboard
    case Skull
    case Sports_car
    case Tea_pot
    case Ant
    case Woman
    
    static let allValues = [Cow, Vilkas, Dolphins, Drakonas, Drugelis, Flying_bird, Gorilla, Heart, Infinity, Kaukole, Kirvis, Pianinas, Skateboard, Skull, Sports_car, Tea_pot,Ant, Woman]
}

extension StereoIllusionPuzzle: PuzzleEnum {

    var fileName: String {
    get {
        switch self {
        case Ant:
            return "ant.jpg"
        case Cow:
            return "cow.jpg"
        case Dolphins:
            return "dolphins.jpg"
        case Drakonas:
            return "drakonas.jpg"
        case Drugelis:
            return "drugelis.jpg"
        case Flying_bird:
            return "flying_bird.jpg"
        case Gorilla:
            return "gorilla.jpg"
        case Heart:
            return "heart.jpg"
        case Infinity:
            return "infinity.jpg"
        case Kaukole:
            return "kaukole.jpg"
        case Kirvis:
            return "kirvis.jpg"
        case Pianinas:
            return "pianinas.jpg"
        case Skateboard:
            return "skateboard.jpg"
        case Skull:
            return "skull.jpg"
        case Sports_car:
            return "sports_car.jpg"
        case Tea_pot:
            return "tea_pot.jpg"
        case Vilkas:
            return "vilkas.jpg"
        case Woman:
            return "woman.jpg"
        }
    }
    }

    
    var answers: [String] {
    get {
        switch self {
        case Ant:
            return ["skruzdė","skruzdėlė","skruzdele"]
        case Cow:
            return ["karve", "karvė", "jautis", "bulius"]
        case Dolphins:
            return ["delfinas", "delfinai"]
        case Drakonas:
            return ["drakonas", "slibinas", "driezas", "driežas"]
        case Drugelis:
            return ["drugelis", "drugys"]
        case Flying_bird:
            return ["paukstis", "paukštis", "skrenda", "skrendantis", "skrendantis paukstis", "erelis"]
        case Gorilla:
            return ["gorila", "gorilos", "bezdžionė", "bezdzione"]
        case Heart:
            return ["širdis", "sirdis", "meilė", "meile"]
        case Infinity:
            return ["begalybė", "begalybė", "buranka"]
        case Kaukole:
            return ["kaukuolė", "kaukuole", "mirtis"]
        case Kirvis:
            return ["kirvis", "malkos", "kapoja"]
        case Pianinas:
            return ["pianinas", "fortepijonas"]
        case Skateboard:
            return ["riedlente", "riedlentė"]
        case Skull:
            return ["kaukuolė", "kaukuole", "mirtis"]
        case Sports_car:
            return ["mašina", "masina", "sportinė mašina", "sportine masina"]
        case Tea_pot:
            return ["arbata", "arbatinukas", "arbatinis"]
        case Vilkas:
            return ["vilkas", "suo", "vilksunis", "vilksunis"]
        case Woman:
            return ["moteris", "nuogale", "nuoga moteris"]
        }
    }
    }
    
    func isCorrectAnswer(answer: String) -> Bool {
        for string in self.answers {
            let compareResult =  string.compare(answer.lowercaseString, options: NSStringCompareOptions.DiacriticInsensitiveSearch, range: nil, locale: nil)
            if compareResult == NSComparisonResult.OrderedSame {
                return true
            }
        }
        return false
    }
}

// MARK: - Map Puzzle

enum MapPuzzle: Int {
    
    case Akademija = 0
    case Aleksotas
    case Alkoholikai
    case Bendrabutis
    case Botanikos
    case Dobuzinskio
    case Gedimino
    case Sala
    case Santaka
    case Senamiestis
    case Silainiai
    case Zoo
    
    static let allValues  = [Akademija, Aleksotas, Alkoholikai, Bendrabutis, Botanikos, Dobuzinskio, Gedimino, Sala, Santaka, Senamiestis, Silainiai, Zoo]
}

extension MapPuzzle: PuzzleEnum {
    var fileName: String {
    get {
        switch self {
        case .Akademija:
            return "akademija.png"
        case Aleksotas:
            return "aleksotas.png"
        case Alkoholikai:
            return "alkoholikai.png"
        case Bendrabutis:
            return "bendrabutis.png"
        case Botanikos:
            return "botanikos.png"
        case Dobuzinskio:
            return "dobuzinskio.png"
        case Gedimino:
            return "gedimino.png"
        case Sala:
            return "sala.png"
        case Santaka:
            return "santaka.png"
        case Senamiestis:
            return "senamiestis.png"
        case Silainiai:
            return "silainiai.png"
        case Zoo:
            return "zoo.png"
        }
    }
    }
    
    var puzzleCount: Int {
    get {
        return MapPuzzle.allValues.count
    }
    }
    
    var answers: [String] {
    get {
        switch self {
        case .Akademija:
            return ["akademija","universitetas","veterinarija","veterinarijos akademija","LSMU"]
        case Aleksotas:
            return ["tado tevai","tevai","aleksotas"]
        case Alkoholikai:
            return ["alkoholikai", "klubas sala", "pirmas musu butas", "alkoholiku butas"]
        case Bendrabutis:
            return ["bendrabutis", "bendrikas", "sajungos", "sąjungos aikštė", "barakas"]
        case Botanikos:
            return ["botanikos", "botanikos sodas", "botanika"]
        case Dobuzinskio:
            return ["dobuzinskio", "dobužinskio", "udros namai"]
        case Gedimino:
            return ["gedimino", "soburas", "laisve"]
        case Sala:
            return ["sala", "nemuno sala"]
        case Santaka:
            return ["santaka", "santakos parkas", "nemunas ir neris"]
        case Senamiestis:
            return ["senamiestis", "musu butas", "biruta", "birutos butas"]
        case Silainiai:
            return ["silainiai", "silainiu ziedas", "šilainiai"]
        case Zoo:
            return ["zoo", "zoologijos sodas", "zoologijos"]
        }
    }
    }
    
    func isCorrectAnswer(answer: String) -> Bool {
        for string in self.answers {
            if string == answer.lowercaseString {
                return true
            }
        }
        return false
    }
}