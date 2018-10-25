//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .cyan

        let button = UIButton(frame: CGRect(x: 110, y: 120, width: 150, height: 50))
        button.backgroundColor = .magenta
        button.setTitle("Drop the ball", for: .normal)
        button.setTitleColor(.white , for: .normal)
        
        view.addSubview(button)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
