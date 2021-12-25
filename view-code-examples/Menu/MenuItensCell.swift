//
//  MenuItensTableViewCell.swift
//  view-code-examples
//
//  Created by Willian  Candido da Silva on 24/12/21.
//

import UIKit
import SnapKit

class MenuItensCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var menuItemView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var triangleMenuItemView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white

        let triangle = CAShapeLayer()
        triangle.fillColor = UIColor(hex: "4DB6AC").cgColor
        triangle.path = createRoundedTriangle(width: 78, height: 78, radius: 8)
        triangle.position = CGPoint(x: 25, y: 35)
        triangle.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi/180), 0, 0, 1)

        view.layer.addSublayer(triangle)
        
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    func createRoundedTriangle(width: CGFloat, height: CGFloat, radius: CGFloat) -> CGPath {
        // Draw the triangle path with its origin at the center.
        let point1 = CGPoint(x: -width / 2, y: height / 2)
        let point2 = CGPoint(x: 0, y: -height / 2)
        let point3 = CGPoint(x: width / 2, y: height / 2)

        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: height / 2))
        path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
        path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
        path.addArc(tangent1End: point3, tangent2End: point1, radius: radius)
        path.closeSubpath()

        return path
    }
    
}

extension MenuItensCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        
        addSubview(menuItemView)
        addSubview(triangleMenuItemView)
        menuItemView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        
        menuItemView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).inset(100)
            make.top.bottom.equalTo(self).inset(5)
        }
        
        triangleMenuItemView.snp.makeConstraints { make in
            make.left.equalTo(menuItemView.snp.right)
            make.right.equalTo(self).inset(20)
            make.top.bottom.equalTo(self).inset(5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(15)
        }
    }
    
    func setupAditionalConfigurations() {
        menuItemView.backgroundColor = UIColor(hex: "4DB6AC")

    }
    
    
}
