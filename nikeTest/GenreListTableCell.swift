//
//  GenreListTableCell.swift
//  nikeTest
//
//  Created by karthik yalamanchili on 5/4/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit

class GenreListTableCell: UITableViewCell {
    var alumArtShadowView = UIView ()
    var albumArtImageView = UIImageView ()
    var albumArtistName =  UILabel ()
    var albumName = UILabel ()
    
    
    //init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style:style, reuseIdentifier: reuseIdentifier)
        
        //adding views
        addSubview( alumArtShadowView)
        alumArtShadowView.addSubview(albumArtImageView)
        addSubview( albumArtistName)
        addSubview( albumName)
        //set up constraints
        SetupShadowViewConstraints()
        SetupAlbumNameWithArtist()
        SetupAlbumArtConstraints()
        SetupAlbumNameConstraints()
        SetupAlbumArtistLabelConstraints()
        SetupAlbumArt()
        // cosmetics for views in frame
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        self.tintColor = UIColor.white
        self.selectionStyle = .none
        self.accessoryView?.tintColor = UIColor.red
        self.backgroundColor =  UIColor(red: 31/255, green: 31/255, blue:34/255, alpha: 1.0)
        self.albumName.textColor = UIColor.systemPink
        self.albumName.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.semibold)
        self.albumArtistName.textColor = UIColor.white
        self.albumArtistName.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetupAlbumArt (){
        SetUpShadow()
    }
    
    func SetupAlbumNameWithArtist () {
        
    }
    
    func SetupCell(Genre:AlbumInfo){
        albumArtImageView.downloaded(from:Genre.artworkUrl100!)
        albumArtistName.text = Genre.artistName
        albumName.text = Genre.name
    }
    
    //constraints set up functions
    func SetupShadowViewConstraints  () {
        
        alumArtShadowView.translatesAutoresizingMaskIntoConstraints                                = false
        alumArtShadowView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                = true
        alumArtShadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive  = true
        alumArtShadowView.heightAnchor.constraint(equalToConstant: 80.0).isActive                  = true
        alumArtShadowView.widthAnchor.constraint(equalToConstant: 80.0).isActive                   = true
        
        
    }
    
    
    func SetupAlbumArtConstraints () {
        
        albumArtImageView.translatesAutoresizingMaskIntoConstraints                                = false
        albumArtImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                = true
        albumArtImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive  = true
        albumArtImageView.heightAnchor.constraint(equalToConstant: 80.0).isActive                  = true
        albumArtImageView.widthAnchor.constraint(equalToConstant: 80.0).isActive                   = true
        
    }
    
    
    func SetupAlbumNameConstraints () {
        
        albumName.translatesAutoresizingMaskIntoConstraints                                                  = false
        albumName.leadingAnchor.constraint(equalTo: albumArtImageView.trailingAnchor, constant: 25).isActive = true
        albumName.topAnchor.constraint(equalTo: albumArtImageView.topAnchor).isActive                        = true
        albumName.widthAnchor.constraint(equalToConstant: 220.0).isActive                                    = true
        albumName.numberOfLines = 0
        albumName.sizeToFit()
        
    }
    
    
    func SetupAlbumArtistLabelConstraints() {
        
        albumArtistName.translatesAutoresizingMaskIntoConstraints                                                    = false
        albumArtistName.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 8.0).isActive                = true
        albumArtistName.leadingAnchor.constraint(equalTo: albumArtImageView.trailingAnchor, constant: 25.0).isActive = true
        albumArtistName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 30.0).isActive                  = true
        albumArtistName.sizeToFit()
        albumName.numberOfLines = 0
        
    }
    
    
    private func SetUpShadow () {
        
        alumArtShadowView.layer.cornerRadius = 20.0
        alumArtShadowView.backgroundColor = UIColor.white
        alumArtShadowView.layer.shadowColor = UIColor.black.cgColor
        alumArtShadowView.layer.shadowOffset = CGSize(width: -5.0, height: 50.0  )
        alumArtShadowView.layer.shadowRadius = 15.0
        alumArtShadowView.layer.shadowOpacity = 0.5
        albumArtImageView.layer.cornerRadius = 8.0
        albumArtImageView.clipsToBounds = true
        
    }
}

//async doownload images for table view
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
