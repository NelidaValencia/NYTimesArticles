//
//  ArticleCellView.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

class ArticleCellView: UITableViewCell {
    let articleMovieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(
            ofSize: 20,
            weight: .bold,
            width: .condensed
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let articleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(
            ofSize: 16,
            weight: .medium,
            width: .condensed
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(articleMovieImage)
        addSubview(articleTitleLabel)
        addSubview(articleDescriptionLabel)
        
        NSLayoutConstraint.activate([
            articleMovieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            articleMovieImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            articleMovieImage.heightAnchor.constraint(equalToConstant: 200),
            articleMovieImage.widthAnchor.constraint(equalToConstant: 100),
            articleMovieImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            articleTitleLabel.leadingAnchor.constraint(equalTo: articleMovieImage.leadingAnchor, constant: 18),
            articleTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            articleTitleLabel.topAnchor.constraint(equalTo: articleMovieImage.topAnchor, constant: 24),
            
            articleDescriptionLabel.leadingAnchor.constraint(equalTo: articleMovieImage.leadingAnchor, constant: 20),
            articleDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            articleDescriptionLabel.topAnchor.constraint(equalTo: articleTitleLabel.topAnchor, constant: 60)
        ])
    }
    
    func configure(model: ViewModel) {
        articleTitleLabel.text = model.title
        articleDescriptionLabel.text = model.abstract
    }
}
