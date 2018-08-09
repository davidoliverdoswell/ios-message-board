//
//  MessageThreadController.swift
//  ios-message-board
//
//  Created by Lambda-School-Loaner-11 on 8/8/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation

class MessageThreadController {
    
    private(set) var messageThreads: [MessageThread] = []
    
    static let baseURL = URL(string: "https://lambda-message-board.firebaseio.com/")!
    
    func createMessageThread(title: String, completion: @escaping (Error?) -> Void) {
        
        let messageThread = MessageThread(title: title, identifier: UUID().uuidString)
        
        let path = messageThread.identifier
        
        let url = MessageThreadController.baseURL
            .appendingPathComponent(path)
            .appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        do {
            request.httpBody = try JSONEncoder().encode(messageThread)
        } catch {
            NSLog("Error \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error: \(error)")
                completion(error)
                return
            }
            self.messageThreads.append(messageThread)
            completion(nil)
            
        }.resume()
    }
    
    func createMessage(with messageThread: MessageThread, text: String, sender: String, completion: @escaping (Error) -> Void) {
        
        let messageThreadMessage = MessageThread.Message(text: text, sender: sender, timestamp: Date())
        
        let url = MessageThreadController.baseURL
        .appendingPathExtension(messageThread.identifier)
        .appendingPathComponent("messages")
        .appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        do {
            request.httpBody = try JSONEncoder().encode(messageThreadMessage)
        } catch {
            NSLog("Error \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error: \(error)")
                completion(error)
                return
            }
            self.messageThreads.append(messageThread)
            completion(NSError())
            return
            
        }.resume()
        
    }
    
}
