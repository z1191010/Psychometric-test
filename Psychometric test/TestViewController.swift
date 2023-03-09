//
//  TestViewController.swift
//  Psychometric test
//
//  Created by Kai on 2023/3/9.
//

import UIKit

class TestViewController: UIViewController {
    var index = 0
    var select = [String]()
    var result = [String]()
    var song = [String]()
    var totalQna = [
        Qna(question: "在夢中你走進了一個森林，看見了＿＿＿", option: ["高大的神木群","美麗的湖泊","滿地叢生的植物"], result: ["你希望自己能夠主導關係，所以有時候會不自覺地流露出一股壓人的氣勢，讓人有壓力。","大家都喜歡善解人意的你，但是距離就是美感，或許他們不是那麼了解你。","與身邊人相處時，你總希望能給彼此一點空間，但卻又不希望自己被冷落，實在有點難捉摸。"], song: []),
        Qna(question: "這時在你背後忽然出現了＿＿＿", option: ["人馬","獨角獸","雄鹿"], result: ["你是個比較獨立的人，做什麼都喜歡自己處理，所以會希望朋友不要過度依賴自己。","你是個溫柔善良的人，不太會強迫或批判朋友，而是會選擇當傾聽的一方。","你是個比較強勢的人，就算給對方選擇，但其實也已經暗示了你的想法，因此有時會讓人感到壓迫。"], song: []),
        Qna(question: "面對這個未知生物，你決定＿＿＿", option: ["一步一步往前示好","想辦法嚇唬讓牠後退",""], result: ["你的控制慾不算強，因為你認為人與人之間相處，本來就該保有一定的空間，即便是另一半也是一樣。","不安感加深了你的控制慾，你希望每件事都能在自己的掌握中，最好是沒有任何意外。"], song: ["專屬天使","恐怖情人"])]
   
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var optionButton: [UIButton]!
    
    @IBOutlet weak var testPageImageVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testPageImageVIew.image = UIImage(named: "IndexPageBg")
        testPageImageVIew.contentMode = .scaleAspectFill
        let image = UIImage(named: "ButtonImage")
        navigationController?.navigationBar.isHidden = true
        
        questionLabel.font = UIFont(name: "HanyiSentyPine", size: 50)
        questionLabel.numberOfLines = 0
        questionLabel.textColor = UIColor.white
        questionLabel.textAlignment = .center
        questionLabel.text = totalQna[index].question
        for i in 0...2 {
            optionButton[i].setTitle(totalQna[index].option[i], for: .normal)
            optionButton[i].setBackgroundImage(image, for: .normal)
            optionButton[i].setTitleColor(.white, for: .normal)
            optionButton[i].titleLabel?.font = UIFont(name: "HanyiSentyPine", size: 35)
            optionButton[i].titleLabel?.textAlignment = .center
            
        }
}
   
    @IBAction func answer(_ sender: UIButton) {
        index += 1 //題目參數，每點一下參數都會+1，並帶入顯示題目/選項的參數中，來達到變換題目的目的
        switch sender.tag { //透過switch判斷所點選的 button 為何
        case 0:
            select.append(totalQna[index-1].option[0]) //當點選第一個button時，會增加所點選之選項至select arrary紀錄
            result.append(totalQna[index-1].result[0]) //當點選第一個button時，會增加所點選之選項對應的結果至result arrary紀錄
            if totalQna[index-1].song.isEmpty == true { //當點選第一個button時，偵測song arrary為空時，不執行任何事情
                break
            } else { //當點選第一個button時，會增加所點選之選項對應的歌曲至song arrary紀錄
                song.append(totalQna[index-1].song[0])
            }
        case 1: //原理同上，調整選項所對應的結果及歌曲參數
            select.append(totalQna[index-1].option[1])
            result.append(totalQna[index-1].result[1])
            if totalQna[index-1].song.isEmpty == true {
                break
            } else {
                song.append(totalQna[index-1].song[1])
            }
        case 2: //註：因歌曲參數只出現在第三題，同時第三題僅有兩個選項，故此選項不需判斷是否song.append
            select.append(totalQna[index-1].option[2])
            result.append(totalQna[index-1].result[2])
        default:
            break
        }
        let questionNum = totalQna.count //取總題數
        if index < questionNum { //當題目小於總題數時，會繼續顯示題目，此時的index因以+1，因此題目會變為下一題
            let optionNum = totalQna[index].option.count
            questionLabel.text = totalQna[index].question //設定題目
            for i in 0...optionNum - 1 { //設定選項，因有三個button，故使用迴圈方式讓button arrary與option arrary依序配對顯現
                optionButton[i].setTitle(totalQna[index].option[i], for: .normal)
                if index == 2 && i == 2  {//因第三題只有兩個選項，所以手動隱藏第三個button
                    optionButton[i].isHidden = true
                }
            }
        } else {//當題目等於總題數時，則呼叫performSegue切換頁面
            performSegue(withIdentifier: "showResult", sender: nil)
        }
//        print(select) //確認是否有隨switch判斷而記錄select arrary
//        print(result) //確認是否有隨switch判斷而記錄result arrary
    }

    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        controller?.select = select 
        controller?.result = result
        controller?.song = song
        return controller
    }
    
    
    
    
    
    
    
    
    
}
    
