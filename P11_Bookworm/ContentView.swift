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
	@FetchRequest(sortDescriptors: [
		SortDescriptor(\.title, order: .reverse)
	]) var books : FetchedResults<Book>
	
	struct lowRating: ViewModifier{
		var book: Book
		func body(content: Content) -> some View {
			
			if book.rating == 1{
				content
					.foregroundColor(.red)
			}else{
				content
			}
			
		}
	}
	
	
    var body: some View {
		 NavigationView{
			 List{
				 ForEach(books) { book in
					 NavigationLink{
						 DetailView(book: book)
					 } label: {
						 HStack {
							 EmojiRatingView(rating: book.rating)
								 .font(.largeTitle)
							 VStack(alignment: .leading) {
								 Text(book.title ?? "Unknown Title").font(.headline)
									 .modifier(lowRating(book: book))
								 Text(book.author ?? "Unknown Author").foregroundColor(.secondary)
							 }
						 }
					 }
				 }.onDelete(perform: deleteBooks)
			 }
			 .navigationTitle("Bookworm")
			 .toolbar {
				 ToolbarItem(placement: .navigationBarTrailing) {
					 Button {
						 showingAddScreen.toggle()
					 } label: {
						 Label("Add Book", systemImage: "plus")
					 }
				 }
				 ToolbarItem(placement: .navigationBarLeading) {
					 EditButton()
				 }
			 }
			 .sheet(isPresented: $showingAddScreen) {
				 AddBookView()
			 }
		 }
	 }
	
	func deleteBooks(at offsets: IndexSet) {
		for offset in offsets {
			//find this book in our fetch request
			let book = books[offset]
			//delete it from the context
			moc.delete(book)
		}
		try? moc.save()
	}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
