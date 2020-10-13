//
//  ContentView.swift
//  Spike Project That Integrates a Themed ResearchKit With SwiftUI
//
//  Created by Joe Chrysler on 10/12/20.
//

import SwiftUI
import ResearchKit

struct ContentView: View {
    @State private var showingResearchKit = false
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Button("Show ResearchKit") {
                self.showingResearchKit = true
            }
        }
        .fullScreenCover(isPresented: $showingResearchKit, content: {
            ResearchView()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ResearchView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let myStep = ORKInstructionStep(identifier: "intro")
        myStep.title = "Hello"
        myStep.detailText = "World"
        let task = ORKOrderedTask(identifier: "task", steps: [myStep])
        return ORKTaskViewController(task: task, taskRun: nil)
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
    }
   
    typealias UIViewControllerType = ORKTaskViewController
}

