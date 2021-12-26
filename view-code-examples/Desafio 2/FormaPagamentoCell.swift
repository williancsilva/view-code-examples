//
//  FormaPagamentoCell.swift
//  view-code-examples
//
//  Created by Willian  Candido da Silva on 09/12/21.
//

import UIKit
import SnapKit

class FormaPagamentoCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var viewCartao: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 0.4
        view.layer.borderColor = UIColor(hex: "8492A6").cgColor
        
        return view
    }()
    
    private lazy var iconCartaoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "master-logo")
        
        return imageView
    }()
    
    public lazy var descricaoCartaoLabel: UILabel = {
        let label = UILabel()
        label.text = "[ CRÉDITO ] - Daycoval"
        label.textColor = UIColor(hex: "47525E")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        
        return label
    }()
    
}

extension FormaPagamentoCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        
        addSubview(viewCartao)
        viewCartao.addSubview(iconCartaoImageView)
        viewCartao.addSubview(descricaoCartaoLabel)
    }
    
    func setupConstraints() {
        
        viewCartao.snp.makeConstraints { make in
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).inset(20)
            make.height.equalTo(60)
            make.top.bottom.equalTo(self).inset(5)
        }
        
        iconCartaoImageView.snp.makeConstraints { make in
            make.left.bottom.top.equalTo(viewCartao).inset(15)
            make.height.equalTo(28)
            make.width.equalTo(34)
        }
        
        descricaoCartaoLabel.snp.makeConstraints { make in
            make.left.equalTo(iconCartaoImageView.snp.right).offset(15)
            make.centerY.equalTo(iconCartaoImageView.snp.centerY)
        }
    }
    
    func setupAditionalConfigurations() {
    }
    
    
}
