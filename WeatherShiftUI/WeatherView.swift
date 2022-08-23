//
//  WeatherView.swift
//  WeatherShiftUI
//
//  Created by Алексей Логинов on 24.08.2022.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack{
            Text("Сегодня первое марта")
                .layoutPriority(1)
            WeatherCell()
            Text("Великолепнейшая погода 25 градусов Цельсия, солнечно, осадков не ожидается")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }.lineLimit(2)
}
}
struct WeatherCell: View {
    var body: some View{
        Image("sun")
            .resizable()
            .frame(width: 100, height: 100)
           
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

