//
//  DetailViewController.swift
//  Animals-free-lv
//
//  Created by Kārlis Zars on 30/04/2018.
//  Copyright © 2018 KarlisZars. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds
//import Firebase


//************************ Ad ********************** , GADInterstitialDelegate

class DetailViewController: UIViewController, AVAudioPlayerDelegate, GADInterstitialDelegate  {
    @IBOutlet weak var Button_1: UIButton!
    @IBOutlet weak var Button_2: UIButton!
    @IBOutlet weak var Button_3: UIButton!
    @IBOutlet weak var Button_4: UIButton!
    @IBOutlet weak var Button_5: UIButton!
    @IBOutlet weak var Button_6: UIButton!
    @IBOutlet weak var Button_7: UIButton!
    @IBOutlet weak var Button_8: UIButton!
    @IBOutlet var Main_View: UIView!
    @IBOutlet weak var Button_1_View: UIView!
    @IBOutlet weak var Button_2_View: UIView!
    @IBOutlet weak var Button_3_View: UIView!
    @IBOutlet weak var Button_4_View: UIView!
    @IBOutlet weak var Button_5_View: UIView!
    @IBOutlet weak var Button_6_View: UIView!
    @IBOutlet weak var Button_7_View: UIView!
    @IBOutlet weak var Button_8_View: UIView!
    
    //Setting hex color, must start 0x to work
    //To use hex color in Alghoritms file UIColor is extended
    var Background_color = UIColor(rgb: 0x68a06f)
    var toppic = ""
    var audioPlayer : AVAudioPlayer!
    var selectedSoundFileName = ""
    var choosenToppicArray = [String]() //Creating an empty array
    var isMuted = false
    //var AdCount = 0
    //var PaidContent = false
    
    //*************************************************************************************************************************************
    var Transport = ["motor-sports-1", "delivery-truck-1", "leisure-1", "chopper-1", "buses-1", "automobile-1", "airplanes-1", "tramway-1"]
    var Animals = ["crab", "chick", "fox", "zebra", "hippopotamus", "hedgehog", "koala", "bull"]
    var Pets = ["cat", "dog", "fish", "hamster", "parrot", "rabbit", "rat", "turtle"]
    var Forest_Animals = ["bear", "racoon", "wolf", "fox", "boar", "deer", "squirrel","hedgehog" ]
    var Farm_Animals = ["pig","cow", "horse","rooster","hen","chick","sheep","goat"]
    var Jungle = ["lemur", "gorilla","snake", "frog","monkey","panther", "leopard", "crocodile"]
    var Birds = ["duck", "eagle", "flamingo", "ostrich", "raven", "seagull", "owl", "turkey"]
    var Savanna = ["buffalo", "camel", "elephant", "giraffe", "lion", "rhino", "tiger", "zebra"]
    var Insects = ["ant", "bee", "beetle", "butterfly", "cricket", "dragonfly", "fly", "mosquito"]
    //*************************************************************************************************************************************
    
    //*************** Ad *******************************
    //Full screnn ad
    //var interstitial: GADInterstitial!
    //*************** Ad *******************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //*************** Ad *******************************
        //AdCount = 0
        //interstitial = createAndLoadInterstitial()
        
        //interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        //let request = GADRequest()
        //interstitial.delegate = self
        //request.testDevices = [ kGADSimulatorID, "673ba0a78892bef20188c4a04aa67348" ]
        //interstitial.load(request)
        //*************** Ad *******************************
        
        isMuted = false
        
        //To inicialize sound because if you dont press any animal to sound and then press back button theres an error because wee try to stop any sound but there is no sound to stop
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.stop()
        

        //Navigation Button to Quizz selection
        let quizzButton = UIBarButtonItem(title: "Tests", style: .done, target: self, action: #selector(navigateToQuizz))
        self.navigationItem.rightBarButtonItem = quizzButton
        
        //Animation to fade in buttons
            Button_1.flashIn()
            Button_2.flashIn()
            Button_3.flashIn()
            Button_4.flashIn()
            Button_5.flashIn()
            Button_6.flashIn()
            Button_7.flashIn()
            Button_8.flashIn()
        setButtonImages(theme: self.toppic)
    
        Main_View.backgroundColor = Background_color
        Button_1.backgroundColor  = Background_color
        Button_2.backgroundColor = Background_color
        Button_3.backgroundColor = Background_color
        Button_4.backgroundColor = Background_color
        Button_5.backgroundColor = Background_color
        Button_6.backgroundColor = Background_color
        Button_7.backgroundColor = Background_color
        Button_8.backgroundColor = Background_color
        Button_1_View.backgroundColor = Background_color
        Button_2_View.backgroundColor = Background_color
        Button_3_View.backgroundColor = Background_color
        Button_4_View.backgroundColor = Background_color
        Button_5_View.backgroundColor = Background_color
        Button_6_View.backgroundColor = Background_color
        Button_7_View.backgroundColor = Background_color
        Button_8_View.backgroundColor = Background_color
        
        }
    
