//
//  HomeScreenQAController.swift
//  Touch3D
//
//  Created by lixiangzhou on 2017/8/22.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

/**
 static items setting
 1. 在Info.plist中设置 UIApplicationShortcutItems
 <array>
 <dict>
 <key>UIApplicationShortcutItemIconType</key>
 <string>UIApplicationShortcutIconTypeSearch</string>
 
 <key>UIApplicationShortcutItemTitle</key>
 <string>搜索</string>
 
 <key>UIApplicationShortcutItemSubtitle</key>
 <string>快点来搜索我吧</string>
 
 <key>UIApplicationShortcutItemType</key>
 <string>search</string>
 
 <key>UIApplicationShortcutItemUserInfo</key>
 <dict>
 <key>key1</key>
 <string>value1</string>
 </dict>
 </dict>
 </array>
 
 2.在AppDelegate中实现 application: performActionForShortcutItem: completionHandler:
 
 3.
 * UIApplicationShortcutItemType: 用来区分不同item的字符串 【必要的】
 * UIApplicationShortcutItemTitle: 主标题，如果设置了UIApplicationShortcutItemSubtitle 至多显示一行，如果没有设置 UIApplicationShortcutItemSubtitle 至多显示两行 【必要的】
 * UIApplicationShortcutItemSubtitle: 副标题，至多显示一行
 * UIApplicationShortcutItemIconType: 使用系统提供的图标
 * UIApplicationShortcutItemIconFile: 使用自定义的图标，35*35 点，优先级比 UIApplicationShortcutItemIconType 高
 * UIApplicationShortcutItemUserInfo: 自定义的信息
 
 */

class HomeScreenQAController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if traitCollection.forceTouchCapability == .available {
            // 3d touch 检测是否可用
            if traitCollection.forceTouchCapability == .available {
                
                let item1 = UIApplicationShortcutItem(type: "haha", localizedTitle: "HAHA", localizedSubtitle: "别笑了", icon: UIApplicationShortcutIcon(templateImageName: "happy"), userInfo: nil)
                
                let item2 = UIMutableApplicationShortcutItem(type: "hehe", localizedTitle: "HeHe", localizedSubtitle: "别笑了", icon: UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.compose), userInfo: nil)
                
                UIApplication.shared.shortcutItems = [item1, item2]
                
                
            }
        }
    }
}
