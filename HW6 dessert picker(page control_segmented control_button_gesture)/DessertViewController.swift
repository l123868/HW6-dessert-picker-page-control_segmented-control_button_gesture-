//
//  DessertViewController.swift
//  HW6 dessert picker(page control_segmented control_button_gesture)
//
//  Created by Latifah on 2022/3/22.
//

import UIKit

class DessertViewController: UIViewController {

    @IBOutlet weak var dessertPicture: UIImageView!
    @IBOutlet weak var dessertName: UILabel!
    
    @IBOutlet weak var dessertSegmentControl: UISegmentedControl!
    @IBOutlet weak var dessertPageControl: UIPageControl!
    @IBOutlet weak var posLabel: UILabel!
    
    let dessertNames: [String] = ["banana", "blueberry", "strawberry"]
    var choose = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dessertSegmentControl.setTitle(dessertNames[0], forSegmentAt: 0)
        dessertSegmentControl.setTitle(dessertNames[1], forSegmentAt: 1)
        dessertSegmentControl.setTitle(dessertNames[2], forSegmentAt: 2)
        syncChoose()
    }
    
    @IBAction func toLeftDessert() {
        if choose > 0{
            choose -= 1
        }else{
            choose = 0
        }
        syncChoose()
    }
    @IBAction func toRightDessert() {
        if choose < 2{
            choose += 1
        }else{
            choose = 2
        }
        syncChoose()
    }

    
    @IBAction func changeChooseBySegmentControl(_ sender: UISegmentedControl) {
        choose = sender.selectedSegmentIndex
        syncChoose()
    }
    @IBAction func changeChooseByPageControl(_ sender: UIPageControl) {
        choose = sender.currentPage
        syncChoose()
    }
    @IBAction func swipePicture(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right{
            toRightDessert()
        }else if sender.direction == .left{
            toLeftDessert()
        }
        syncChoose()
    }
    func syncChoose(){
        dessertName.text = dessertNames[choose]
        dessertPageControl.currentPage = choose
        dessertSegmentControl.selectedSegmentIndex = choose
        dessertPicture.image =  UIImage(named: dessertNames[choose])
        posLabel.text = "\(choose+1)/3"
    }
}
