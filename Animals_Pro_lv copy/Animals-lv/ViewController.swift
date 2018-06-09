//
//  ViewController.swift
//  Animals-free-lv
//
//  Created by Kārlis Zars on 27/04/2018.
//  Copyright © 2018 KarlisZars. All rights reserved.
//

import UIKit
import AVFoundation
public var isMuted = true
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var Main_toppic: UILabel!
    @IBOutlet weak var Toppic_Image: UIImageView!
    @IBOutlet weak var TableView: UITableView!

    
    
    var toppicPicture = ""
    var audioPlayer : AVAudioPlayer!
    var selectedSoundFileNameWelcome = "welcome_lv"
    var selectedSoundFileNameToppic = ""
    
    
    //************************************************************************************
        let toppics = ["MĀJDZĪVNIEKI", "MEŽA ZVĒRI", "MĀJLOPI","DŽUNGĻI", "PUTNI", "SAVANNA"
, "KUKAIŅI"]
    //************************************************************************************
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSoundWelcome()
        //Toppic_View.backgroundColor = UIColor.red
        //Main_toppic.text = "Animals"
       // Main_toppic.backgroundColor = UIColor.red
        animateTable()
        
    }
    
    
    //Function that sets table row count to count in toppics array
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return toppics.count
        }
    
    //Set's row height that opened on any screen size there would fit 4 rows
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return ((view.frame.size.height-70) / 4)
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControlerTableViewCell
        if toppics[indexPath.row] == "MĀJDZĪVNIEKI"{
            toppicPicture = "dog"
           Background_color = UIColor(rgb: 0xe0cd41)
            //cell.Content_View.backgroundColor = Background_color
            selectedSoundFileNameToppic = "majdzivnieki_sadalas"
        }
        else if toppics[indexPath.row] == "MEŽA ZVĒRI"{
            toppicPicture = "deer"
            Background_color = UIColor(rgb: 0x68a06f)
            //cell.Content_View.Background_color = Background_color

        }
        else if toppics[indexPath.row] == "MĀJLOPI"{
            toppicPicture = "rooster"
            Background_color = UIColor(rgb: 0x60d2ff)
            //cell.Content_View.Background_color = Background_color
            
        }
        else if toppics[indexPath.row] == "DŽUNGĻI"{
            toppicPicture = "lemur"
            Background_color = UIColor(rgb: 0xbd9ddb)
            //cell.Content_View.Background_color = Background_color
            
        }
        else if toppics[indexPath.row] == "PUTNI"{
            toppicPicture = "duck"
            Background_color = UIColor(rgb: 0xb2559c)
            //cell.Content_View.Background_color = Background_color
            
        }
        else if toppics[indexPath.row] == "SAVANNA"{
            toppicPicture = "lion"
            Background_color = UIColor(rgb: 0xe59d5c)
            //cell.Content_View.Background_color = Background_color
            
        }
        else if toppics[indexPath.row] == "KUKAIŅI"{
            toppicPicture = "bee"
            Background_color = UIColor(rgb: 0xfe7a47)
            //cell.Content_View.Background_color = Background_color
            
        }
        cell.myToppicImage.image = UIImage(named: (toppicPicture + ".png"))
        cell.myToppic_name.text = toppics[indexPath.row]
        cell.Toppic_View.backgroundColor = Background_color
        cell.Image_View.backgroundColor = Background_color
        
        
        //cell.Image_View.frame.size.width = ((view.frame.size.height) / 4) * 2
        //cell.Image_View.frame.size.height = ((view.frame.size.height-60) / 4)
        
        //cell.Toppic_View.frame.size.height = ((view.frame.size.height-60) / 4)
        //cell.Toppic_View.frame.size.width = ((view.frame.size.height) / 4)
        
        //ProgressBar.frame.size.width = (view.frame.size.width / 8) * CGFloat(currentQuestion)
       // cell.Image_View.layer.cornerRadius = 40
        //cell.Toppic_View.layer.cornerRadius = 40
        
        // Get the superview's layout
        //let margins = view.layoutMarginsGuide
        
        // Pin the leading edge of myView to the margin's leading edge
        //cell.myToppicImage.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        
        // Pin the trailing edge of myView to the margin's trailing edge
        //myView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Give myView a 1:2 aspect ratio
        //cell.myToppicImage.heightAnchor.constraint(equalTo: cell.myToppicImage.widthAnchor, multiplier: 1.0).isActive = true
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        //Pass data to DetailViewController
        
        VC?.toppic = toppics[indexPath.row]
        //*******************************************************************

        if (toppics[indexPath.row] == "MĀJDZĪVNIEKI"){
            selectedSoundFileNameToppic = "majdzivnieki_sadalas"
        }
        else if (toppics[indexPath.row] == "MEŽA ZVĒRI"){
            selectedSoundFileNameToppic = "mezazveri_sadalas"
        }
        else if (toppics[indexPath.row] == "MĀJLOPI"){
            selectedSoundFileNameToppic = "majlopi_sadalas"
        }
        else if (toppics[indexPath.row] == "DŽUNGĻI"){
            selectedSoundFileNameToppic = "dzungli_sadalas"
        }
        else if (toppics[indexPath.row] == "PUTNI"){
            selectedSoundFileNameToppic = "putni_sadalas"
        }
        else if (toppics[indexPath.row] == "SAVANNA"){
            selectedSoundFileNameToppic = "savanna_sadalas"
        }
        else if (toppics[indexPath.row] == "KUKAIŅI"){
            selectedSoundFileNameToppic = "kukaini_sadalas"
        }
        //*******************************************************************
        
        playSoundToppic()
        self.navigationController?.pushViewController(VC!, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateTable() {
        self.TableView.reloadData()
        
        let cells = TableView.visibleCells
        let tableHeight: CGFloat = TableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            self.TableView.isHidden = false
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .transitionFlipFromTop, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }
    
    func playSoundWelcome() {
        let soundURL = Bundle.main.url(forResource: selectedSoundFileNameWelcome, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
    
    func playSoundToppic() {
        let soundURL = Bundle.main.url(forResource: selectedSoundFileNameToppic, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
    
    
    
    
}

