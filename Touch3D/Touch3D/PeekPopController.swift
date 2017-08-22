//
//  PeekPopController.swift
//  Touch3D
//
//  Created by lixiangzhou on 2017/8/22.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class PeekPopController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("PeekPopController deinit")
    }

    // 轻压的时候会弹出下面的Items
    override var previewActionItems : [UIPreviewActionItem] {
        func previewActionForTitle(_ title: String, style: UIPreviewActionStyle = .default) -> UIPreviewAction {
            return UIPreviewAction(title: title, style: style) { previewAction, viewController in
                print("\(previewAction.title) triggered from \(viewController) ")
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        
        let action1 = previewActionForTitle("Default Action")
        let action2 = previewActionForTitle("Destructive Action", style: .destructive)
        
        let subAction1 = previewActionForTitle("Sub Action 1")
        let subAction2 = previewActionForTitle("Sub Action 2")
        let groupedActions = UIPreviewActionGroup(title: "Sub Actions…", style: .default, actions: [subAction1, subAction2] )
        
        return [action1, action2, groupedActions]
    }

}
