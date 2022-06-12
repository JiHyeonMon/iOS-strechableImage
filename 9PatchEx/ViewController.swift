//
//  ViewController.swift
//  9PatchEx
//
//  Created by 김지현 on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.textView.isScrollEnabled = false
//
//        image = UIImage(named: "image.png")!
//        imageView.image = image
//
//        image.resizableImage(withCapInsets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), resizingMode: .stretch)
//
        initImag(CGRect(x: 50, y: 50, width: self.textView.frame.width, height: self.textView.frame.height))
    }
    
    
    
    func initImag(_ frame: CGRect) {
        
        guard var image = UIImage(named: "example_resize") else {
            return
        }
        
        let inset: CGFloat = 10
        image = image.resizableImage(withCapInsets: UIEdgeInsets(top: 10, left: 30, bottom: 40, right: 10))
        
//        let button = UIButton(frame: frame)
//        button.setTitle("title here!!!!", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//
//        let titleInset: CGFloat = 10
//        button.titleEdgeInsets = UIEdgeInsets(top: titleInset, left: titleInset, bottom: titleInset, right: titleInset)
//
//        button.setBackgroundImage(image, for: .normal)
        imageView = UIImageView(frame: frame)
        imageView.image = image
        self.view.addSubview(imageView)
        self.view.bringSubviewToFront(self.textView)
    }
    
    func resize() {
        
//        imageView.frame.size = textView.frame.size
//        imageViewWidth.constant = textView.frame.width
//        imageViewHeight.constant = textView.frame.height

        imageView.frame = textView.frame

    }

}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        let newSize = textView.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))

        textView.frame.size = CGSize(width: max(100, newSize.width), height: newSize.height)
        self.resize()
    }
}

