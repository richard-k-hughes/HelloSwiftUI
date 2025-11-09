//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Richard Krishna Hughes on 11/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showMessage = false
    
    var body: some View {
        ZStack {
            // Background gradient with blue and green colors
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue.opacity(0.6),
                    Color.cyan.opacity(0.4),
                    Color.green.opacity(0.5)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            if !showMessage {
                // Initial state with button
                VStack(spacing: 20) {
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                            showMessage = true
                        }
                    }) {
                        Text("What to tell the world today?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 20)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.green]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                }
            } else {
                // Revealed state with world imagery and message
                ZStack {
                    // Center content
                    VStack(spacing: 30) {
                        // World imagery with multiple layers
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.blue.opacity(0.3),
                                            Color.green.opacity(0.3)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 200, height: 200)
                                .blur(radius: 20)
                            
                            Image(systemName: "globe.americas.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.blue,
                                            Color.cyan,
                                            Color.green
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .shadow(color: .blue.opacity(0.5), radius: 20, x: 0, y: 10)
                        }
                        .scaleEffect(showMessage ? 1.0 : 0.5)
                        .opacity(showMessage ? 1.0 : 0)
                        
                        // Hello world message
                        Text("Hello, world!")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white.opacity(0.9)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                            .scaleEffect(showMessage ? 1.0 : 0.5)
                            .opacity(showMessage ? 1.0 : 0)
                        
                        // Decorative elements
                        HStack(spacing: 15) {
                            Image(systemName: "sparkles")
                            Image(systemName: "heart.fill")
                            Image(systemName: "sparkles")
                        }
                        .font(.title2)
                        .foregroundColor(.yellow.opacity(0.8))
                        .scaleEffect(showMessage ? 1.0 : 0.5)
                        .opacity(showMessage ? 1.0 : 0)
                    }
                    
                    // Back button positioned at top left of screen
                    VStack {
                        HStack {
                            Button(action: {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                                    showMessage = false
                                }
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                    Text("Back")
                                }
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 25)
                                .padding(.vertical, 12)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.green, Color.blue]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(10)
                                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                            }
                            .scaleEffect(showMessage ? 1.0 : 0.5)
                            .opacity(showMessage ? 1.0 : 0)
                            
                            Spacer()
                        }
                        .padding(.leading, 20)
                        .padding(.top, 60)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
