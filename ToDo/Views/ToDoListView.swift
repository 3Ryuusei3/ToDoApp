//
//  ToDoItemsView.swift
//  ToDo
//
//  Created by Manuel Atance on 30/9/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init (userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todo"
        )
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(Color.red)
                        }
                        .padding(.vertical, 8.0)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "Arm4sBOB9aUgsU5qYCIVK9ouwW32")
}
