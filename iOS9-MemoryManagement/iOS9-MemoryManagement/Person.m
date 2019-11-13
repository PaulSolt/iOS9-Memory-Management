//
//  Person.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init {
	self = [super init];
	if (self) {
		NSLog(@"Person.init");
	}
	return self;
}

- (instancetype)initWithCar:(Car *)car {
	self = [super init];
	if (self) {
		NSLog(@"Person.init");
	}
	return self;
}

- (void)dealloc {
	NSLog(@"Person.dealloc");
	
	[_car release];
	_car = nil;
	
	// Call [super dealloc] last in your
	[super dealloc];
}


- (void)setCar:(Car *)car {
	if (_car != car) { // Fixes crash on assignment to same car
		[_car release];
		_car = [car retain];
	}
}

@end
