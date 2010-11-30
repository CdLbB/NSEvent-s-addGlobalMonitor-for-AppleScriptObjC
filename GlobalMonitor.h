//
//  GlobalMonitor.h
//  Test Global Monitor
//
//  Created by Eric Nitardy on 11/27/10.
//  Copyright 2010 University of Washington. All rights reserved.
//

#import <Cocoa/Cocoa.h>

static id myNextMonitor;

@interface GlobalMonitor : NSObject 

+(id) monitorEvery: (NSEventMask) eventMask;

+(void) monitorNext: (NSEventMask) eventMask;
	
+(void) removeMonitor: (id) monitor;

@end
