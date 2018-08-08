//
//  MessageThread.swift
//  ios-message-board
//
//  Created by Lambda-School-Loaner-11 on 8/8/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {
    static func == (lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.messages == rhs.messages
    }
    
    var title: String
    var identifier: String
    
    var messages: [MessageThread.Message] = []
    
    init(title: String, identifier: String) {
        self.title = title
        self.identifier = UUID().uuidString
    }
    
    struct Message: Equatable, Codable {
        let text: String
        let sender: String
        let timestamp: Date
        
        init(text: String, sender: String, timestamp: Date) {
            self.text = text
            self.sender = sender
            self.timestamp = Date()
        }
    }
}
