//
//  Key.swift
//  KurdishTap
//
//  Created by Sallar Kaboli on 04/03/2017.
//  Copyright © 2017 Sallar Kaboli. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class Key: ASDisplayNode {
    let button = ASButtonNode()
    
    override init() {
        super.init()
        addSubnode(button)
        
        button.setTitle("potato", with: UIFont.boldSystemFont(ofSize: 12), with: UIColor.red, for: .selected)
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: button)
        return layoutSpec
    }
}


class Row: ASDisplayNode {
    
    // init(buttons: ) {
        
    // }
}
