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
    let count: CGFloat = 3
    var editos: [PhotoInfoEditor] = []
    
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
        self.scrollView.contentSize = CGSize(width: scrollView.frame.width * count, height: scrollView.frame.height - navigationController!.navigationBar.frame.height)
        for i in 0...Int(count - 1) {
            let editor = PhotoInfoEditor.makeInstance()
            editor.frame.size = CGSize(width: scrollView.frame.width, height: scrollView.frame.height)
            editor.frame.origin.x = CGFloat(i) * scrollView.frame.width
            editor.frame.origin.y = 0
            editor.id = i
            scrollView.addSubview(editor)
            editos.append(editor)
        }
    }


}
