//
//  EditPhotosViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

final class EditPhotosViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var editors: [PhotoInfoEditor] = []
    var selectedPosts: SelectedPosts!
    
    static func makeInstance() -> EditPhotosViewController {
        let storyboard = UIStoryboard(name: "EditPhotos", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! EditPhotosViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Photos"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(EditPhotosViewController.tapCreateButton(sender:)))
        
        fillValuesIntoEditor()
        
        // MARK: Add Tap Gesture
        let gesture = UITapGestureRecognizer(target: self, action: #selector(EditPhotosViewController.tapScreen(sender:)))
        self.view.addGestureRecognizer(gesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        designScrollView()
    }
    
    func tapCreateButton(sender: UIBarButtonItem) {
        let portfolio = Portfolio(editors: editors)
        CurrentPortfolio.sharedInstance.portfolio = portfolio
        dismiss(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    private func fillValuesIntoEditor() {
        for index in 0...selectedPosts.numberOfPosts - 1 {
            let editor = PhotoInfoEditor.makeInstance()
            editor.fillWith(post: selectedPosts.posts[index])
            scrollView.addSubview(editor)
            editors.append(editor)
        }
    }
    
    private func designScrollView() {
        self.scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(selectedPosts.numberOfPosts), height: scrollView.frame.height - navigationController!.navigationBar.frame.height)
        self.scrollView.delegate = self
        for index in 0...selectedPosts.numberOfPosts - 1 {
            let editor = editors[index]
            editor.draw(rect: scrollView.frame, position: index)
        }
    }


}
