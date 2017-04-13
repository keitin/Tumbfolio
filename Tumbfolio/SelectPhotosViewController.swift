//
//  SelectPhotosViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

final class SelectPhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    var posts: [CandidatePost] = []
    let currentUser = CurrentUser.sharedInstance.user!
    var selectedPhotosCount = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "✕", style: .plain, target: self, action: #selector(SelectPhotosViewController.tapCloseButton(sender:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NEXT", style: .plain, target: self, action: #selector(SelectPhotosViewController.tapNextButton(sender:)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        posts = CandidatePost.trans(posts: currentUser.posts)
        setupCollectionView()
        
        // MARK: Register cell to collection view
        self.collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
    }

    // MARK: Navigation Item Actions
    func tapCloseButton(sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func tapNextButton(sender: UIBarButtonItem) {
        guard selectedPhotosCount > 0 else {
            print("Select photos")
            return
        }
        let editPhotosViewController = EditPhotosViewController.makeInstance()
        editPhotosViewController.selectedPosts = SelectedPosts(candidatePosts: posts)
        self.navigationController?.pushViewController(editPhotosViewController, animated: true)
    }
    
    // MARK: Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.fillWith(candidatePost: posts[indexPath.row])
        return cell
    }
    
    // MARK: Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCell
        let post = posts[indexPath.row]
        if (post.selected) {
            selectedPhotosCount = selectedPhotosCount - 1
        } else {
            selectedPhotosCount = selectedPhotosCount + 1
        }
        cell.tapCell(candidatePost: post)
    }
    
    // MARK: Collection View Delegate Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = self.view.frame.size.width/3 - 1
        return CGSize(width: cellSize, height: cellSize)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        self.collectionView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height - (self.navigationController?.navigationBar.frame.height)!)
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.view.addSubview(self.collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
