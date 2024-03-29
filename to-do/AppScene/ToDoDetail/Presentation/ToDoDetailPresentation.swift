//
//  ToDoDetailPresentation.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import Foundation

struct ToDoDetailPresentation: Equatable {
    let title: String
    let detail: String
    let dueDate: Date
    let state: ToDoState
    let isNewTodo: Bool
    
    static let empty = ToDoDetailPresentation(title: "",
                                              detail: "",
                                              dueDate: Date(),
                                              state: .active,
                                              isNewTodo: true)
    
    static func ==(lhs: ToDoDetailPresentation, rhs: ToDoDetailPresentation) -> Bool {
        return
            lhs.title == rhs.title &&
            lhs.detail == rhs.detail &&
            lhs.dueDate == rhs.dueDate &&
            lhs.state == rhs.state &&
            lhs.isNewTodo == rhs.isNewTodo
    }
}
