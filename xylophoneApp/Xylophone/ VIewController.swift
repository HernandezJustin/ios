//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Create a new AVAudio Player.
    var audioPlayer : AVAudioPlayer!
    
    //Create an array that contains all the sound file names.
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //This gets triggered when any of the xylophone buttons are pressed.
    @IBAction func notePressed(_ sender: UIButton) {

        //Calls the playSound function, giving it an input containing the sound file name corresponding the the button that was pressed.
        playSound(soundFileName: soundArray[sender.tag - 1])
        
    }
    
    
    //This function contains all the sound playing functionality and can be used again and again. It takes an input in the form a String that is the name of the sound file that should be played.
    func playSound(soundFileName : String) {
        
        //This creates a directory path where the sound file is located within the main bundle (i.e. your app).
         let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        do {
            
            //This sets up the AVAudioPlayer with the location of the sound file that you want to play. Similar to putting the CD into the CD player. 💽→📻
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
         
        //This catches and prints out any errors encountered by the AVAudioPlayer.
        catch  {
            print(error)
        }
        
        //This executes the command to play the sound file. ▶️
        audioPlayer.play()

    }
}





