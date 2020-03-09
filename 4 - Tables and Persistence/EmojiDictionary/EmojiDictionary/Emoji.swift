//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Kaan Baylas on 28.02.2020.
//  Copyright © 2020 Kaan Baylas. All rights reserved.
//

import Foundation

struct Emoji: Codable
{
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")

    static func saveToFile(emojis: [Emoji])
    {
        let encoder = PropertyListEncoder()
        let codedEmojis = try? encoder.encode(emojis)
        try? codedEmojis?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji]?
    {
        guard let codedEmojis = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Emoji>.self, from: codedEmojis)
    }
    
    static func loadSampleEmojis() -> [Emoji]
    {
        return  [Emoji(symbol: "😃", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure."),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with heart for eyes", usage: "love of something; attractive"),
            Emoji(symbol: "👮🏻‍♂️", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle", usage: "Something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti", usage: "Spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "Extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue z's", usage: "tired, sleepiness."),
            Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag", usage: "completion."),
            Emoji(symbol: "🤢", name: "Sick Face", description: "A green face which is about to puke", usage: "Extreme sickness"),
            Emoji(symbol: "🐶", name: "Dog", description: "A cute dog", usage: "Something cute"),
            Emoji(symbol: "✈️", name: "Plane", description: "A flying plane", usage: "Travel")
           ]
    }
    
}
