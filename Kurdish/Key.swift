//
//  Key.swift
//  KurdishTap
//
//  Created by Sallar Kaboli on 04/03/2017.
//  Copyright © 2017 Sallar Kaboli. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class RowManager: ASDisplayNode {
    var rows: [Row]!
    
    init(rows: [Row]) {
        super.init()
        self.rows = rows
    
        for row in rows {
            addSubnode(row)
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .stretch, children: rows)
        let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), child: stack)
        return inset
    }
}

class Row: ASDisplayNode {
    var keys: [Key]!
    
     init(keys: [Key]!) {
        super.init()
        self.style.flexShrink = 1
        self.style.flexGrow = 1
        self.keys = keys

        for key in keys {
            addSubnode(key)
        }
     }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(direction: .horizontal, spacing: 5, justifyContent: .center, alignItems: .stretch, children: keys)
        return stack
    }
}

protocol KeyDelegate: class {
    func keyInsert(toInsert: String)
}

class Key: ASDisplayNode {
    
    enum Actions {
        case write
        case delete
        case view
    }
    
    let button = ASButtonNode()
    let defaultColor = UIColor.white
    var value = ""
    weak var delegate:KeyDelegate?

    init(title: String, action: String, value: String) {
        super.init()
        
        self.value = value
        self.style.flexShrink = 1
        self.style.flexGrow = 1
        
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor(red:0.54, green:0.55, blue:0.56, alpha:1.00).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 0
        button.layer.masksToBounds = false
        button.backgroundColor = defaultColor
        
        button.setTitle(title, with: UIFont.boldSystemFont(ofSize: 12), with: UIColor.black, for: [])
        button.addTarget(self, action: #selector(Key.tap), forControlEvents: [.touchDownRepeat, .touchDown])
        button.addTarget(self, action: #selector(Key.clear), forControlEvents: [.touchUpInside, .touchCancel])
        
        addSubnode(button)
    }
    
    func tap() {
        button.backgroundColor = UIColor.brown
        // (self.view.next?.next?.next?.next as! KeyboardViewController).insertText(text: self.value)
        self.delegate?.keyInsert(toInsert: self.value)
    }
    
    func clear() {
        button.backgroundColor = defaultColor
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: button)
        return layoutSpec
    }
}


