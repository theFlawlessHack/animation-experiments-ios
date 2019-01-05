//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
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
    
    @objc func showMenu() {
        let menuView = UIView()
        menuView.frame = self.view.frame
        menuView.backgroundColor = UIColor.blue.withAlphaComponent(0.65)
        menuView.alpha = 0.0
        self.view.addSubview(menuView)
        
        UIView.animate(withDuration: 1.5) {
            menuView.alpha = 1.0
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
