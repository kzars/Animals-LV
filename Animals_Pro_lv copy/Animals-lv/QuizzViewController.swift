//
//  QuizzViewController.swift
//  Animals-free-lv
//
//  Created by Kārlis Zars on 03/05/2018.
//  Copyright © 2018 KarlisZars. All rights reserved.
//

import UIKit
import AVFoundation     //For Playing Audio
import GoogleMobileAds  //For Mobile Ads
//import Firebase         //For Mobile Ads


var choosenToppicArray = [String]() //Creating an empty array
var currentQuestion = 0
var luckyRandom_1 = 0
var luckyRandom_2 = 0
var luckyRandom_3 = 0
var LuckyButton = [1,2,3,4]
var audioPlayer : AVAudioPlayer!
var selectedSoundFileName = ""
var Background_color = UIColor(rgb: 0x68a06f)
var selectedToppicSoundWon = ""
var selectedToppicSoundWrong = "try_lv"
var isMuted2 = false
var PaidContent = false

//*************************************************************************************************************************************
var Pets = ["cat", "dog", "fish", "hamster", "parrot", "rabbit", "rat", "turtle"]
var Forest_Animals = ["bear", "boar", "deer", "fox", "racoon", "hedgehog", "squirrel", "wolf"]
var Farm_Animals = ["chick", "cow", "goat", "hen", "horse", "pig", "rooster", "sheep"]
var Jungle = ["crocodile", "gorilla", "frog", "lemur", "leopard", "monkey", "panther", "snake"]
var Birds = ["duck", "eagle", "flamingo", "ostrich", "raven", "seagull", "owl", "turkey"]
var Savanna = ["buffalo", "camel", "elephant", "giraffe", "lion", "rhino", "tiger", "zebra"]
var Insects = ["ant", "bee", "beetle", "butterfly", "cricket", "dragonfly", "fly", "mosquito"]
var shuffledJungle = Jungle
var shuffledBirds = Birds
var shuffledSavanna = Savanna
var shuffledInsects = Insects
var shuffledPets = Pets
var shuffledForest_Animals = Forest_Animals
var shuffledFarm_Animals = Farm_Animals

//*************************************************************************************************************************************




class QuizzViewController: UIViewController, AVAudioPlayerDelegate, GADInterstitialDelegate {

    @IBOutlet weak var QuizzButton_1: UIButton!
    @IBOutlet weak var QuizzButton_2: UIButton!
    @IBOutlet weak var QuizzButton_3: UIButton!
    @IBOutlet weak var QuizzButton_4: UIButton!
    @IBOutlet weak var QuizzSoundButton: UIButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIView!
    @IBOutlet var PopUp: UIView!
    @IBOutlet weak var PopUpImage: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet var Main_View: UIView!
    @IBOutlet weak var Top_View: UIView!
    @IBOutlet weak var Sound_Button_View: UIView!
    @IBOutlet weak var Lower_Stack_View: UIView!
    @IBOutlet weak var Upper_Stack_View: UIView!
    @IBOutlet weak var Bottom_View: UIView!
    @IBOutlet weak var BannerView: GADBannerView!
    @IBOutlet weak var BannerView2: GADBannerView!
    
    @IBAction func DonePopUp(_ sender: Any) {
        //Navigate Back to the root Controller View
        _ = navigationController?.popToRootViewController(animated: true)
        
        //*************** Ad *******************************
        //interstitial.present(fromRootViewController: self)
        //if interstitial.isReady {
        //    interstitial.present(fromRootViewController: self)
       // } else {
       //     print("Ad wasn't ready")
       // }
        //*************** Ad *******************************
    }
    
    
    @IBAction func PlayAgainPopUp(_ sender: Any) {

        animatePopUpOut()
        self.QuizzButton_1.isEnabled = true
        self.QuizzButton_2.isEnabled = true
        self.QuizzButton_3.isEnabled = true
        self.QuizzButton_4.isEnabled = true
        self.QuizzSoundButton.isEnabled = true
        
        //*************** Ad *******************************
        //interstitial.present(fromRootViewController: self)
       // if interstitial.isReady {
       //     interstitial.present(fromRootViewController: self)
       // } else {
       //     print("Ad wasn't ready")
       // }
        //*************** Ad *******************************
    }
    
    //Visual blurr effect variable
    var effect:UIVisualEffect!
    
    //*************** Ad *******************************
    //Full screnn ad
    //var interstitial: GADInterstitial!
    //*************** Ad *******************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // PaidContent = false
        
        //*************** Ad *******************************
        //interstitial = createAndLoadInterstitial()

        //Showing an Banner Ad
        // test ad id BannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        //BannerView.adUnitID = "ca-app-pub-8821957176803010/4194572756"
        //BannerView.rootViewController = self
        //BannerView.load(GADRequest())
        
