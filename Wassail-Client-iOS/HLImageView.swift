//
//  HLImageView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit
import QuickLook

class HLImageView: HLItemView {
    
    @IBOutlet var imageView: UIImageView?
    
    var name: NSString?
    
    override func configure(dict: NSDictionary?) {
        
        if (dict == nil) {
            return
        }
        
        let name = dict!.objectForKey("address") as NSString
        self.name = name
        let image = DefaultInfo.instance.getImage(name) as UIImage?
        if (image == nil) {
            return
        }
        
        let scale = image!.size.width / image!.size.height
        let width = DefaultInfo.instance.getScreenWidth() - 30.0
        let height = width / scale
        
        imageView!.image = image!.scaledToSize(CGSizeMake(width, height))
        
    }
    
    @IBAction func tapHandler() {
        
        var previewController = QLPreviewController()
        previewController.dataSource = self.controller! as ArticleViewController
        
        let address = DefaultAccessor.instance.getImageURL(name!)
        let index = (self.controller! as ArticleViewController).imagesArray.indexOfObject(address!)
        previewController.currentPreviewItemIndex = index
        
        self.controller!.presentViewController(previewController, animated: true, completion: nil)
        // self.controller!.navigationController!.pushViewController(previewController, animated: true)
    }
}
