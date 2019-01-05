//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let menuView = UIView()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.cyan
        button.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        
        view.addSubview(button)
        self.view = view
    }
    
    @objc func dismissMenu() {
        UIView.animate(withDuration: 0.75) {
            self.menuView.alpha = 0.0
        }
    }
    
    @objc func showMenu() {
        menuView.frame = self.view.frame
        menuView.backgroundColor = UIColor.blue.withAlphaComponent(0.65)
        menuView.alpha = 0.0
        
        // add tap gesture to menuview for dismissal
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        menuView.addGestureRecognizer(tap)
        
        self.view.addSubview(menuView)
        
        UIView.animate(withDuration: 1.0) {
            self.menuView.alpha = 1.0
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
