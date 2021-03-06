//
//  AddBookView.swift
//  P11_Bookworm
//
//  Created by Jae Cho on 6/2/22.
//

import SwiftUI

struct AddBookView: View {
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss
	
	@State private var title = ""
	@State private var author = ""
	@State private var rating = 3
	@State private var genre = "None"
	@State private var review = ""
	var disableForm: Bool{
		title == "" || author == ""
	}
	let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller","None"]
	
    var body: some View {
		 NavigationView{
			 Form{
				 Section{
					 TextField("Name of Book", text: $title)
					 TextField("Author's name", text: $author)
					 
					 Picker("Genre", selection: $genre){
						 ForEach(genres, id: \.self) {
							 Text($0)
						 }
					 }
				 }
				 Section {
					 TextEditor(text: $review)
					 RatingView(rating: $rating)
				 } header: {
					 Text("Write a review")
				 }
				 
				 Section{
					 Button("Save") {
						 //Saving to Core Data
						 let newBook = Book(context: moc)
						 newBook.id = UUID()
						 newBook.title = title
						 newBook.author = author
						 newBook.rating = Int16(rating)
						 newBook.genre = genre
						 newBook.review = review
						 newBook.date = Date.now
						 try? moc.save()
						 dismiss()
					 }
				 }
				 .disabled(disableForm)
			 }
			 .navigationTitle("Add Book")
			 
		 }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
