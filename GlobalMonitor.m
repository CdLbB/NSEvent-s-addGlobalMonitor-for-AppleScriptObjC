//
//  GlobalMonitor.m
//  Test Global Monitor
//
//  Created by Eric Nitardy on 11/27/10.
//  Copyright 2010 University of Washington. All rights reserved.
//

#import "GlobalMonitor.h"


@implementation GlobalMonitor

+(id) monitorEvery: (NSEventMask) eventMask withNotificatonNamed: (NSString *) eventNotification {
	id myHotKey = [NSEvent addGlobalMonitorForEventsMatchingMask:eventMask handler:^(NSEvent *event) {
		NSLog(@"EveryMonitorEvent");
		[[NSNotificationCenter defaultCenter] postNotificationName:eventNotification object:nil];
		
	}];
	
	return myHotKey;
	
}

+(void) monitorNext: (NSEventMask) eventMask withNotificatonNamed: (NSString *) eventNotification {
	 myNextMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:eventMask handler:^(NSEvent *event) {
		NSLog(@"NextMonitorEvent");
		[NSEvent removeMonitor: myNextMonitor];				
		[[NSNotificationCenter defaultCenter] postNotificationName:eventNotification object:nil];
		 
	}];
	
}

+(void) removeMonitor: (id) monitor {
	
	[NSEvent removeMonitor: monitor];
	
}

@end
