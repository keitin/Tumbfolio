//
//  EditPhotosViewController.swift
//  Tumbfolio
//
//  Created by 松下慶大 on 2017/04/12.
//  Copyright © 2017年 matsushita keita. All rights reserved.
//

import UIKit

class EditPhotosViewController: UIViewController {

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
        designScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func designScrollView() {
        self.scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(selectedPosts.numberOfPosts), height: scrollView.frame.height - navigationController!.navigationBar.frame.height)
        for index in 0...selectedPosts.numberOfPosts - 1 {
            let editor = PhotoInfoEditor.makeInstance()
            editor.draw(rect: scrollView.frame, position: index)
            editor.fillWith(post: selectedPosts.posts[index])
            scrollView.addSubview(editor)
            editors.append(editor)
        }
    }


}