    //Function to set Button images
    func setButtonImages(theme: String) {
        
        var i = 0
        
        //**************************************
        if theme == "MĀJDZĪVNIEKI"{
            choosenToppicArray = Pets
            Background_color = UIColor(rgb: 0xe0cd41)
        }
        else if theme == "MEŽA ZVĒRI"{
            choosenToppicArray = Forest_Animals
            Background_color = UIColor(rgb: 0x68a06f)
        }
        else if theme == "MĀJLOPI"{
            choosenToppicArray = Farm_Animals
            Background_color = UIColor(rgb: 0x60d2ff)
        }
        else if theme == "DŽUNGĻI"{
            choosenToppicArray = Jungle
            Background_color = UIColor(rgb: 0xbd9ddb)
            //PaidContent = true
        }
        else if theme == "PUTNI"{
            choosenToppicArray = Birds
            Background_color = UIColor(rgb: 0xb2559c)
             //PaidContent = true
        }
        else if theme == "SAVANNA"{
            choosenToppicArray = Savanna
            Background_color = UIColor(rgb: 0xe59d5c)
             //PaidContent = true
        }
        else if theme == "KUKAIŅI"{
            choosenToppicArray = Insects
            Background_color = UIColor(rgb: 0xfe7a47)
             //PaidContent = true
        }
        //**************************************
        
        //Array of buttons
        let Buttons = [Button_1, Button_2, Button_3, Button_4, Button_5, Button_6, Button_7, Button_8]
        
        while i <= Buttons.count-1 {
            let currentButton = Buttons[i] //Each button of Buttons array is selected one by one
            currentButton?.setImage(UIImage(named: (choosenToppicArray[i] + ".png")) , for: UIControlState.normal) //setting each buttons image to one of choosen toppics array
            i += 1
        }
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //*************** Ad *******************************
        //if (AdCount <= 3){
        //    AdCount += 1
       // }
       // else {
        //    interstitial.present(fromRootViewController: self)
        //    if interstitial.isReady {
         //       interstitial.present(fromRootViewController: self)
         //   } else {
        //        print("Ad wasn't ready")
        //    }
        //    AdCount = 0
       // }
        //*************** Ad *******************************
        
        //if (PaidContent == false){
            Button_1.isEnabled = false
            Button_2.isEnabled = false
            Button_3.isEnabled = false
            Button_4.isEnabled = false
            Button_5.isEnabled = false
            Button_6.isEnabled = false
            Button_7.isEnabled = false
            Button_8.isEnabled = false
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            
            selectedSoundFileName = choosenToppicArray[sender.tag - 1]
            print(selectedSoundFileName)
            sender.pulsate()
            playSoundName()
            
            
            //Wait for certain amount of time and then flash all buttons
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                
                if (self.isMuted == false){
                    self.playSound()
                    print(self.selectedSoundFileName)
                }
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    self.Button_1.isEnabled = true
                    self.Button_2.isEnabled = true
                    self.Button_3.isEnabled = true
                    self.Button_4.isEnabled = true
                    self.Button_5.isEnabled = true
                    self.Button_6.isEnabled = true
                    self.Button_7.isEnabled = true
                    self.Button_8.isEnabled = true
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                })
                
            })
       // }
      //  else {
           // Button_1.isEnabled = false
           // Button_2.isEnabled = false
           // Button_3.isEnabled = false
           // Button_4.isEnabled = false
           // Button_5.isEnabled = false
           // Button_6.isEnabled = false
           // Button_7.isEnabled = false
           // Button_8.isEnabled = false
        
       // let alert = UIAlertController(title: "Maksas versija", message: "Šos un citus dzīvniekus vari apskatīt iegādājoties Dzīvnieku skaņas maksas lietotni!", /preferredStyle: UIAlertControllerStyle.alert)
       // alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
       //     switch action.style{
        //    case .default:
        //        print("default")
        //
        //    case .cancel:
        //        print("cancel")
        //
        //    case .destructive:
        //        print("destructive")
        //
         //
         //   }}))
       // self.present(alert, animated: true, completion: nil)
        //}
    }
    
    
    
    //When back Button is pressed stop all active audio playbacks
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            print("Back")
            self.isMuted = true
            audioPlayer.stop()
        }
    }
    
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
    func playSoundName() {
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName + "_lv", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
    
    @objc func navigateToQuizz (){
        let VC = storyboard?.instantiateViewController(withIdentifier: "QuizzViewController") as? QuizzViewController
        //Passing toppic of selected row , for some reason only variable title was allowed as passing variable
        VC?.title = toppic
        self.navigationController?.pushViewController(VC!, animated: true)
        
    }
    
    
    //*************** Ad *******************************
    //func createAndLoadInterstitial() -> GADInterstitial {
        // test ad id let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    //    let interstitial = GADInterstitial(adUnitID: "ca-app-pub-8821957176803010/7087618962")
   //     interstitial.delegate = self
    //    interstitial.load(GADRequest())
   //     return interstitial
   // }
   //
   // func interstitialDidDismissScreen(_ ad: GADInterstitial) {
   //     interstitial = createAndLoadInterstitial()
   // }
    //*************** Ad *******************************
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
