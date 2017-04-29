//
//  AppDelegate.swift
//  TryFabric
//
//  Created by akatsuki174 on 2017/04/29.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit
import Fabric
import Optimizely

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Optimizely.self])
        Optimizely.start(withAPIToken: getSocketToken(), launchOptions:launchOptions)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK:Fabric
    // Fabricで使うキーを取り出すためのメソッド群
    // 後ほど適切な場所に切り出す
    
    // 注：試しに使う時は自分のキーをInfo.plistに入れる
    
    func getFabricPlist() -> NSDictionary {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        let dictionary = NSDictionary(contentsOfFile: path!)
        return (dictionary!["Fabric"] as! NSDictionary)
    }
    
    func getSocketToken() -> String {
        let fabricDic = getFabricPlist()
        return ((((fabricDic["Kits"] as! NSArray)[0] as! NSDictionary)["KitInfo"] as! NSDictionary)["socket_token"] as! String)
    }
    
    func getFabricAPIKey() -> String {
        let fabricDic = getFabricPlist()
        return fabricDic["APIKey"] as! String
    }
}