        //BannerView2.adUnitID = "ca-app-pub-8821957176803010/4194572756"
       // BannerView2.rootViewController = self
        //BannerView2.load(GADRequest())
        
        //let request: GADRequest = GADRequest()
        //request.testDevices = ["673ba0a78892bef20188c4a04aa67348", kGADSimulatorID]
       // BannerView.load(request)
        
       // interstitial = GADInterstitial(adUnitID: "ca-app-pub-8821957176803010/7087618962")
        //let request = GADRequest()
        //interstitial.delegate = self
        // to run on a test real device request.testDevices = [ kGADSimulatorID, "673ba0a78892bef20188c4a04aa67348" ]
        //interstitial.load(request)
        
        
        //*************** Ad *******************************
        
        isMuted2 = false
        
        //Call function to set needed parameters for Quizz
        defaultValues()
        updateButtonImages()
        

        Main_View.backgroundColor = Background_color
        Top_View.backgroundColor = Background_color
        Sound_Button_View.backgroundColor = Background_color
        Lower_Stack_View.backgroundColor = Background_color
        Upper_Stack_View.backgroundColor = Background_color
        Bottom_View.backgroundColor = Background_color
        
        
        QuizzButton_1.isEnabled = false
        QuizzButton_2.isEnabled = false
        QuizzButton_3.isEnabled = false
        QuizzButton_4.isEnabled = false
        QuizzSoundButton.isEnabled = false
        
