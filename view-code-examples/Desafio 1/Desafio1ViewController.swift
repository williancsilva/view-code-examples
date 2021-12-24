//
//  Desafio1ViewController.swift
//  view-code-examples
//
//  Created by Willian  Candido da Silva on 29/11/21.
//

import UIKit
import SnapKit

class Desafio1ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private lazy var titulo: UILabel = {
        let label = UILabel()
        label.text = "Mussum Ipsum. Cacilds!"
        label.textColor = UIColor(red: 0.28, green: 0.32, blue: 0.37, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        return label
    }()
    
    private lazy var descricao1: UILabel = {
        let label = UILabel()
        label.text = "Mussum Ipsum, cacilds vidis litro abertis. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo! Copo furadis é disculpa de bebadis, arcu quam euismod magna. Quem num gosta di mé, boa gentis num é. Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi."
        label.textColor = UIColor(red: 0.28, green: 0.32, blue: 0.37, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    private lazy var descricao2: UILabel = {
        let label = UILabel()
        label.text = "Quem num gosta di mim que vai caçá sua turmis! Suco de cevadiss deixa as pessoas mais interessantis. Vehicula non. Ut sed ex eros. Vivamus sit amet nibh non tellus tristique interdum. Não sou faixa preta cumpadi, sou preto inteiris, inteiris."
        label.textColor = UIColor(red: 0.28, green: 0.32, blue: 0.37, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "mussum")
        imageView.layer.cornerRadius = 5.33
        imageView.clipsToBounds = true
        
        return imageView
        
    }()
    
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("ABRIS O DIALOGIS!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "FF9052")
        button.layer.cornerRadius = 5.33
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(fecharPressed), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @objc func fecharPressed() {
        
        self.dismiss(animated: true)
    }
}

extension Desafio1ViewController : ViewCodeProtocol {
    func buildViewHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titulo)
        contentView.addSubview(descricao1)
        contentView.addSubview(descricao2)
        contentView.addSubview(imageView)
        contentView.addSubview(button1)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view).inset(50)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualTo(scrollView)
        }
        
        titulo.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.left.right.equalTo(contentView).inset(20)
        }
        
        descricao1.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(20)
            make.top.equalTo(titulo.snp.bottom).offset(20)
        }
        
        descricao2.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(20)
            make.top.equalTo(descricao1.snp.bottom).offset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(20)
            make.top.equalTo(descricao2.snp.bottom).offset(20)
            make.height.equalTo(457)
            make.width.equalTo(334)
        }
        
        button1.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(imageView.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(30)
            make.height.equalTo(40)
        }
    }
    
    func setupAditionalConfigurations() {
        view.backgroundColor = .white
    }
    
}
