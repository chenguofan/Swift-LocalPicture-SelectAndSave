//
//  ViewController.swift
//  图片选择与保存Swift
//
//  Created by kouliang on 15/3/9.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func save() {
        let image = imageView.image
        // 保存到相册
        UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
    }
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject) {
        if error != nil {
            println("保存出错")
        } else {
            println("保存成功")
        }
    }
    
    
    @IBAction func select() {
        let imgPicker = UIImagePickerController()
        // 设置照片选择数据源
        imgPicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        
        // 设置照片选择器的代理
        imgPicker.delegate = self;
        
        presentViewController(imgPicker, animated: true) { () -> Void in
        }
    }
}

extension ViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        dismissViewControllerAnimated(true){ () -> Void in
        }
    }
}

