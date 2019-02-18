import UIKit

class FollowButton: UIButton {
    var widthConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? Colors.secondaryBlue : Colors.primaryBlue
        }
    }

    private func setupButton() {
        widthConstraint =  NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 75)
        heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        addConstraints([widthConstraint, heightConstraint])
        setTitle(ButtonTitles.follow, for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.textAlignment = .center
        backgroundColor = Colors.primaryBlue
        titleLabel?.font = UIFont(name: Fonts.robotoCondensed, size: 16)
        layer.cornerRadius = frame.size.height/2
    }
    
    func follow() {
        setTitle(ButtonTitles.unfollow, for: .normal)
    }
    
    func unfollow() {
        setTitle(ButtonTitles.follow, for: .normal)
    }
}
