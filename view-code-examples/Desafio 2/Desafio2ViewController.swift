//
//  Desafio2ViewController.swift
//  view-code-examples
//
//  Created by Willian  Candido da Silva on 30/11/21.
//

import UIKit
import SnapKit

class Desafio2ViewController: UIViewController {
    
    struct Cells {
        static let formaPagamentoCell = "FormaPagamentoCell"
    }
    
    //MARK: - Variables
    var listaFormaPagamento: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    //MARK: - Objects
        
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    
    
    private lazy var listaCartaoTableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
        
    
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar novo cartão", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "F95F62")
        button.layer.cornerRadius = 5.33
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(fecharPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Voltar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5.33
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(fecharPressed), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Private Functions
    @objc func fecharPressed() {
        
        self.dismiss(animated: true)
    }
    
    func setTableViewDelegates() {
        listaCartaoTableView.delegate = self
        listaCartaoTableView.dataSource = self
    }
    
}

extension Desafio2ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaFormaPagamento.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.formaPagamentoCell) as! FormaPagamentoCell
        let tituloFormaPagamento = listaFormaPagamento[indexPath.row]
        
        cell.descricaoCartaoLabel.text = tituloFormaPagamento

        return cell
    }
}

extension Desafio2ViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        
        view.addSubview(contentView)
        contentView.addSubview(listaCartaoTableView)
        contentView.addSubview(button1)
        contentView.addSubview(button2)
        
    }
    
    func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(view)
        }
        
        listaCartaoTableView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        button1.snp.makeConstraints { make in
            make.top.equalTo(listaCartaoTableView.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(35)
        }

        button2.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).inset(30)
            make.top.equalTo(button1.snp.bottom).offset(10)
            make.height.equalTo(35)
        }
    }
    
    func setupAditionalConfigurations() {
        view.backgroundColor = .black
        title = "FORMAS DE PAGAMENTO"
        setTableViewDelegates()
        listaCartaoTableView.rowHeight = 60
        listaCartaoTableView.register(FormaPagamentoCell.self, forCellReuseIdentifier: Cells.formaPagamentoCell)
        listaCartaoTableView.separatorStyle = .none
        listaFormaPagamento = fetchData()
        
    }
}

extension Desafio2ViewController {
    
    func fetchData() -> [String] {
        
        return ["[ CRÉDITO ] - Daycoval", "[ CRÉDITO ] - Santander", "[ DÉBITO ] - Bradesco", "[ DÉBITO ] - Itaú"]
    }
}
