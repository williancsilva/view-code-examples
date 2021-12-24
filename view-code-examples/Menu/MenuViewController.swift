//
//  ViewController.swift
//  view-code-examples
//
//  Created by Willian  Candido da Silva on 29/11/21.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    //MARK: - Variables
    var menuList: [String] = []
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var tableViewMenu: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        setupView()
    }
    
    func setTableViewDelegates() {
        tableViewMenu.delegate = self
        tableViewMenu.dataSource = self
    }


    @IBAction func abrirDesafio1(_ sender: UIButton) {
        
        let vc = Desafio1ViewController()
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: true, completion:{})
        
    }
    @IBAction func abrirDesafio2(_ sender: UIButton) {
        
        let vc = Desafio2ViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: {})
    }
}

extension MenuViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        view.addSubview(contentView)
        contentView.addSubview(tableViewMenu)
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(view)
        }
        
        tableViewMenu.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func setupAditionalConfigurations() {
        title = "Menu Principal"
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "47525E")]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        view.backgroundColor = UIColor(hex: "F5F5F5")
        setTableViewDelegates()
        tableViewMenu.rowHeight = 80
        tableViewMenu.register(MenuItensCell.self, forCellReuseIdentifier: "cell2")
        tableViewMenu.separatorStyle = .none
        menuList = fetchData()
    }    
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! MenuItensCell
        let menuTitle = menuList[indexPath.row]

        cell.titleLabel.text = menuTitle
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            abrirDesafio1(UIButton())
        } else {
            abrirDesafio2(UIButton())
        }
    }
}

extension MenuViewController {
    
    func fetchData() -> [String] {
        
        return ["Mussum Ipsum", "Formas de Pagamento", "App Daycoval", "Rock in Rio pt1", "Formulário de Cadastro", "Rock in Rio pt2", "etc", "etc"]
    }
}
