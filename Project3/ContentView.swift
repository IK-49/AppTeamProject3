import SwiftUI
import Playgrounds

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage(title: "List", items: [], color: .blue)
    
    var body: some View {
        VStack {
            // TODO: Add header view
            HStack {
                Text(page.title).foregroundStyle(page.color).font(.largeTitle).bold()
                Spacer()
                Button {
                    //TODO: info button
                    isEditing = true;
                } label:  {
                    Image(systemName: "info.circle").font(.title)
                }
            }.padding(16).foregroundStyle(page.color)
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    HStack {
                        Button {
                            reminder.isCompleted.toggle()
                        } label: {
                            (Image(systemName: reminder.isCompleted  ? "circle.fill" : "circle"
                                  ))
                        }
                        TextField("New Reminder", text: $reminder.title)
                    }.foregroundStyle(page.color)
                    // TODO: Display each reminder row
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            // TODO: Add footer view
            HStack {
                Spacer()
                Button {
                    //TODO: add reminder button
                    page.items.append(Reminder(title: "New Reminder"))
                } label: {
                    Image(systemName: "plus.circle.fill")
                }.padding(16).font(.largeTitle)
            }.foregroundStyle(page.color)
        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(selectedColor: $page.color, title: $page.title)
        }
    }
}
#Preview {
    ContentView()
}
