//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Luka Džalto on 08.04.2024..
//

import Foundation
import UIKit
import MovieAppData
import PureLayout

class MovieDetailsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let movieData = MovieUseCase().getDetails(id: 111161)
        
        let imageView: UIImageView
        let nameView = UILabel(), dateView = UILabel(), durationView = UILabel(), ratingView = UILabel(), categoriesView = UILabel()
        let favoriteButton = UIButton()
        
        let description = UIView()
        let summaryView = UILabel(), crewView = UILabel()
        
        summaryView.text = movieData?.summary
        dateView.text = movieData?.releaseDate
        durationView.text = String(movieData?.duration ?? 0)
        ratingView.text = String(movieData?.rating ?? 0)
        favoriteButton.setTitle("☆", for: .normal)
        crewView.text = "Ekipa"
        nameView.text = movieData?.name ?? "Something went wrong..."
//        if let categories = movieData?.categories {
//            for category in categories {
//                categoriesView.text +=
//                }
//            }
//        }
        
        if let imageUrl = movieData?.imageUrl {
            imageView = UIImageView(image: UIImage(data: try! Data(contentsOf: URL(string: imageUrl)!)))
        } else {
            imageView = UIImageView(image: UIImage(named: "noImg"))
        }
        
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        imageView.contentMode = .scaleAspectFill
//        name.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        name.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        imageView.addSubview(nameView)
        imageView.addSubview(dateView)
        imageView.addSubview(durationView)
        imageView.addSubview(favoriteButton)
        imageView.addSubview(ratingView)
        
//        imageView.autoCenterInSuperview()
        imageView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0)
        imageView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        imageView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        imageView.contentMode = .scaleAspectFill

        ratingView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        nameView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        nameView.autoPinEdge(.top, to: .bottom, of: ratingView, withOffset: 20)
        dateView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        dateView.autoPinEdge(.top, to: .bottom, of: nameView, withOffset: 20)
        durationView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        durationView.autoPinEdge(.top, to: .bottom, of: dateView, withOffset: 20)
        favoriteButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
        favoriteButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        favoriteButton.autoPinEdge(.top, to: .bottom, of: durationView, withOffset: 20)
        favoriteButton.backgroundColor = .systemGray
        favoriteButton.alpha = 0.5
        favoriteButton.autoSetDimension(.height, toSize: 30)
        favoriteButton.autoSetDimension(.width, toSize: 30)
        
        
        view.addSubview(description)
        description.addSubview(summaryView)
        
        description.autoPinEdge(.top, to: .bottom, of: imageView)
        summaryView.autoPinEdge(toSuperviewEdge: .top, withInset: 40)
        summaryView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
    }

}
