//
//  ItemsManager.swift
//  ScavengerHunt
//
//  Created by Hongfei Li on 9/18/14.
//  Copyright (c) 2014 Hongfei Li. All rights reserved.
//

import Foundation


class ItemsManager {
    
    // UIManagementDocument
    
    
    var items = [ScavengerHuntItem]()
    
    lazy private var archivePath: String = {
        
        let fileManager = NSFileManager.defaultManager()
        
        let documentDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        
        let archiveURL = documentDirectoryURLs.first!.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory: false)
        
        return archiveURL.path!
    }()
    
    func save() {
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
    }
    
    private func unarchiveSavedItems() {
        
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath) {
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [ScavengerHuntItem]
            
            items += savedItems
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
    
}