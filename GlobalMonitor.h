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

+(id) monitorEvery: (NSEventMask) eventMask performSelector: (SEL) aSelector target: (id) target;

+(void) monitorNext: (NSEventMask) eventMask performSelector: (SEL) aSelector target: (id) target;
	
+(void) removeMonitor: (id) monitor;

@end
