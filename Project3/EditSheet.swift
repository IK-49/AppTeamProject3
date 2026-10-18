//
//  EditSheet.swift
//  Project3
//
//  Created by ikhokhar on 10/18/26.
//
import SwiftUI
import Playgrounds

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var selectedColor: Color
    @Binding var title: String
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            VStack {
                Image(systemName: "list.bullet.circle.fill").font(.system(size: 96))
            
                TextField("List Name", text: $title).padding(.top, 10).padding(.horizontal, 16).background(Color(.systemGray5), in: RoundedRectangle(cornerRadius: 16))
            }.padding(16).background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 16))
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State  var selectedColor: Color = .red
    @Previewable @State var title: String = "Title"
    
    EditSheet(selectedColor: $selectedColor, title: $title)
        .preferredColorScheme(.dark)
}
