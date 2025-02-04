//
//  ContentView.swift
//  ApiApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var  netwrokmanager = NetworkManager()
    var body: some View{
    NavigationView{
        List(netwrokmanager.users){
            user in
            VStack(alignment: .leading)
            {
                Text(user.name).font(.headline)
                Text(user.email).font(.headline).foregroundColor(.yellow)
                Rectangle().frame(height:20).background(Color.pink)

            }
        }.navigationTitle("Users Data")
            .onAppear {netwrokmanager.fetchuser()}
        
        
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
