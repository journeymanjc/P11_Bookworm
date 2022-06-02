//
//  DataController.swift
//  P11_Bookworm
//
//  Created by Jae Cho on 6/2/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "Bookworm")
	
	init(){
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core data failed to load: \(error.localizedDescription)")
			}
		}
	}
}