        //Wait for certain amount of time and then flash all buttons
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.QuizzButton_1.isEnabled = true
            self.QuizzButton_2.isEnabled = true
            self.QuizzButton_3.isEnabled = true
            self.QuizzButton_4.isEnabled = true
            self.QuizzSoundButton.isEnabled = true
            
        })
    }
    
    
    func defaultValues() {
        
        //Fade in buttons
            QuizzButton_1.flashIn()
            QuizzButton_2.flashIn()
            QuizzButton_3.flashIn()
            QuizzButton_4.flashIn()
            QuizzSoundButton.flashIn()
        
        //Clear Values when view loaded
            currentQuestion = 0
            luckyRandom_1 = 0
            luckyRandom_2 = 0
            luckyRandom_3 = 0
            LuckyButton = [1,2,3,4]
            //ScoreLabel.text = "\(currentQuestion + 1)/8"
            ProgressBar.frame.size.width = 0
        
        //Set image for sound play button
            QuizzSoundButton.setImage(UIImage(named: "multimedia.png"), for: UIControlState.normal)
        
        popUpDisabled()
        setQuizzParameters(title: title!)
        
        print(title ?? "Tests")
    }
    
    
    
 
    func setQuizzParameters(title: String) {
        //***********************************************
        //Shuffling Arrays
        
        shuffledFarm_Animals = shuffledFarm_Animals.shuffled()
        shuffledForest_Animals = shuffledForest_Animals.shuffled()
        shuffledPets = shuffledPets.shuffled()
        shuffledInsects = shuffledInsects.shuffled()
        shuffledSavanna = shuffledSavanna.shuffled()
        shuffledBirds = shuffledBirds.shuffled()
        shuffledJungle = shuffledJungle.shuffled()
        
        print(shuffledPets)
        print(shuffledFarm_Animals)
        print(shuffledForest_Animals)
        print(shuffledInsects)
        
        if title == "MĀJDZĪVNIEKI"{
            choosenToppicArray = shuffledPets
            Background_color = UIColor(rgb: 0xe0cd41)
            selectedToppicSoundWon = "majdzivnieki_pareizi"
        }
        else if title == "MĀJLOPI"{
            choosenToppicArray = shuffledFarm_Animals
            Background_color = UIColor(rgb: 0x60d2ff)
            selectedToppicSoundWon = "majlopi_pareizi"
        }
        else if title == "MEŽA ZVĒRI"{
            choosenToppicArray = shuffledForest_Animals
            Background_color = UIColor(rgb: 0x68a06f)
            selectedToppicSoundWon = "mezazveri_pareizi"
            //68a06f
        }
        else if title == "DŽUNGĻI"{
            choosenToppicArray = shuffledJungle
            Background_color = UIColor(rgb: 0xbd9ddb)
            selectedToppicSoundWon = "dzungli_pareizi"
            //PaidContent = true
        }
        else if title == "PUTNI"{
            choosenToppicArray = shuffledBirds
            Background_color = UIColor(rgb: 0xb2559c)
            selectedToppicSoundWon = "putni_pareizi"
            //PaidContent = true
        }
        else if title == "SAVANNA"{
            choosenToppicArray = shuffledSavanna
            Background_color = UIColor(rgb: 0xe59d5c)
            selectedToppicSoundWon = "savanna_pareizi"
            //PaidContent = true
        }
        else if title == "KUKAIŅI"{
            choosenToppicArray = shuffledInsects
            Background_color = UIColor(rgb: 0xfe7a47)
            selectedToppicSoundWon = "kukaini_pareizi"
            //PaidContent = true
        }
        //***********************************************
    }
    
    
    @IBAction func QuizzButtonPressed(_ sender: UIButton) {
        //if (PaidContent == false){
            if(sender.tag == LuckyButton[0]){
                if (currentQuestion < 8){
                    QuizzButton_1.isEnabled = false
                    QuizzButton_2.isEnabled = false
                    QuizzButton_3.isEnabled = false
                    QuizzButton_4.isEnabled = false
                    QuizzSoundButton.isEnabled = false
                    currentQuestion += 1
                    ProgressBar.frame.size.width = (view.frame.size.width / 8) * CGFloat(currentQuestion)
                    
                    //Debug output to see if answer was correct
                    print("Right")
                    sender.pulsate()
                    
                    
                    if (currentQuestion == 8 ){
                        //Wait for certain amount of time and then flash all buttons
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                            self.animatePopUpIn()
                            
                        })
                        
                    }
                }
                
                //Wait for certain amount of time and then flash all buttons , test cmment Animlas-RU  
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    // Put your code which should be executed with a delay here
                    self.QuizzButton_1.flash()
                    self.QuizzButton_2.flash()
                    self.QuizzButton_3.flash()
                    self.QuizzButton_4.flash()
                    self.QuizzSoundButton.flash()
                })
                
                if (currentQuestion < 8){
                    //Wait for certain amount of time and then execute updateButtonImages
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                        // Put your code which should be executed with a delay here
                        self.updateButtonImages()
                        
                        //Wait for certain amount of time and then flash all buttons
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                            // Put your code which should be executed with a delay here
                            self.QuizzButton_1.isEnabled = true
                            self.QuizzButton_2.isEnabled = true
                            self.QuizzButton_3.isEnabled = true
                            self.QuizzButton_4.isEnabled = true
                            self.QuizzSoundButton.isEnabled = true
                        })
                        
                    })
                }
            }
            else {
                playSoundWrong()
                print("Wrong")
                sender.shake()
            }
        //}
        //else if (PaidContent == true){
            //Disable buttons if free version
           // QuizzButton_1.isEnabled = false
            //QuizzButton_2.isEnabled = false
            //QuizzButton_3.isEnabled = false
           //QuizzButton_4.isEnabled = false
           // QuizzSoundButton.isEnabled = false
            
            
           // let alert = UIAlertController(title: "Maksas versija", message: "Šos un citus dzīvniekus vari apskatīt iegādājoties Dzīvnieku skaņas maksas /lietotni!", preferredStyle: UIAlertControllerStyle.alert)
           // alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
           //     switch action.style{
            //    case .default:
            //        print("default")
                    
             ///   case .cancel:
             //       print("cancel")
                    
             //   case .destructive:
            //        print("destructive")
                    
                    
             //   }}))
           // self.present(alert, animated: true, completion: nil)
       // }
        
    }
    
    @IBAction func SoundButtonPressed(_ sender: UIButton) {
        //*************** Ad *******************************
        //interstitial.present(fromRootViewController: self)
        //if interstitial.isReady {
        //    interstitial.present(fromRootViewController: self)
        //} else {
        //    print("Ad wasn't ready")
        //}
        //*************** Ad *******************************
        QuizzButton_1.isEnabled = false
        QuizzButton_2.isEnabled = false
        QuizzButton_3.isEnabled = false
        QuizzButton_4.isEnabled = false
        QuizzSoundButton.isEnabled = false
        
        
        //Wait for certain amount of time and then flash all buttons
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            // Put your code which should be executed with a delay here
            self.QuizzButton_1.isEnabled = true
            self.QuizzButton_2.isEnabled = true
            self.QuizzButton_3.isEnabled = true
            self.QuizzButton_4.isEnabled = true
            self.QuizzSoundButton.isEnabled = true
        })
        
        //*************************
        playSoundName()
        //Wait for certain amount of time and then flash all buttons
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            if (isMuted2 == false) {
                self.playSound()
            }

        })
        //*************************
        sender.pulsateSound()
    }
    
    //Function to set Button images
            func updateButtonImages (){
                LuckyButton = LuckyButton.shuffled()

                selectedSoundFileName = (choosenToppicArray[currentQuestion])
                print(selectedSoundFileName)
                //*************************
                playSoundName()
                //Wait for certain amount of time and then flash all buttons
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    if (isMuted2 == false) {
                        self.playSound()
                    }
                })
                //*************************
                if (currentQuestion < 5){
                    luckyRandom_1 = currentQuestion + 1
                    luckyRandom_2 = currentQuestion + 2
                    luckyRandom_3 = currentQuestion + 3
                }
                else if (currentQuestion > 4){
                    luckyRandom_1 = currentQuestion - 1
                    luckyRandom_2 = currentQuestion - 2
                    luckyRandom_3 = currentQuestion - 3
                }
                
                if (LuckyButton[0] == 1){
                    QuizzButton_1.setImage(UIImage(named: (choosenToppicArray[currentQuestion] + ".png")) , for: UIControlState.normal)
                    QuizzButton_2.setImage(UIImage(named: (choosenToppicArray[luckyRandom_1] + ".png")) , for: UIControlState.normal)
                    QuizzButton_3.setImage(UIImage(named: (choosenToppicArray[luckyRandom_2] + ".png")) , for: UIControlState.normal)
                    QuizzButton_4.setImage(UIImage(named: (choosenToppicArray[luckyRandom_3] + ".png")) , for: UIControlState.normal)
                }
                else if (LuckyButton[0] == 2){
                    QuizzButton_1.setImage(UIImage(named: (choosenToppicArray[luckyRandom_1] + ".png")) , for: UIControlState.normal)
                    QuizzButton_2.setImage(UIImage(named: (choosenToppicArray[currentQuestion] + ".png")) , for: UIControlState.normal)
                    QuizzButton_3.setImage(UIImage(named: (choosenToppicArray[luckyRandom_2] + ".png")) , for: UIControlState.normal)
                    QuizzButton_4.setImage(UIImage(named: (choosenToppicArray[luckyRandom_3] + ".png")) , for: UIControlState.normal)
                }
                else if (LuckyButton[0] == 3){
                    QuizzButton_1.setImage(UIImage(named: (choosenToppicArray[luckyRandom_1] + ".png")) , for: UIControlState.normal)
                    QuizzButton_2.setImage(UIImage(named: (choosenToppicArray[luckyRandom_2] + ".png")) , for: UIControlState.normal)
                    QuizzButton_3.setImage(UIImage(named: (choosenToppicArray[currentQuestion] + ".png")) , for: UIControlState.normal)
                    QuizzButton_4.setImage(UIImage(named: (choosenToppicArray[luckyRandom_3] + ".png")) , for: UIControlState.normal)
                }
                else if (LuckyButton[0] == 4){
                    QuizzButton_1.setImage(UIImage(named: (choosenToppicArray[luckyRandom_1] + ".png")) , for: UIControlState.normal)
                    QuizzButton_2.setImage(UIImage(named: (choosenToppicArray[luckyRandom_2] + ".png")) , for: UIControlState.normal)
                    QuizzButton_3.setImage(UIImage(named: (choosenToppicArray[luckyRandom_3] + ".png")) , for: UIControlState.normal)
                    QuizzButton_4.setImage(UIImage(named: (choosenToppicArray[currentQuestion] + ".png")) , for: UIControlState.normal)
                }
            }
    //When back Button is pressed stop all active audio playbacks
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            print("Back")
            isMuted2 = true
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
    func playSoundWon() {
        let soundURL = Bundle.main.url(forResource: selectedToppicSoundWon, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
    func playSoundWrong() {
        let soundURL = Bundle.main.url(forResource: selectedToppicSoundWrong, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
    
    func popUpDisabled(){
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        PopUp.layer.cornerRadius = 15
    }
    
    func animatePopUpIn(){
        self.view.addSubview(PopUp)
        PopUp.center = self.view.center
        

        PopUpImage.image = UIImage(named: choosenToppicArray[0])
        
        playSoundWon()
        PopUp.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        PopUp.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            
            self.visualEffectView.effect = self.effect
            self.PopUp.alpha = 1
            self.PopUp.transform = CGAffineTransform.identity
        }
    }
    
    func animatePopUpOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.PopUp.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.PopUp.alpha = 0
            //Disabled to prevent bug when you win game and play again and win again blurr effect did not appear
            //self.visualEffectView.effect = nil
        }) { (success:Bool) in
            //Disabled to prevent bug when you win game and play again and win again blurr effect did not appear
            //self.PopUp.removeFromSuperview()
            //self.popUpDisabled()
        }
        
        //Reset Quizz
        defaultValues()
        updateButtonImages()
        setQuizzParameters(title: title!)
    }
    
    //*************** Ad *******************************
    //func createAndLoadInterstitial() -> GADInterstitial {
    //    let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    //    interstitial.delegate = self
    //    interstitial.load(GADRequest())
    //    return interstitial
   // }
    
   // func interstitialDidDismissScreen(_ ad: GADInterstitial) {
   //     interstitial = createAndLoadInterstitial()
   // }
    //*************** Ad *******************************
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
