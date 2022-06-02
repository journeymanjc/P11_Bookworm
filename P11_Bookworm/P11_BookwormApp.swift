//
//  P11_BookwormApp.swift
//  P11_Bookworm
//
//  Created by Jae Cho on 6/1/22.
//

import SwiftUI

@main
struct P11_BookwormApp: App {
	//Adding the datacontroller instance here to be accessible to all views
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
			  //Placing data controller in the SwiftUI ENV.
				  .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
