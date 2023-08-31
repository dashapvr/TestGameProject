//
//  WebView.swift
//  TestGameProject
//
//  Created by Дарья Пивовар on 28.08.2023.
//

import UIKit
import WebKit
import SwiftUI

extension WebViewContainer {
    class Coordinator: NSObject, WKNavigationDelegate {
        @ObservedObject private var model: Model
        private let parent: WebViewContainer
        
        init(_ parent: WebViewContainer, _ model: Model) {
            self.parent = parent
            self.model = model
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            model.game.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            model.game.isLoading = false
            model.game.title = webView.title ?? ""
            model.game.canGoBack = webView.canGoBack
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            model.game.isLoading = false
        }
    }
}

struct WebViewContainer: UIViewRepresentable {
    @ObservedObject var model: Model
    
    func makeCoordinator() -> WebViewContainer.Coordinator {
        Coordinator(self, model)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.model.game.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if model.game.shouldGoBack {
            uiView.goBack()
            model.game.shouldGoBack = false
        }
    }
}

