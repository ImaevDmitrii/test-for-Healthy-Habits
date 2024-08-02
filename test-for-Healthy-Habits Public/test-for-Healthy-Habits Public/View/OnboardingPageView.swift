//
//  OnboardingPageView.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import SwiftUI

struct OnboardingPageView: View {
    let title: String
    let options: [String]
    let selectionHandler: (String) -> Void
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding(.bottom, 20)
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectionHandler(option)
                }) {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                }
                .padding(.vertical, 5)
            }
        }
        .padding()
    }
}
struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            title: "Choose Category",
            options: ["Love", "Friendship"],
            selectionHandler: { _ in }
        )
        .background(Color(UIColor.softGray).edgesIgnoringSafeArea(.all))
    }
}
