//
//  IndexViewController.swift
//  Psychometric test
//
//  Created by Kai on 2023/3/9.
//

import UIKit

class IndexViewController: UIViewController {

    
    @IBOutlet weak var indexImageView: UIImageView!
    
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var indexLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indexLabel.numberOfLines = 0
        
        indexLabel.font = UIFont(name: "HanyiSentyPine", size: 80)
        indexLabel.text = "測你的控制慾\n有多強！"
        indexLabel.textAlignment = .center
        
        indexLabel.textColor = UIColor.white
        
        indexImageView.image = UIImage(named: "IndexPageBg")
        indexImageView.contentMode = .scaleAspectFill
        let image = UIImage(named: "Start")
        startButton.setBackgroundImage(image, for: .normal)
        startButton.setTitle("", for: .normal)
        // Do any additional setup after loading the view.
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
