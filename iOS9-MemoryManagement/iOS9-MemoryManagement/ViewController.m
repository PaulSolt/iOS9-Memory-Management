//
//  ViewController.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Car.h"

// Objective-C Automatic Reference Counting = NO
// CLANG_ENABLE_OBJC_ARC = NO


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	[self emailContacts];
	
	NSString *day = [[NSString alloc] initWithString:@"Wednesday"]; // day: 1
	NSString *tomorrow = [self newDayOfWeek]; // tomorrow: 1
	
	if ([day isEqual:tomorrow]) {
//		[day retain]; // day: 2
		NSLog(@"The days are equal");
	} else {
//		[tomorrow retain]; // tomorrow: 2
	}
	
	[day release];  // day: 1 -> 0
	[tomorrow release]; // tomorrow: 1->0  // 2 -> 1 (memory leak)
	
	
	
	
	
	// Activity: Add elements to the array

	NSMutableArray *colors = [[NSMutableArray alloc] init];

	NSString *red = [[NSString alloc] initWithString:@"Red"];

	// TODO: Add red and 3 more colors to the array without leaking memory


	// TODO: Cleanup the memory
	
	
	// Car
	

	Car *honda = [[Car alloc] init]; // Car: 1
	Person *james = [[Person alloc] init]; //James: 1
	
	james.car = honda; // Car: 2
	[honda release];	// Car: 1  // dealer sells car
	honda = nil;
	
	
	// cleanup
	[james release];
	james = nil;
}







- (NSString *)newDayOfWeek {	// create or make (you own the memory returned)
	return [[NSString alloc] initWithString:@"Thursday"];
}

- (void)emailContacts {
	
	// Retain count: 1
	NSArray *contacts = [[NSArray alloc] initWithObjects:@"Paul.Solt@LambdaSchool.com", @"John@example.com", nil];
	
	// ... Loop through and email each contact
	for (NSString *contact in contacts) {
		NSLog(@"Emailing: %@", contact);
	}
	// Cleanup
	[contacts release];	// Retain count: 0 -> the object memory is cleaned up immediately
}


@end
