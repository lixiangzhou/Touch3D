//
//  ViewController.swift
//  Touch3D
//
//  Created by lixiangzhou on 2017/8/22.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var titles: [[String: String]] = [
        ["title": "Home Screen Quick Actions", "vcClass": "HomeScreenQAController"],
        ["title": "Peek Pop", "vcClass": "PeekPopController"]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ID")
        // 检测Touch3D是否可用
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }


}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]["title"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let className = "\(Bundle.main.infoDictionary!["CFBundleName"]!).\(titles[indexPath.row]["vcClass"]!)"
        guard let clazz = NSClassFromString(className) as? UIViewController.Type else { return }
        
        if clazz == PeekPopController.self {
            print("peek")
        }
        
        let vc = clazz.init()
        vc.title = titles[indexPath.row]["title"]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {
    // 重压的时候调用
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        print(#function)
        
        show(viewControllerToCommit, sender: nil)
    }
    
    // 轻压的时候调用
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print(#function)
        
        let idx = tableView.indexPathForRow(at: location)!
        let cell = tableView.cellForRow(at: idx)!
        
        let clazz = NSClassFromString("\(Bundle.main.infoDictionary!["CFBundleName"]!).\(titles[idx.row]["vcClass"]!)") as! UIViewController.Type
        
        let vc = clazz.init()
        
        if vc is PeekPopController {
            // 设置width无效， 可以设置height
            vc.preferredContentSize = CGSize(width: 0, height: 200)
            vc.title = titles[idx.row]["title"]
            previewingContext.sourceRect = cell.frame
            
            return vc
        }
        
        return nil
    }
}

