//
//  ContentView.swift
//  P11_Bookworm
//
//  Created by Jae Cho on 6/1/22.
//
import CoreData
import SwiftUI



struct ContentView: View {
	
	@State private var rememberMe = false
	
	@FetchRequest(sortDescriptors: []) var students : FetchedResults<Student>
	@Environment(\.managedObjectContext) var moc
	
    var body: some View {
		 VStack{
			 List(students) { student in
				 Text(student.name ?? "Unknown")
			 }
			 Button("ADD"){
				 let firstNames = ["Ginny","Harry","Hermione","Luna","Ron"]
				 let lastNames = ["Granger","Lovegood","Potter","Weasley"]
				 
				 let chosenFirstName = firstNames.randomElement()!
				 let chosenLastName = lastNames.randomElement()!
				 
				 let student = Student(context: moc)
				 student.id = UUID()
				 student.name = "\(chosenFirstName) \(chosenLastName)"
				 try? moc.save()
			 }
			 
		 }
	 }
}

struct PushButton: View {
	let title: String
	@Binding var isOn: Bool
	
	var onColors = [Color.red,Color.yellow]
	var offColors = [Color(white: 0.6), Color(white: 0.4)]
	
	var body: some View {
		Button(title) {
			isOn.toggle()
		}
		.padding()
		.background(LinearGradient(gradient: Gradient(colors: isOn ? onColors: offColors), startPoint: .top, endPoint: .bottom))
		.foregroundColor(.white)
		.clipShape(Capsule())
		.shadow(radius: isOn ? 0 : 5)
	}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			 .environment(\.managedObjectContext, DataController().container.viewContext)
    }
}
