//
//  EntryController.h
//  Journal-C Journal-C
//
//  Created by Drew Miller on 8/10/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

//MARK: - Shared Instance
+ (instancetype)sharedInstance;

//MARK: - Source of Truth
@property (nonatomic) NSMutableArray<Entry *> * entries;

- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;
- (void)updateEntry:(Entry *)entry
              title:(NSString *)title
           bodyText:(NSString *)bodyText;

@end

NS_ASSUME_NONNULL_END
