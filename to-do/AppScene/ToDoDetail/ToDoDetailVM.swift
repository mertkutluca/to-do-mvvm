//
//  ToDoDetailVM.swift
//  to-do
//
//  Created by mert.kutluca on 4.03.2021.
//

import Foundation

final class ToDoDetailVM: ToDoDetailVMProtocol {
    
    weak var delegate: ToDoDetailVMOutputDelegate?
    
    private var item: ToDoDetailPresentation?
    
    private let toDo: ToDoDTO?
    
    private let repository: ToDoRepository = ToDoRepository(manager: app.databaseManager)
    
    init(toDo: ToDoDTO?) {
        self.toDo = toDo
    }
    
    func load() {
        guard let toDo = toDo else {
            item = ToDoDetailPresentation.empty
            return
        }
        
        item = ToDoDetailPresentation(title: toDo.title,
                                      detail: toDo.detail,
                                      dueDate: toDo.dueDate,
                                      state: toDo.state,
                                      isNewTodo: false)
    }
    
    func delete(_ completion: (Bool) -> Void) {
        guard let _id = toDo?._id else {
            completion(false)
            return
        }
        repository.remove(_id: _id)
        completion(true)
    }
    
    func save(title: String, detail: String, dueDate: Date, state: ToDoState, completion: (Bool) -> Void) {
        // Will be changed
        let dto = ToDoDTO(_id: toDo?._id ?? UUID().uuidString,
                          title: title,
                          detail: detail,
                          dueDate: dueDate,
                          state: state)
        repository.save(dto: dto)
        completion(true)
    }
    
    func getTitle() -> String {
        return forcedItem.title
    }
    
    func getDetail() -> String {
        return forcedItem.detail
    }
    
    func getDueDate() -> Date {
        return forcedItem.dueDate
    }
    
    func getState() -> ToDoState {
        return forcedItem.state
    }
    
    func isNewToDo() -> Bool {
        return forcedItem.isNewTodo
    }
    
    // MARK: Helpers
    private lazy var forcedItem: ToDoDetailPresentation = {
        guard let item = item else {
            fatalError("Presentation can not be loaded properly")
        }
        return item
    }()
    
}
