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
        
        let image = UIImage(named: "beach-ball")
        let imageView = UIImageView(frame: CGRect(x: 155 , y: 200, width: 75, height: 75))
        imageView.image = image
        
        // animation
        let translation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        let values = [-200, 20, 0]
        translation.values = values
        
        let times: [NSNumber] = [0.0, 0.85, 1]
        translation.keyTimes = times
        translation.timingFunctions = [CAMediaTimingFunction(name: .easeIn)]
        translation.autoreverses = true
        translation.duration = 1.0
        translation.repeatCount = .infinity
        
        
        let scaleXAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
        let scaleXalues = [0.75, 0.75, 1]
        scaleXAnimation.values = scaleXalues
        
        scaleXAnimation.keyTimes = times
        scaleXAnimation.timingFunctions = [CAMediaTimingFunction(name: .linear)]
        scaleXAnimation.autoreverses = true
        scaleXAnimation.duration = 1.0
        scaleXAnimation.repeatCount = .infinity
        
        
        
        let scaleYAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
        let scaleYValues = [0.75, 1, 0.85]
        translation.values = scaleYValues
        
        let scaleYTimes: [NSNumber] = [0.1, 0.5, 1]
        scaleYAnimation.keyTimes = scaleYTimes
        scaleYAnimation.timingFunctions = [CAMediaTimingFunction(name: .linear)]
        scaleYAnimation.autoreverses = true
        scaleYAnimation.duration = 1.0
        scaleYAnimation.repeatCount = .infinity
        
        imageView.layer.add(scaleXAnimation, forKey: "scaleX")
        imageView.layer.add(scaleYAnimation, forKey: "scaleY")
        imageView.layer.add(translation, forKey: "trans")
        
        view.addSubview(button)
        view.addSubview(imageView)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
