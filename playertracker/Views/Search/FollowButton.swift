import UIKit

class FollowButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setTitle(ButtonTitles.follow, for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.textAlignment = .center
        backgroundColor = Colors.primaryBlue
        titleLabel?.font = UIFont(name: Fonts.robotoCondensed, size: 16)
        layer.cornerRadius = frame.size.height/2
    }
}
