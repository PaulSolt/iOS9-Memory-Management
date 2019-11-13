//
//  Car.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)init
{
	self = [super init];
	if (self) {
		NSLog(@"Car.init");
	}
	return self;
}

+ (instancetype)car {
	return [[[Car alloc] init] autorelease];
}

- (void)dealloc {
	NSLog(@"Car.dealloc");
	[super dealloc];
}


@end
