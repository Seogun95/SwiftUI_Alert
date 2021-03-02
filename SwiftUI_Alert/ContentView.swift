//
//  ContentView.swift
//  SwiftUI_Alert
//
//  Created by 김선중 on 2021/03/02.
//

import SwiftUI

struct AlertId: Identifiable {
    
    var id: AlertType
    
    enum AlertType {
        case type1
        case type2
    }
}

struct ContentView: View {

    @State var alertId: AlertId?
    
    var body: some View {
        VStack {
            Button(action: {
                self.alertId = AlertId(id: .type1)
            }) {
                Text("Show alert!")
            }
            
            Button(action: {
                self.alertId = AlertId(id: .type2)
            }) {
                Text("Show alert!")
            }
        }.alert(item: $alertId) { (alertId) -> Alert in
            return createAlert(alertId: alertId)
        }
    }
    
    private func createAlert(alertId: AlertId) -> Alert {
        switch alertId.id {
        case .type1:
            return Alert(title: Text("Hello World!"))
        case .type2:
            return Alert(title: Text("Hello World2!"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
