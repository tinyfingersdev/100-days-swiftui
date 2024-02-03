//
//  ContentView.swift
//  iExpense
//
//  Created by Shannon Paige on 1/29/24.
//

import SwiftUI


//Identifiable protocol - this item can be identified uniquely, requires a unique identifier within struct
//this lets you remove the id field in thing such as foreach loops
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading, content: {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        })
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(item.amount < 10.0 ? .green : item.amount >= 10.0 && item.amount < 100.0 ? .yellow : .red)
                        
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
