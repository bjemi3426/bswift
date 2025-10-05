//
//  Persistence.swift
//  ProductsDemo
//
//  Created by Bjem on 10/3/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newProduct = Product(context: viewContext)
            newProduct.timestamp = Date()
        }
        
        // Also seed categories in preview mode
        let defaults = ["Snacks", "Drinks", "Dairy", "Frozen", "Household", "Personal Care"]
        for name in defaults {
            let cat = ProductCategory(context: viewContext)
            cat.name = name
        }
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ProductsDemo")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true

        // Seed defaults if categories are empty
        seedCategoriesIfNeeded(context: container.viewContext)
    }

    private func seedCategoriesIfNeeded(context: NSManagedObjectContext) {
        let request: NSFetchRequest<ProductCategory> = ProductCategory.fetchRequest()
        do {
            let count = try context.count(for: request)
            if count == 0 {
                let defaults = ["Snacks", "Drinks", "Dairy", "Frozen", "Household", "Personal Care", "Misc"]
                for name in defaults {
                    let category = ProductCategory(context: context)
                    category.name = name
                }
                try context.save()
            }
        } catch {
            print("Failed to seed default categories: \(error.localizedDescription)")
        }
    }
}

