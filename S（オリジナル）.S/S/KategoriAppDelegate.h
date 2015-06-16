//
//  KategoriAppDelegate.h
//  Kategori
//
//  Created by 比嘉　和之 on 11/06/18.
//  Copyright 2011 名桜大学. All rights reserved.
//test

#import <UIKit/UIKit.h>

@interface KategoriAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
