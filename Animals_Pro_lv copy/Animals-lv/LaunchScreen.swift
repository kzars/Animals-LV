//
//  LaunchScreen.swift
//  Animals-free-lv
//
//  Created by Kārlis Zars on 24/05/2018.
//  Copyright © 2018 KarlisZars. All rights reserved.
//

//
//  ViewController.swift
//  Kids_Quizz
//
//  Created by Renāte Prikule on 27/04/2018.
//  Copyright © 2018 KarlisZars. All rights reserved.
//

import UIKit
import AVFoundation

class LaunchScreen: UIViewController {

    var toppicPicture = ""
    var audioPlayer : AVAudioPlayer!
    var selectedSoundFileNameWelcome = "welcome_lv"


    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSoundWelcome()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func playSoundWelcome() {
        let soundURL = Bundle.main.url(forResource: selectedSoundFileNameWelcome, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
    

    
    
    
}


