//
//  MoodSelectionViewController.swift
//  Mandala
//
//  Created by عبدالعزيز البلوي on 05/05/1443 AH.
//

import UIKit

class MoodSelectionViewController: UIViewController {
  
  @IBOutlet var stackView: UIStackView!
  @IBOutlet weak var addMoodButton: UIButton!
  
  @IBAction func addMoodTapped(_ sender: Any) {
    guard let currentMood = currentMood else {
      return }
    let newMoodEntry = MoodEntry(mood: currentMood, timestamp: Date())
    moodsConfigurable.add(newMoodEntry)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    moods = [.happy, .sad, .angry, .goofy, .crying, .confused, .sleepy, .meh]
    addMoodButton.layer.cornerRadius = addMoodButton.bounds.height / 2
    // Do any additional setup after loading the view.
  }
  
  var moods: [Mood] = [] { didSet {
    currentMood = moods.first
    moodButtons = moods.map { mood in
      let moodButton = UIButton()
      moodButton.setImage(mood.image, for: .normal)
      moodButton.imageView?.contentMode = .scaleAspectFit
      moodButton.adjustsImageWhenHighlighted = false
      moodButton.addTarget(self,action: #selector(moodSelectionChanged(_:))
                           ,for: .touchUpInside)
      return moodButton
      
      
    }
  } }
  
  var moodButtons: [UIButton] = []  { didSet {
    oldValue.forEach { $0.removeFromSuperview() }
    moodButtons.forEach { stackView.addArrangedSubview($0)}
  }
  }
  var currentMood: Mood? {
    didSet {
      guard let currentMood = currentMood else {
        addMoodButton?.setTitle(nil, for: .normal)
        addMoodButton?.backgroundColor = nil
        return
      }
      addMoodButton?.setTitle("I'm \(currentMood.name)", for: .normal)
      addMoodButton?.backgroundColor = currentMood.color
    }
  }
  
  var moodsConfigurable: MoodsConfigurable!
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier {
    case "embedContainerViewController":
      guard let moodsConfigurable = segue.destination as? MoodsConfigurable else {
        preconditionFailure("View controller expected to conform to MoodsConfigurable")
      }
      self.moodsConfigurable = moodsConfigurable
      segue.destination.additionalSafeAreaInsets =  UIEdgeInsets(top: 0, left: 0, bottom: 160, right: 0)
    default:
      preconditionFailure("Unexpected segue identifier")
    }
  }
  @objc func moodSelectionChanged(_ sender: UIButton) {
    guard let selectedIndex = moodButtons.firstIndex(of: sender)
    else {
      preconditionFailure("Unable to find the tapped button in the buttons array.")
    }
    currentMood = moods[selectedIndex]
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
