//
//  ViewController.swift
//  scrollApp
//
//  Created by 藤岡正哉 on 2021/02/19.
//

import UIKit
import Lottie

class ViewController: UIViewController,UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var onboadArray = ["1", "2", "3"]
    var onboadStringArray = ["私たちはみんなで繋がっています", "考えよう", "その先を"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        setupScrollview()
        
        
//        animationViewの詳細設定
        for i in 0...2{
//            AnimationViewをインスタンス化
            let animationView = AnimationView()
            
//            animationにAnimationのnamedでアニメーションのファイル名を指定して入れる
            let animation = Animation.named(onboadArray[i])
            
//            animationのページサイズを指定する。for文のiはInt型なので、CGFloat型にキャストする。
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            
//            AnimationViewの詳細設定
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func setupScrollview(){
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: scrollView.frame.size.height)
        
        for i in 0...2{
//            Labelをプログラムで生成して配列から文字を取り出し貼り付ける
            let onboadLabel = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: view.frame.size.height / 3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            onboadLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboadLabel.textAlignment = .center
            onboadLabel.text = onboadStringArray[i]
            scrollView.addSubview(onboadLabel)
        }
    }

}

