//
//  ViewController.swift
//  Mandala_Nada_Abdullah
//
//  Created by apple on 05/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var stackView: UIStackView!
  @IBOutlet var addMoodButton: UIButton!
  var moods: [Mood] = [] { didSet {
    currentMood = moods.first
    moodButtons = moods.map { mood in
      let moodButton = UIButton()
      moodButton.setImage(mood.image, for: .normal)
      moodButton.imageView?.contentMode = .scaleAspectFit
      moodButton.adjustsImageWhenHighlighted = false
      moodButton.addTarget(self,
                           action: #selector(moodSelectionChanged(_:)),  for: .touchUpInside)
                         
      
      return moodButton
    } }
  }
  var moodButtons: [UIButton] = [] {
    didSet {
      oldValue.forEach { $0.removeFromSuperview() }
      moodButtons.forEach { stackView.addArrangedSubview($0)}
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    moods = [.happy, .sad, .angry, .goofy, .crying, .confused, .sleepy, .meh]
    addMoodButton.layer.cornerRadius = addMoodButton.bounds.height / 2  }
  
  var currentMood: Mood? {
    didSet {
      currentMood = moods.first
      guard let currentMood = currentMood else {
        addMoodButton?.setTitle(nil, for: .normal)
        addMoodButton?.backgroundColor = nil
        return
      }
      addMoodButton?.setTitle("I'm \(currentMood.name)", for: .normal)
      addMoodButton?.backgroundColor = currentMood.color
    }
  }
  @objc func moodSelectionChanged(_ sender: UIButton) {
    guard let selectedIndex = moodButtons.firstIndex(of: sender) else {
      preconditionFailure(
        "Unable to find the tapped button in the buttons array.")
    }
    currentMood = moods[selectedIndex]
  }
  
}

extension MoodListViewController: MoodsConfigurable {
    func add(_ moodEntry: MoodEntry) {
        moodEntries.insert(moodEntry, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}
