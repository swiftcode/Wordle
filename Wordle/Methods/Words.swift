//
//  Words.swift
//  Wordle
//
//  Created by mpc on 5/19/22.
//

import Foundation

func wordList() -> [String] {
    var words: [String] = []

    if let filepath = Bundle.main.path(forResource: "words", ofType: "txt") {
        do {
            let contents = try String(contentsOfFile: filepath)
            let content = contents.components(separatedBy: "\n")

            for word in content {
                words.append(word)
            }

        } catch {
            print("Cannot read word list file")
        }
    }

    return words
}
