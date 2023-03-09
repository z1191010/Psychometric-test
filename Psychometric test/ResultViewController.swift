//
//  ResultViewController.swift
//  Psychometric test
//
//  Created by Kai on 2023/3/9.
//

import UIKit
import AVKit
import SafariServices


class ResultViewController: UIViewController {
    var select = [String]()
    var result = [String]()
    var song = [String]()
    
    @IBOutlet weak var firstAnswerLabel: UILabel!
    
    @IBOutlet weak var secondAnswerLabel: UILabel!
    
    @IBOutlet weak var thirdAnswerLabel: UILabel!
    
    @IBOutlet weak var firstNoteLabel: UILabel!
    
    @IBOutlet weak var secondNoteLabel: UILabel!
    
    @IBOutlet weak var thirdNoteLabel: UILabel!
    
    @IBOutlet weak var resultPageBgImageView: UIImageView!
    
    @IBOutlet weak var safariButton: UIButton!
    
    @IBOutlet weak var playVideoButton: UIButton!
    
    @IBOutlet weak var popToIndexPageButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepUI()
        updateUI()
        print(select)
        print(result)
        print(song)
    }
    func stepUI() {
        resultPageBgImageView.image = UIImage(named: "pic")
        resultPageBgImageView.contentMode = .scaleAspectFill
        
        firstNoteLabel.font = UIFont(name: "HanyiSentyPine", size: 40)
        firstNoteLabel.textAlignment = .center
        firstNoteLabel.text = "測：你周遭的人際關係"
        firstNoteLabel.backgroundColor = UIColor.white
        firstNoteLabel.alpha = 0.5
        
        secondNoteLabel.font = UIFont(name: "HanyiSentyPine", size: 40)
        secondNoteLabel.textAlignment = .center
        secondNoteLabel.text = "測：你的人格特質"
        secondNoteLabel.backgroundColor = UIColor.white
        secondNoteLabel.alpha = 0.5
        
        thirdNoteLabel.font = UIFont(name: "HanyiSentyPine", size: 40)
        thirdNoteLabel.textAlignment = .center
        thirdNoteLabel.text = "測：你的控制慾有多強"
        thirdNoteLabel.backgroundColor = UIColor.white
        thirdNoteLabel.alpha = 0.5
        
        safariButton.setBackgroundImage(UIImage(systemName: "network"), for: .normal)
        safariButton.tintColor = UIColor.white
        
        playVideoButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        playVideoButton.tintColor = UIColor.white
        
        popToIndexPageButton.setBackgroundImage(UIImage(systemName: "house.fill"), for: .normal)
        popToIndexPageButton.tintColor = UIColor.white
    }
    
    func updateUI() {
        firstAnswerLabel.numberOfLines = 0
        firstAnswerLabel.font = UIFont(name: "HanyiSentyPine", size: 30)
        firstAnswerLabel.textAlignment = .center
        firstAnswerLabel.text = select[0]
        firstAnswerLabel.text = "你選擇的是『\(select[0])』 \n\(result[0])"
        firstAnswerLabel.backgroundColor = UIColor.white
        firstAnswerLabel.alpha = 0.5
        
        secondAnswerLabel.numberOfLines = 0
        secondAnswerLabel.font = UIFont(name: "HanyiSentyPine", size: 30)
        secondAnswerLabel.textAlignment = .center
        secondAnswerLabel.text = "你選擇的是『\(select[1])』\n\(result[1])"
        secondAnswerLabel.backgroundColor = UIColor.white
        secondAnswerLabel.alpha = 0.5
        
        thirdAnswerLabel.numberOfLines = 0
        thirdAnswerLabel.font = UIFont(name: "HanyiSentyPine", size: 30)
        thirdAnswerLabel.textAlignment = .center
        thirdAnswerLabel.text = "你選擇的是『\(select[2])』 \n\(result[2])"
        thirdAnswerLabel.backgroundColor = UIColor.white
        thirdAnswerLabel.alpha = 0.5
        
    }

    @IBAction func showWeb(_ sender: Any) {//透過present呼叫storyboard中沒有的SDK
        if let url = URL(string:"https://www.s3.com.tw/look/tarot/4186eb/page/14580") {
            let controller = SFSafariViewController(url: url)
            present(controller, animated: true)
        }
    }
    
    
    @IBSegueAction func showVideo(_ coder: NSCoder) -> AVPlayerViewController? {//透過segueAction傳遞mp4給AVPlayerViewController
        let controller =  AVPlayerViewController(coder: coder)
        let url = Bundle.main.url(forResource: song[0], withExtension: ".mp4")
        let player = AVPlayer(url: url!)
        controller?.player = player
        player.play()
        return controller
    }
    
    @IBAction func popToIndexPage(_ sender: Any) { //popToRootViewController用來回到首頁的功能
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
}
