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
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
}

extension MenuItensCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        
        addSubview(menuItemView)
        menuItemView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        
        menuItemView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).inset(20)
            make.top.bottom.equalTo(self).inset(5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(15)
        }
    }
    
    func setupAditionalConfigurations() {
        menuItemView.backgroundColor = .systemPink

    }
    
    
}
