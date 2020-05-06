//
//  DetailsViewController.swift
//  nikeTest
//
//  Created by karthik yalamanchili on 5/4/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit


class DetailsViewController: UIViewController {
    
    var albumArtDetailImageView = UIImageView ()
    var alumArtDetailShadowView = UIView ()
    var albumDetailArtistName =  UILabel ()
    var albumDetailName = UILabel ()
    var albumCopyRight  = UILabel ()
    var albumGenre = UILabel ()
    var albumReleaseDate = UILabel ()
    var storeButton = UIButton ()
    
    var stackView = UIStackView ()
    
    var details = AlbumInfo ()
    
    
    // var dataSet = GenreListViewController()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        // initializer implementation goes here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 31/255, green: 31/255, blue:34/255, alpha: 1.0)
        self.storeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        
        ConfigureDetailView ()
        
        // Do any additional setup after loading the view.
    }
//MARK: - ButtonAction
    @objc func buttonAction(sender: StoreButton) {
        if let storeURL = URL(string:details.url!), UIApplication.shared.canOpenURL(storeURL) {
            UIApplication.shared.open(storeURL, options: [:], completionHandler: nil)
        }
    }
    
    
    func ConfigureDetailView () {
        
        view.addSubview(alumArtDetailShadowView)
        alumArtDetailShadowView.addSubview(albumArtDetailImageView)
        view.addSubview(stackView)
        view.addSubview(storeButton)
    
        SetUpArtConstraints()
        SetUpShadow()
        SetUpLabels()
    
        ConfigureStack ()
        ConfigureStoreButton ()
    }
    
    
    func  ConfigureStack () {
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        AddLabelsToStack ()
        AddStackViewConstraints()
        stackView.backgroundColor = UIColor.clear
        
    }
    
    func ConfigureStoreButton () {
        
        SetButtonConstraints()
        storeButton.layer.cornerRadius = 28
        storeButton.layer.opacity = 0.8
        storeButton.layer.backgroundColor = UIColor.black.cgColor
        storeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        storeButton.setTitleColor(UIColor.systemPink, for: .normal)
        storeButton.setTitle("  Music ", for: .normal)
        storeButton.layer.cornerRadius = 20.0
        storeButton.layer.shadowColor = UIColor.black.cgColor
        storeButton.layer.shadowOffset = CGSize(width: 5.0, height: 20.0  )
        storeButton.layer.shadowRadius = 15.0
        storeButton.layer.shadowOpacity = 1.0
        storeButton.isUserInteractionEnabled = true
        //storeButton = StoreButton()
        
    }
    
    
    
    
    func AddLabelsToStack () {
        
        self.stackView.addArrangedSubview(albumDetailName)
        self.stackView.addArrangedSubview(albumDetailArtistName)
        self.stackView.addArrangedSubview(albumGenre)
        self.stackView.addArrangedSubview(albumReleaseDate)
        self.stackView.addArrangedSubview(albumCopyRight)
        
    }
    
    
    func SetUpLabels () {
        
        //SetupConstraintsforLabels ()
        albumDetailName .SetUpLabel()
        albumDetailArtistName.SetUpLabel()
        albumGenre .SetUpLabel()
        albumReleaseDate .SetUpLabel()
        albumCopyRight.SetUpLabel()
        albumDetailArtistName.textColor = UIColor.systemPink
        albumDetailName.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
    }
    
    
    func AddStackViewConstraints () {
        
        stackView.translatesAutoresizingMaskIntoConstraints                                                             = false
        stackView.topAnchor.constraint(equalTo: self.alumArtDetailShadowView.bottomAnchor, constant: 50).isActive       = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 30).isActive  = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive                                   = true
        
    }
    
    
    func SetButtonConstraints () {
        
        storeButton.translatesAutoresizingMaskIntoConstraints                                                           = false
        storeButton.heightAnchor.constraint(equalToConstant: 60.0).isActive                                             = true
        storeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive                                 = true
        storeButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
        storeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive                    = true
        
    }
    
    
    //set constraints  to albumArt
    func SetUpArtConstraints () {
        
        alumArtDetailShadowView.translatesAutoresizingMaskIntoConstraints                                   = false
        alumArtDetailShadowView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive  = true
        alumArtDetailShadowView.heightAnchor.constraint(equalToConstant: 200.0).isActive                    = true
        alumArtDetailShadowView.widthAnchor.constraint(equalToConstant: 200.0).isActive                     = true
        alumArtDetailShadowView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive         = true
        
        albumArtDetailImageView.translatesAutoresizingMaskIntoConstraints                                                      = false
        albumArtDetailImageView.leadingAnchor.constraint(equalTo: alumArtDetailShadowView.leadingAnchor, constant: 0).isActive = true
        albumArtDetailImageView.trailingAnchor.constraint(equalTo: alumArtDetailShadowView.trailingAnchor).isActive            = true
        albumArtDetailImageView.topAnchor.constraint(equalTo: alumArtDetailShadowView.topAnchor).isActive                      = true
        albumArtDetailImageView.bottomAnchor.constraint(equalTo: alumArtDetailShadowView.bottomAnchor).isActive                = true
        
    }
    
    //create shado for the AlbumArt
    func SetUpShadow () {
        
        alumArtDetailShadowView.layer.cornerRadius = 30.0
        alumArtDetailShadowView.backgroundColor = UIColor.clear
        alumArtDetailShadowView.layer.shadowColor = UIColor.black.cgColor
        alumArtDetailShadowView.layer.shadowOffset = CGSize(width: 5.0, height: 50.0  )
        alumArtDetailShadowView.layer.shadowRadius = 30.0
        alumArtDetailShadowView.layer.shadowOpacity = 0.5
        alumArtDetailShadowView.layer.cornerRadius = 8.0
        albumArtDetailImageView.layer.cornerRadius = 8.0
        albumArtDetailImageView.clipsToBounds = true
        
    }

    //set data  to view on details controller.
    func SetupDetails(DetailData:AlbumInfo) {
        
        ConfigureDetailView ()
        
        self.albumArtDetailImageView.downloaded(from:DetailData.artworkUrl100!)
        self.albumDetailName.text = DetailData.name
        self.albumDetailArtistName.text  = DetailData.artistName
        self.albumReleaseDate.text  = DetailData.releaseDate
        self.albumCopyRight.text = DetailData.copyright
        
        extractedFunc(DetailData)
        
    }
    
// MARK: - stringCleaner-private
    //private func to extract the genre Due to bad parse.
    fileprivate func extractedFunc(_ DetailData: AlbumInfo) {
        
        details = DetailData
        let str  = [DetailData.genres].description
        let str1 =  str.replacingOccurrences(of: "Optional([nikeTest.GenreType(name: Optional(", with: "")
        let str2 = str1.replacingOccurrences(of: ")), nikeTest.GenreType(name: Optional(", with: " ")
        let str3 = str2.replacingOccurrences(of:"\"))])]", with: "")
        let str4 = str3.replacingOccurrences(of: "[\" "  , with: "")
        let str5 = str4.replacingOccurrences(of: "["    ,    with: "" )
        let str6 = str5.replacingOccurrences(of:  "Music" , with: "" )
        let str7 = str6.stripped
        let data = str7.replacingOccurrences(of:"HopRap", with:"hop/Rap")
        self.albumGenre.text = data
    }
    
}

// MARK: - stringCleaner-Extention
//filter string from special char
extension String {
    
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")
        return self.filter {okayChars.contains($0) }
    }
}

