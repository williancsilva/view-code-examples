//
//  ViewCodeProtocol.swift
//  view-code-examples
//
//  Created by Willian  Candido da Silva on 29/11/21.
//

public protocol ViewCodeProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAditionalConfigurations()
    func setupView()
}

extension ViewCodeProtocol {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAditionalConfigurations()
    }
}
