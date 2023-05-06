//
//  RMSettingsView.swift
//  RMApiApp
//
//  Created by Nam Pham on 06/05/2023.
//

import SwiftUI

struct RMSettingsView: View {
    let viewModel: RMSettingsViewVM
    
    init(viewModel: RMSettingsViewVM){
        self.viewModel  = viewModel
    }
    
    var body: some View {
        List(viewModel.cellViewModles){ viewModel in
            HStack{
                if let image = viewModel.image {
                    Image(uiImage: image )
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30,height: 30)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color(viewModel.iconContainerColor))
                        .cornerRadius(8)
                }
                Text(viewModel.title)
                    .padding(.leading,10)
            }
            .padding(.bottom,3)
        }
    }
}

struct RMSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RMSettingsView(viewModel: .init(cellViewModles: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewVM(type: $0)
        })))
    }
}
