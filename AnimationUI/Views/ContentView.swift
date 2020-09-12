// https://github.com/m760622/AnimationUI
//  ContentView.swift
//  AnimationUI
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-09-12.
// https://github.com/m760622

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List (){
                Section(header: Text("Simple")
                            .font(.body)) {
                    Group {
                        NavigationLink(destination: TypsView()) {
                            Text("TypsView")
                        }
//                        NavigationLink(destination: TypsView()) {
//                            Text("TypsView")
//                        }
                    }//Group
                }//Section
                
                
                Section(header: Text("Complex")
                            .font(.body)) {
                    Group {
//                        NavigationLink(destination: TypsView()) {
//                            Text("TypsView")
//                        }
                    }//Group
                }//Section
            }//List
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Animations in SwiftUI") , displayMode: .inline)
        }//NavigationView
        
    }//body
}//ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
