//
//  GlobalMonitor.m
//  Test Global Monitor
//
//  Created by Eric Nitardy on 11/27/10.
//  Copyright 2010 University of Washington. All rights reserved.
//

#import "GlobalMonitor.h"

@implementation GlobalMonitor

+(id) monitorEvery: (NSEventMask) eventMask performSelector: (SEL) aSelector target: (id) target {
	id myMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:eventMask handler:^(NSEvent *event) {
		NSLog(@"EveryMonitorEvent");
		[target performSelector: aSelector withObject: event];
		
	}];	
	return myMonitor;	
}

+(void) monitorNext: (NSEventMask) eventMask performSelector: (SEL) aSelector target: (id) target {
	 myNextMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:eventMask handler:^(NSEvent *event) {
		NSLog(@"NextMonitorEvent");
		[NSEvent removeMonitor: myNextMonitor];				
		[target performSelector: aSelector withObject: event];
		 
	}];	
}

+(void) removeMonitor: (id) monitor {	
	[NSEvent removeMonitor: monitor];	
}

@end
