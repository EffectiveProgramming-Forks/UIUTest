//
//  Language.swift
//  CucumberSwift
//
//  Created by Tyler Thompson on 7/22/18.
//  Copyright © 2018 Tyler Thompson. All rights reserved.
//

import Foundation
class Language {
    struct Keys {
        static let feature = "feature"
        static let scenario = "scenario"
        static let background = "background"
        static let examples = "examples"
        static let scenarioOutline = "scenarioOutline"
        static let given = "given"
        static let when = "when"
        static let then = "then"
        static let and = "and"
        static let but = "but"
        //        static let rule = "rule"
    }
    
    private var featureNames = [String]()
    private var scenarioNames = [String]()
    private var backgroundNames = [String]()
    private var examplesNames = [String]()
    private var scenarioOutlineNames = [String]()
    private var givenNames = [String]()
    private var whenNames = [String]()
    private var thenNames = [String]()
    private var andNames = [String]()
    private var butNames = [String]()
    
    init(_ langName:String = "en") {
        let bundle = Bundle(for: Cucumber.self)
        if  let path = bundle.path(forResource: "gherkin-languages", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
            let JSON = jsonObject as? [String:Any],
            let language = JSON[langName] as? [String:Any] {
            featureNames         ?= (language[Keys.feature]         as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            scenarioNames        ?= (language[Keys.scenario]        as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            backgroundNames      ?= (language[Keys.background]      as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            examplesNames        ?= (language[Keys.examples]        as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            scenarioOutlineNames ?= (language[Keys.scenarioOutline] as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            givenNames           ?= (language[Keys.given]           as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            whenNames            ?= (language[Keys.when]            as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            thenNames            ?= (language[Keys.then]            as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            andNames             ?= (language[Keys.and]             as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
            butNames             ?= (language[Keys.but]             as? [String])?.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
        }
    }
    
    func matchesFeature(_ str:String) -> Bool {
        return featureNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesScenario(_ str:String) -> Bool {
        return scenarioNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesBackground(_ str:String) -> Bool {
        return backgroundNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesExamples(_ str:String) -> Bool {
        return examplesNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesScenarioOutline(_ str:String) -> Bool {
        return scenarioOutlineNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesGiven(_ str:String) -> Bool {
        return givenNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesWhen(_ str:String) -> Bool {
        return whenNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesThen(_ str:String) -> Bool {
        return thenNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesAnd(_ str:String) -> Bool {
        return andNames
            .contains(where: { $0 == str.lowercased() })
    }
    
    func matchesBut(_ str:String) -> Bool {
        return butNames
            .contains(where: { $0 == str.lowercased() })
    }
}
