//
//  FontListerAppDelegate.h
//  FontLister
//
//  Created by Chris Searle on 28.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FontListerViewController;

@interface FontListerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FontListerViewController *viewController;

@end
