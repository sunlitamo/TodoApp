//
//  CalendarViewController.swift
//  TodoList
//
//  Created by Sunlit.Amo on 07/05/16.
//  Copyright © 2016年 Sunlit.Amo. All rights reserved.
//

import UIKit

class CalendarHelper{
    
    static func dateFormatter(date: (year:Int,month:Int,day:Int))->String{
        
        return "\(date.year)-\(date.month)-\(date.day)"
        
    }
    
    static func loadCalendar(currentYear:Int,currentMonth:Int)->(year:Int,month:Int,firstDay:Int,daysCount:Int){
        
        let gregorian: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
        let components: NSDateComponents = gregorian.components([.Year,.Month,.Weekday],fromDate: dateConverter_NSdate((year:currentYear,month:currentMonth,day:1)))
        let range = gregorian.rangeOfUnit(.Day, inUnit: .Month, forDate: NSDate(year: currentYear,month: currentMonth))
        return (components.year,components.month,components.weekday,range.length)
    }
    
    static func getCurrentDate()->(year:Int,month:Int,firstDay:Int,daysCount:Int){
        
        let gregorian: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
        let components: NSDateComponents = gregorian.components([.Year,.Month,.Weekday],fromDate: NSDate())
        let range = gregorian.rangeOfUnit(.Day, inUnit: .Month, forDate: NSDate())
        return (components.year,components.month,components.weekday,range.length)
    }
    
    static func formatDate(month:Int)->String{
        return NSDateFormatter().monthSymbols[month-1]
    }
    static func dateConverter_NSdate(date: (year:Int,month:Int,day:Int))->NSDate{
        
        let strDate = "\(date.year)-\(date.month)-\(date.day)"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dt = dateFormatter.dateFromString(strDate)!
        return dt
    }
    
    static func dateConverter_Closure(date:NSDate)->(Int,Int,Int){
        
        let gregorian: NSCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
        let components: NSDateComponents = gregorian.components([.Year,.Month,.Day],fromDate: date)
        return (components.year,components.month,components.day)
    }
    
    static func dateConverter_String(date:NSDate)->String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dt = dateFormatter.stringFromDate(date)
        return dt
    }
}
extension NSDate{
    
    convenience
    init(year:Int,month:Int){
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        let d = dateStringFormatter.dateFromString("\(year)-\(month)-01")
        self.init(timeInterval:0, sinceDate:d!)
    }
}

