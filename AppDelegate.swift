//
//  AppDelegate.swift
//  publish4AllUtilityTools
//
//  Created by ZhuWeicheng on 9/4/15.
//  Copyright (c) 2015 Zhu,Weicheng. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
//        let sourcePath = String(stringInterpolationSegment: NSBundle.mainBundle().pathForResource("some", ofType:"rb")!)
//
//        println(sourcePath)
//        system(" " + sourcePath)
        var allBooks:[Book] = []
    }
    
        var b1:Book = Book()
        b1.author = "Ms. Author"
        b1.title = "Keeping the Faith"
        b1.pageCount = 50
        allBooks.append(b1)
        var b2:Book = Book()
        b2.author = "Mr. Author"
        b2.title = "Hangin' Out"
        b2.pageCount = 503
        allBooks.append(b2)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

