--
--  Test_Global_MonitorAppDelegate.applescript
--  Test Global Monitor
--
--  Created by Eric Nitardy on 11/27/10.
--  Copyright 2010 University of Washington. All rights reserved.
--

global myMonitor

property GlobalMonitor : class "GlobalMonitor"

script Test_Global_MonitorAppDelegate
	property parent : class "NSObject"
	
	on monitorNext_(sender)
		GlobalMonitor's monitorNext_(current application's NSLeftMouseDownMask)
		log (current application's NSRightMouseUp) as integer
	end monitorNext_
	
	on monitorOn_(sender)
		set myMonitor to GlobalMonitor's monitorEvery_(current application's NSLeftMouseDownMask)
	end monitorOn_
	
	on monitorOff_(sender)
		GlobalMonitor's removeMonitor_(myMonitor)
		set myMonitor to missing value
	end monitorOff_
	
	on eventHappens_(aNotification)
		say "left mouse down"
	end eventHappens_
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
		set myMonitor to missing value
		set noteCenter to current application's NSNotificationCenter's defaultCenter
		noteCenter's addObserver_selector_name_object_(me, "eventHappens:", "eventNotification", missing value)
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script