//
//  ContentView.swift
//  ListAndSortByLocation
//
//  Created by Nikhil B Kuriakose on 20/06/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import CoreLocation

struct ContentView: View {
//    @ObservedObject var obs = Observer()
    @ObservedObject var locationManager = LocationManager()
//    var datas = [PickUpDataType]()
    var datas = mockData.filter { (data) -> Bool in
        data.active
    }
    
    var sortedData: [PickUpDataType] {
        if let userLocation = self.locationManager.lastLocation {
            print("hahah")
            for data in datas {
                if (data.location != nil) {
                    data.distance = userLocation.distance(from: data.location!)
                }
            }
            return self.datas.sorted { (data1, data2) -> Bool in
                data1.distance < data2.distance
            }
        }
        return datas
    }
    
    var body: some View {
        
        NavigationView{
            List(sortedData){ data in
                NavigationLink(destination: DetailScreen()) {
                    Card(data: data, userLocation: self.locationManager.lastLocation)
                }
            }
            .onAppear{UITableView.appearance().tableFooterView = UIView()}
            .navigationBarTitle("Delivery Listing")
            .foregroundColor(.green)
            .navigationBarItems(trailing:
                Button(action: {
                    self.locationManager.requestLocation()
                }) {
                    Image(systemName: "location.circle").imageScale(.large)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Observer: ObservableObject {
//    @Published var datas = [DataType]()
    
    // Implementation is test, will not work with current implementation. Need to reconfigure
    init() {
        AF.request("https://api.github.com/users/hadley/orgs").responseData { (data) in
//            let json = try! JSON(data: data.data!)
        }
    }
}

struct Card: View {
    var data: PickUpDataType!
    var userLocation: CLLocation?
    var distanceText: String {
        if (data.distance == 0) {
            return ""
        } else {return String(format: "%.1f Km", (data.distance/1000))}
    }

    var body: some View {
        HStack(alignment: .center){
            Image(systemName: "checkmark.circle.fill")
                .padding(.leading, 10.0)
            VStack(alignment: .leading){
                Text(data.company).fontWeight(.bold).lineLimit(1)
                Text(data.address).font(.subheadline).foregroundColor(.secondary).lineLimit(1).padding(.vertical, 5.0)
                Text(data.city).font(.subheadline).foregroundColor(.secondary).lineLimit(1)
            }.padding(.horizontal, 10.0)
            Spacer()
            Text(distanceText).font(.subheadline).foregroundColor(.secondary).multilineTextAlignment(.trailing).lineLimit(1)
        }
        .padding(.vertical, 10.0)
    }
}

// MARK:- DEBUG
struct ContetnView_Previews : PreviewProvider {

    static var previews: some View {
        ContentView(datas: mockData)
    }
}
