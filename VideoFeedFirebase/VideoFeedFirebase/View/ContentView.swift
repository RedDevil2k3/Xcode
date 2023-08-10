//
//  ContentView.swift
//  VideoFeedFirebase
//
//  Created by Abhimanyu Joshi on 7/31/23.
//

import SwiftUI
import PhotosUI
import AVKit
import UIKit
import WebKit

class ProperPlayer: UIViewController {
    
    struct ContentView: View {
        
        @StateObject var viewModel = ConetentViewModel()
        
        var body: some View {
            NavigationStack {
                ScrollView {
                    ForEach(viewModel.videos) { video in
                        VideoPlayer(player: AVPlayer(url: URL(string: video.videoUrl)!))
                            .frame(height: 250)
                    }
                }
                .refreshable {
                    Task { try await viewModel.fetchVideos() } //pull down to refresh option
                }
                .navigationTitle("Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        PhotosPicker(selection: $viewModel.selectedItem , matching: .any(of: [.videos, .not(.images)])) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        configureConstraints()
    }
        
    func configureConstraints() {
        
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300),
        ]
        NSLayoutConstraint.activate(webViewConstraints)
    }
        
    func configure() {
        
        guard let url = URL(string: "https://firebasestorage.googleapis.com:443/v0/b/videofeediosapp.appspot.com/o/videos%2FCDB77ACF-EC94-4D5E-90FF-5B0F8E09821A?alt=media&token=704ba9f6-8afb-4c5a-9ddd-84f5ce009636") else {
            return
        }
        webView.load(URLRequest(url: url))
        
    }
        
    
}
