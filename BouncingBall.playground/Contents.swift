//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .cyan

        let button = UIButton(frame: CGRect(x: 110, y: 120, width: 150, height: 50))
        button.backgroundColor = .magenta
        
        let buttonText = NSAttributedString(string: "Drop, ball!!", attributes: [.font: UIFont(name: "Helvetica-Bold", size: 15.0), .foregroundColor: UIColor.white])
        button.setAttributedTitle(buttonText, for: .normal)
        
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(animateBall), for: .touchUpInside)
        
        view.addSubview(button)
        self.view = view
    }
    
    @objc func animateBall() {
        let image = UIImage(named: "beach-ball")
        let imageView = UIImageView(frame: CGRect(x: 155 , y: 200, width: 75, height: 75))
        imageView.image = image
        
        // animation
        UIView.animate(withDuration: 1, animations: {
            imageView.frame.origin.y += self.view.frame.size.height - imageView.frame.size.height - imageView.frame.origin.y
        }) { (_) in
            UIView.animateKeyframes(withDuration: 1, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                imageView.frame.origin.y -= 300
            }, completion: nil)
        }
        view.addSubview(imageView)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
