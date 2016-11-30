//
//  routing.swift
//  PerfectPress
//
//  Created by Ryan Collins on 6/9/16.
//  Copyright (C) 2016 Ryan M. Collins.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the PerfectPress open source blog project
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectHTTP

func makeRoutes() -> Routes {

    var routes = Routes()

    routes.add(method: .get, uris: ["/"], handler: HelloHandler)

    return routes
}

func HelloHandler(request: HTTPRequest, _ response: HTTPResponse) {

    response.setBody(string: "Hello World.")
    /*
    do {
        // response.setHeader(.contentType, value: "application/json; charset=utf-8")
        try response.setBody(string: "Hello World.")
    } catch {
        response.appendBody(string: "JSON Failed")
    }
    */
    response.completed()
}
