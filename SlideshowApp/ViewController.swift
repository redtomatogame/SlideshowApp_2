//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 赤津亮太 on 2018/03/17.
//  Copyright © 2018年 Ryota.Akatsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate {
    
    @IBOutlet weak var ImageView: UIImageView!
    // 一定の間隔で処理を行うためのタイマーを作成
    var timer: Timer?
    
    // 表示している画像の番号
    var dispImageNo = 0
    
    
    //画像の名前の配列
    let imageNameArray = [
        "1.jpg",
        "2.jpg",
        "3.jpg",
        ]
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        ImageView.image = image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let image = UIImage(named: "1.jpg")
        ImageView.image = image
        
        // タイマーを設定
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer),userInfo: nil, repeats: true)
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(ViewController.tapped(_:)))
            tapGesture.delegate = self
            self.ImageView.addGestureRecognizer(tapGesture)
            ImageView.isUserInteractionEnabled = true
    }
    
    // imageView.addGestureRecognizer(tapGesture)
    // imageView.isUserInteractionEnabled = true
    
    // NSTimerによって一定の間隔で呼び出される関数
    func onTimer(timer: Timer) {
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func BackButton(_ sender: Any) {
        dispImageNo -= 1  //表示している画像の番号を1減らす
        displayImage()
    }
    
    @IBAction func PlayButton(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
        } else if self.timer != nil {
            self.timer?.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil }
    }
    
    @IBAction func NextButton(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
    
        // 処理
        print("tapped")
        
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "result") as! ResultViewController
            nextVC.filename = imageNameArray[dispImageNo]
            nextVC.modalTransitionStyle = .crossDissolve
        
            present(nextVC, animated: true, completion: nil)
            // 変更
    }
    
    
    
}







