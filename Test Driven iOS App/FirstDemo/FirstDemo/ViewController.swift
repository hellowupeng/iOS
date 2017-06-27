//
//  ViewController.swift
//  FirstDemo
//
//  Created by Andy Wu on 6/25/17.
//  Copyright © 2017 Andy Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
 func numberOfVowelsInString(_ string: String) -> Int {
		let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
	return string.characters.reduce(0, { $0 + (vowels.contains($1) ? 1 : 0) })
	}
	
}

