//
//  Entry.h
//  Journal-C Journal-C
//
//  Created by Drew Miller on 8/10/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * bodyText;
@property (nonatomic, copy) NSDate * timestamp;

- (instancetype) initWithName:(NSString *)title
                 bodyText:(NSString *)bodyText
                    timestamp:(NSDate *)timestamp;

@end

NS_ASSUME_NONNULL_END
