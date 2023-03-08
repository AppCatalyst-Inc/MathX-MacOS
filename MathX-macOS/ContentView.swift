//
//  ContentView.swift
//  MathX-macOS
//
//  Created by Tristan on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var quizStore = QuizStore()
    @State private var selectedQuiz: Quiz?
    
    @State var currentTab: String
    @State var textfieldFocus: FocusState<Bool>.Binding

    var body: some View {
        ZStack(alignment: .leading) {
            Color("BG") // sets background to dark gray colour
            
            HStack {
                VStack(alignment: .leading) {
                    Sidebar(currentTab: $currentTab)
                }
                
                // current view opened
                if currentTab == "person" {
                    QuizListView(quizzes: quizStore.quizzes) { quiz in
                        selectedQuiz = quiz
                    }
                } else if currentTab == "pencil.and.ruler" {
                    TeacherView(quizStore: quizStore)
                } else if currentTab == "gearshape" {
                    settingsView()
                } else if currentTab == "doc.text.image" {
                    //Notes
                } else if currentTab == "square.split.bottomrightquarter" {
                    SquaresView(textfieldFocus: textfieldFocus)
                } else {
                    HStack {
                        Spacer()
                        Text("A problem has occurred, Quit and Reopen the app.") // appears when @State var currentTab isnt any of the available tabs
                        Spacer()
                    }
                }
            }
        }
        .frame(minWidth: 1000, minHeight: 800) // sets min width and height constraints for app window
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("ContentView")
    }
}
