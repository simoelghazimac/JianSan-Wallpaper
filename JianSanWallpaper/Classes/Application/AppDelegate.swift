//
//  AppDelegate.swift
//  JianSan Wallpaper
//
//  Created by jianfeng on 16/2/4.
//  Copyright © 2016年 六阿哥. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var on = false
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        setupGlobalStyle()
        setupUMSocial()
        loadViewController()
        setupSaveWallPaper()
        
        return true
    }
    
    /**
     配置保存壁纸选项
     */
    private func setupSaveWallPaper() -> Void {
        JFNetworkTools.shareNetworkTools.checkSaveState { (on) in
            self.on = on
            JFWallPaperTool.shareInstance().on = on
        }
    }
    
    /**
     配置ShareSDK
     */
    private func setupUMSocial() -> Void {
        
        UMSocialData.setAppKey(UM_APP_KEY)
        
        // 微信
        if WXApi.isWXAppInstalled() && WXApi.isWXAppSupportApi() {
            UMSocialWechatHandler.setWXAppId(WX_APP_ID, appSecret: WX_APP_SECRET, url: "https://blog.6ag.cn")
        }
        
        // QQ
        if QQApiInterface.isQQInstalled() && QQApiInterface.isQQSupportApi() {
            UMSocialQQHandler.setQQWithAppId(QQ_APP_ID, appKey: QQ_APP_KEY, url: "https://blog.6ag.cn")
        }
        
        // 微博
        UMSocialSinaSSOHandler.openNewSinaSSOWithAppKey(WB_APP_KEY, secret: WB_APP_SECRET, redirectURL: WB_REDIRECT_URL)
    }
    
    /**
     配置全局样式
     */
    private func setupGlobalStyle() {
        
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        JFProgressHUD.setupHUD()
    }
    
    /**
     加载默认根控制器
     */
    private func loadViewController() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = JFNavigationController(rootViewController: JFHomeViewController())
        window?.makeKeyAndVisible()
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

