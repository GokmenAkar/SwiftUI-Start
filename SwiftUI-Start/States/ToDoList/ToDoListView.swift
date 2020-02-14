//
//  ToDoListView.swift
//  SwiftUI-Start
//
//  Created by Developer on 13.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ToDoListView: View {
    @State var tasks = [Task]()
    
    private func addTask() {
        self.tasks.append(Task(name: "Wash the car"))
        print("hehe")
    }
    private func deleteTask() {
        self.tasks.removeLast()
    }
    
    var body: some View {
        List {
            
            Button(action: addTask) {
                Text("Add Task")
            }
            Button(action: deleteTask) {
                Text("Delete Task")
            }.foregroundColor(.red)
            
            
            ForEach(tasks) {
                Text($0.name)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
