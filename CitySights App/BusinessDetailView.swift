//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by MacBook2014 on 4/9/24.
//

import SwiftUI

struct BusinessDetailView: View {
  
  @Environment(BusinessModel.self) var model
  
  var body: some View {
    
    let business = model.selectedBusiness
    
    VStack (spacing: 0) {
      
      ZStack (alignment: .trailing) {
        
        if let imageURL = business?.imageUrl {
          AsyncImage(url: URL(string: imageURL)!) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(height: 164)
              .clipped()

          } placeholder: {
            ProgressView()
              .frame(width: 150, height: 150)
          }

        }
        else {
          Image("detail-placeholder-image")
            .resizable()
        }
        
        VStack {
          
          Spacer()
          Image("yelp-attribution-image")
            .frame(width: 72, height: 36)
        }
      }
      .frame(height: 164)
      
      if let isClosed = business?.isClosed {
        
        ZStack (alignment: .leading) {
          
          Rectangle()
            .foregroundColor(isClosed ? .red : .green)
          
          Text(isClosed ? "Closed" : "Open")
            .bold()
            .foregroundColor(.white)
            .padding(.horizontal)
        }
        .frame(height: 36)
      }
      
      ScrollView {
        
        VStack (alignment: .leading, spacing: 0) {
          
          Text(business?.name ?? "business name")
            .font(Font.system(size: 21))
            .bold()
            .padding(.bottom, 10)
            .padding(.top, 16)
          
          Text("\(business?.location?.address1 ?? "address"), \(business?.location?.city ?? "city")")
          Text("\(business?.location?.state ?? "state") \(business?.location?.zipCode ?? "zip"), \(business?.location?.country ?? "country")")
            .padding(.bottom, 10)
          
          Image("regular_\(business?.rating ?? 5.0)")
            .padding(.bottom, 16)
          
          Divider()
          
          Text("description")
          
          Divider()
          
          HStack {
            
            Image(systemName: "phone")
            
            if let url = URL(string: "tel:\(business?.phone ?? "")") {
              
              Link(destination: url) {
                Text(business?.phone ?? "")
              }
            } else {
              Text(business?.phone ?? "")
            }
            
            Spacer()
            Image(systemName: "arrow.right")
              .foregroundColor(.blue)
          }
          .padding(.vertical, 12)
          
          Divider()
          
          HStack {
            Image(systemName: "network")
            
            if let url = URL(string: "\(business?.url ?? "")") {
              
              Link(destination: url) {
                Text(business?.url ?? "website")
                  .lineLimit(1)
              }
            } else {
              Text(business?.url ?? "website")
                .lineLimit(1)
            }
            
            Spacer()
            Image(systemName: "arrow.right")
              .foregroundColor(.blue)
          }
          .padding(.vertical, 12)
          
          Divider()
          
          HStack {
            Image(systemName: "bubble.left.and.bubble.right")
            Text("\(business?.reviewCount ?? 0) reviews")
          }
          .padding(.vertical, 12)
          
          Spacer()
          
          Button {
            print("pront")
          } label: {
            HStack {
              Image("paperplane.fill")
              Text("Get Directions")
            }
          }
          .foregroundColor(.white)
          Spacer()
        }
      }
      .padding(.horizontal)
    }
  }
}

#Preview {
  BusinessDetailView()
}
