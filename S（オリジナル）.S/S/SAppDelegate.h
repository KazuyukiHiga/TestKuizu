//
//  SAppDelegate.h
//  S
//
//  Created by 比嘉　和之 on 11/07/15.
//  Copyright 2011 名桜大学. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SViewController;

@interface SAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SViewController *viewController;

@end
