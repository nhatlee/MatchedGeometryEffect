//
//  ZoomableView.swift
//  Triangle
//
//  Created by nhatle on 7/27/20.
//

import SwiftUI

struct ZoomableView: View {
    @Namespace private var animation
        @State private var isZoomed = false

        var frame: CGFloat {
            isZoomed ? 300 : 44
        }

        var body: some View {
            VStack {
                Spacer()

                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: frame, height: frame)
                            .padding(.top, isZoomed ? 20 : 0)

                        if isZoomed == false {
                            Text("Taylor Swift – 1989")
                                .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                                .font(.headline)
                            Spacer()
                        }
                    }

                    if isZoomed == true {
                        Text("Taylor Swift – 1989")
                            .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                            .font(.headline)
                            .padding(.bottom, 60)
                        Spacer()
                    }
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.isZoomed.toggle()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: isZoomed ? 400 : 60)
                .background(Color(white: 0.9))
            }
        }
}
