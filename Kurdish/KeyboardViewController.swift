//
//  KeyboardViewController.swift
//  Kurdish
//
//  Created by Sallar Kaboli on 04/03/2017.
//  Copyright © 2017 Sallar Kaboli. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    var rowNode: RowManager!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let allRows = [
            [
                [
                    "title": "چ",
                    "action": "write",
                    "value": "چ"
                ],
                [
                    "title": "ص",
                    "action": "write",
                    "value": "ص"
                ],
                [
                    "title": "پ",
                    "action": "write",
                    "value": "پ"
                ],
                [
                    "title": "ق",
                    "action": "write",
                    "value": "ق"
                ],
                [
                    "title": "ف",
                    "action": "write",
                    "value": "ف"
                ],
                [
                    "title": "غ",
                    "action": "write",
                    "value": "غ"
                ],
                [
                    "title": "ع",
                    "action": "write",
                    "value": "ع"
                ],
                [
                    "title": "ﮪ",
                    "action": "write",
                    "value": "ﮪ"
                ],
                [
                    "title": "خ",
                    "action": "write",
                    "value": "خ"
                ],
                [
                    "title": "ح",
                    "action": "write",
                    "value": "ح"
                ]
            ],
            [
                [
                    "title": "ش",
                    "action": "write",
                    "value": "ش"
                ],
                [
                    "title": "س",
                    "action": "write",
                    "value": "س"
                ],
                [
                    "title": "ی",
                    "action": "write",
                    "value": "ی"
                ],
                [
                    "title": "ب",
                    "action": "write",
                    "value": "ب"
                ],
                [
                    "title": "ل",
                    "action": "write",
                    "value": "ل"
                ],
                [
                    "title": "ا",
                    "action": "write",
                    "value": "ا"
                ],
                [
                    "title": "ت",
                    "action": "write",
                    "value": "ت"
                ],
                [
                    "title": "ن",
                    "action": "write",
                    "value": "ن"
                ],
                [
                    "title": "م",
                    "action": "write",
                    "value": "م"
                ]
            ],
            [
                [
                    "title": "🔝",
                    "action": "write",
                    "value": ""
                ],
                [
                    "title": "ئ",
                    "action": "write",
                    "value": "ئ"
                ],
                [
                    "title": "د",
                    "action": "write",
                    "value": "د"
                ],
                [
                    "title": "ﯙ",
                    "action": "write",
                    "value": "ﯙ"
                ],
                [
                    "title": "ر",
                    "action": "write",
                    "value": "ر"
                ],
                [
                    "title": "ز",
                    "action": "write",
                    "value": "ز"
                ],
                [
                    "title": "ژ",
                    "action": "write",
                    "value": "ژ"
                ],
                [
                    "title": "ه",
                    "action": "write",
                    "value": "ه"
                ],
                [
                    "title": "🔙",
                    "action": "write",
                    "value": ""
                ]
            ],
            [
                [
                    "title": "🔢",
                    "action": "write",
                    "value": ""
                ],
                [
                    "title": "🌎",
                    "action": "write",
                    "value": ""
                ],
                [
                    "title": "   بﯙشایی   ",
                    "action": "write",
                    "value": " "
                ],
                [
                    "title": "↙️",
                    "action": "write",
                    "value": ""
                ]
            ]
        ]
        
        let rows = allRows.map { (row) -> Row in
            return Row(keys: row.map({ (key) -> Key in
                return Key(title: key["title"]!, action: key["action"]!, value: key["value"]!)
            }))
        }

        
        let rowNode = RowManager(rows: rows)
        rowNode.frame = CGRect(x: 0, y: 0, width: 414, height: 226)

        self.view.addSubnode(rowNode)
                
    }
    
    func insertText(text: String) {
        self.textDocumentProxy.insertText(text)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self.view.frame.size)
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.

    }
    
}
