//
//  Person.h
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject

// retain = strong ownership of the memory
@property (nonatomic, retain) Car *car;

- (instancetype)initWithCar:(Car *)car;

@end
