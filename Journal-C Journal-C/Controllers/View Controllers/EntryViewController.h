//
//  EntryViewController.h
//  Journal-C Journal-C
//
//  Created by Drew Miller on 8/10/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntryTableViewController.h"
#import "EntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryViewController : UIViewController

@property (nonatomic) Entry * entryToReceive;

@end

NS_ASSUME_NONNULL_END
