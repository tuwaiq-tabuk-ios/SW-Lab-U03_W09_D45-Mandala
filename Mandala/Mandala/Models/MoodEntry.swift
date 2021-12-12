//
//  MoodEntry.swift
//  Mandala
//
//  Created by Ressam Al-Thebailah on 04/05/1443 AH.
//

import Foundation

struct MoodEntry {
    var mood: Mood
    var timestamp: Date
}


protocol MoodsConfigurable {
  
    func add(_ moodEntry: MoodEntry)
}   
