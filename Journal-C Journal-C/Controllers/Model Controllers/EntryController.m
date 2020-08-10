//
//  EntryController.m
//  Journal-C Journal-C
//
//  Created by Drew Miller on 8/10/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import "EntryController.h"
#import "EntryHelper.h"
#import "Entry.h"

@implementation EntryController

+ (instancetype)sharedInstance
{
    static EntryController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _entries = [NSMutableArray new];
    }
    return self;
}

- (void)addEntry:(Entry *)entry
{
   // entry = [[Entry alloc] initWithName:entry.title bodyText:entry.bodyText timestamp:entry.timestamp];
    [self.entries addObject:entry];
}

- (void)removeEntry:(Entry * )entry
{
    [self.entries removeObject:entry];
}

- (void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
}

@end
