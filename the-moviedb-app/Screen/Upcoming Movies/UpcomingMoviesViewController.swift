//
//  UpcomingMoviesViewController.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UICollectionViewController {
    
    var isSearchActive: Bool           = false
    var currentPage: Int               = 1
    var availableGenres: [GenreEntity] = []
    var countryList: [CountryEntity]   = []
    
    var searchTaskManager: DispatchWorkItem!
    var viewTaskManager: DispatchWorkItem!
    
    var pickedCountry: String = Locale.current.regionCode ?? "US" {
        didSet {
            self.invalidateCurrentMovieSet()
        }
    }
    
    var movies: [MovieDTO] = [] {
        didSet {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
    }
    
    var filteredMovies: [MovieDTO] = [] {
        didSet {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
    }
    
    lazy var presenter: UpcomingMoviesPresenterContract = UpcomingMoviesPresenter(view: self)
    
    lazy var regionPickerView: UIPickerView! = {
        let pickerView = UIPickerView()
        
        pickerView.delegate        = self
        pickerView.dataSource      = self
        pickerView.backgroundColor = .tertiarySystemBackground
        pickerView.tintColor       = .secondaryLabel
        
        return pickerView
    }()
    
    lazy var navigationTitleLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 0,
                                          y: 0,
                                          width: self.view.frame.width - 32,
                                          height: self.view.frame.height))
        
        label.font      = UIFont.helveticaNeue(size: 20)
        label.textColor = .label
        label.text      = AppStrings.upcomingMovies.capitalized
        
        return label
    }()
    
    lazy var searchBarButtonItem: UIBarButtonItem! = { [unowned self] in
        let searchBarItem       = UIBarButtonItem(barButtonSystemItem: .search,
                                                  target: self,
                                                  action: #selector(searchBarDidPress))
        searchBarItem.tintColor = .label
        
        return searchBarItem
    }()
    
    lazy var searchBar: UISearchBar! = { [unowned self] in
        let searchBar = UISearchBar(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: self.view.frame.width,
                                                  height: 20))
        
        searchBar.delegate = self
        
        return searchBar
    }()
    
    lazy var locationButton: UIButton! = { [unowned self] in
        let button = UIButton()
        let image  = UIImage.marker.withRenderingMode(.alwaysTemplate)
        
        button.setImage(image, for: .normal)
        
        button.imageView?.tintColor    = .label
        button.backgroundColor         = .tertiarySystemBackground
        button.accessibilityIdentifier = "locationButton"
        
        button.imageEdgeInsets = UIEdgeInsets(top: 12,
                                              left: 17,
                                              bottom: 12,
                                              right: 17)
        
        button.addTarget(self, action: #selector(locationButtonDidPress), for: .touchUpInside)
        
        return button
    }()
    
    deinit {
        self.navigationTitleLabel = nil
        self.regionPickerView     = nil
        self.searchBarButtonItem  = nil
        self.searchBar            = nil
        self.locationButton       = nil
        self.searchTaskManager    = nil
        self.viewTaskManager      = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setLayout()
        
        self.presenter.fetchGenres()
    }
    
    @objc func searchBarDidPress(sender: UIBarButtonItem) {
        self.toggleNavigationBarItems()
        self.searchBar.becomeFirstResponder()
        
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissSearch))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled            = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func dismissSearch(sender: UITapGestureRecognizer) {
        self.searchBar.resignFirstResponder()
        self.toggleNavigationBarItems()
    }
    
    @objc func locationButtonDidPress(sender: UIButton) {
        self.composedAlert(title: AppStrings.pickRegion.firstCapitalized(),
                           message: AppStrings.pickRegionTitle.firstCapitalized(),
                           handlersTitles: [AppStrings.brazil.capitalized,
                                            AppStrings.unitedStates.capitalized,
                                            AppStrings.otherRegion.capitalized,
                                            AppStrings.cancel.capitalized],
                           handlers: [(brazilRegionPicked, .default),
                                      (americaRegionPicked, .default),
                                      (otherRegionPicked, .default),
                                      (cancelRegionPick, .destructive)])
    }
    
    func brazilRegionPicked(action: UIAlertAction) {
        self.pickedCountry = "BR"
    }
    func americaRegionPicked(action: UIAlertAction) {
        self.pickedCountry = "US"
    }
    func otherRegionPicked(action: UIAlertAction) {
        if self.countryList.isEmpty {
            self.presenter.fetchCoutries()
            return
        }
        
        self.layPickerView()
    }
    
    func cancelRegionPick(action: UIAlertAction) { }
}
