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
        guard let image = imageView.image else { return  }
        // 保存到相册
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImage(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc private func saveImage(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject) {
        if error != nil {
            print("保存出错")
        } else {
            print("保存成功")
        }
    }
    
    
    @IBAction func select() {
        let imgPicker = UIImagePickerController()
        // 设置照片选择数据源
        imgPicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        
        // 设置照片选择器的代理
        imgPicker.delegate = self;
        
        present(imgPicker, animated: true) { () -> Void in
        }
    }
}

extension ViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            print(info);
            dismiss(animated: true){ () -> Void in
        }
    }
}

