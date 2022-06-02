//
//  ContentView.swift
//  P11_Bookworm
//
//  Created by Jae Cho on 6/1/22.
//
import CoreData
import SwiftUI



struct ContentView: View {
	@State private var showingAddScreen = false
	
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: []) var books : FetchedResults<Book>
	
    var body: some View {
		 NavigationView{
			 Text("Count : \(books.count)")
				 .navigationTitle("Bookworm")
				 .toolbar {
					 ToolbarItem(placement: .navigationBarTrailing) {
						 Button {
							 showingAddScreen.toggle()
						 } label: {
							 Label("Add Book", systemImage: "plus")
						 }
					 }
				 }
				 .sheet(isPresented: $showingAddScreen) {
					 AddBookView()
				 }
		 }
	 }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
