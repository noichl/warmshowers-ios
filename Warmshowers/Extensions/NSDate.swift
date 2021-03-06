//
//  NSDate.swift
//  Warmshowers
//
//  Created by Michael Haeuslmann on 30/06/15.
//  Copyright (c) 2015 Michael haeuslmann. All rights reserved.
//

import UIKit

/*
    Taken from: https://github.com/al7/SwiftDateExtension
*/
public extension NSDate
{
    public func plusSeconds(s: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: Int(s), minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: 0)
    }
    
    public func minusSeconds(s: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: -Int(s), minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: 0)
    }
    
    public func plusMinutes(m: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: Int(m), hours: 0, days: 0, weeks: 0, months: 0, years: 0)
    }
    
    public func minusMinutes(m: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: -Int(m), hours: 0, days: 0, weeks: 0, months: 0, years: 0)
    }
    
    public func plusHours(h: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: Int(h), days: 0, weeks: 0, months: 0, years: 0)
    }
    
    public func minusHours(h: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: -Int(h), days: 0, weeks: 0, months: 0, years: 0)
    }
    
    public func plusDays(d: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: Int(d), weeks: 0, months: 0, years: 0)
    }
    
    public func minusDays(d: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: -Int(d), weeks: 0, months: 0, years: 0)
    }
    
    public func plusWeeks(w: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: Int(w), months: 0, years: 0)
    }
    
    public func minusWeeks(w: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: -Int(w), months: 0, years: 0)
    }
    
    public func plusMonths(m: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: Int(m), years: 0)
    }
    
    public func minusMonths(m: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: -Int(m), years: 0)
    }
    
    public func plusYears(y: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: Int(y))
    }
    
    public func minusYears(y: UInt) -> NSDate
    {
        return self.addComponentsToDate(seconds: 0, minutes: 0, hours: 0, days: 0, weeks: 0, months: 0, years: -Int(y))
    }
    
    private func addComponentsToDate(seconds sec: Int, minutes min: Int, hours hrs: Int, days d: Int, weeks wks: Int, months mts: Int, years yrs: Int) -> NSDate
    {
        var dc:NSDateComponents = NSDateComponents()
        dc.second = sec
        dc.minute = min
        dc.hour = hrs
        dc.day = d
        dc.weekOfYear = wks
        dc.month = mts
        dc.year = yrs
        return NSCalendar.currentCalendar().dateByAddingComponents(dc, toDate: self, options: nil)!
    }
    
    public func midnightUTCDate() -> NSDate
    {
        var dc:NSDateComponents = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay, fromDate: self)
        dc.hour = 0
        dc.minute = 0
        dc.second = 0
        dc.nanosecond = 0
        dc.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        
        return NSCalendar.currentCalendar().dateFromComponents(dc)!
    }
    
    public class func secondsBetween(date1 d1:NSDate, date2 d2:NSDate) -> Int
    {
        let dc = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitSecond, fromDate: d1, toDate: d2, options:nil)
        return dc.second
    }
    
    public class func minutesBetween(date1 d1: NSDate, date2 d2: NSDate) -> Int
    {
        let dc = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMinute, fromDate: d1, toDate: d2, options: nil)
        return dc.minute
    }
    
    public class func hoursBetween(date1 d1: NSDate, date2 d2: NSDate) -> Int
    {
        let dc = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitHour, fromDate: d1, toDate: d2, options: nil)
        return dc.hour
    }
    
    public class func daysBetween(date1 d1: NSDate, date2 d2: NSDate) -> Int
    {
        let dc = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: d1, toDate: d2, options: nil)
        return dc.day
    }
    
    public class func weeksBetween(date1 d1: NSDate, date2 d2: NSDate) -> Int
    {
        let dc = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitWeekOfYear, fromDate: d1, toDate: d2, options: nil)
        return dc.weekOfYear
    }
    
    public class func monthsBetween(date1 d1: NSDate, date2 d2: NSDate) -> Int
    {
        let dc = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMonth, fromDate: d1, toDate: d2, options: nil)
        return dc.month
    }
    
    public class func yearsBetween(date1 d1: NSDate, date2 d2: NSDate) -> Int
    {
        let dc = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitYear, fromDate: d1, toDate: d2, options: nil)
        return dc.year
    }
    
    // MARK: Comparison Methods
    
    public func isGreaterThan(date: NSDate) -> Bool
    {
        return (self.compare(date) == .OrderedDescending)
    }
    
    public func isLessThan(date: NSDate) -> Bool
    {
        return (self.compare(date) == .OrderedAscending)
    }
    
    // MARK: Computed Properties
    
    public var day: Int
    {
        return NSCalendar.currentCalendar().component(.CalendarUnitDay, fromDate: self)
    }
    
    public var month: Int
    {
        return NSCalendar.currentCalendar().component(.CalendarUnitMonth, fromDate: self)
    }
    
    public var year: Int
    {
        return NSCalendar.currentCalendar().component(.CalendarUnitYear, fromDate: self)
    }
    
    public var hour: Int
    {
        return NSCalendar.currentCalendar().component(.CalendarUnitHour, fromDate: self)
    }
    
    public var minute: Int
    {
        return NSCalendar.currentCalendar().component(.CalendarUnitMinute, fromDate: self)
    }
    
    public var second: Int
    {
        return NSCalendar.currentCalendar().component(.CalendarUnitSecond, fromDate: self)
    }
}
