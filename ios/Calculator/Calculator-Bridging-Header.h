//
//  Calculator-Bridging-Header.h
//  Calculator
//
//  Created by Seoyul Kim on 7/18/25.
//

/*
swift-Objective-C 브릿징 헤더

Swift 코드(CalculatorModule.swift)에서 Objective-C/C 라이브러리를 사용할 수 있게해줌 
React Native의 Objective-C 헤더들을 Swift에서 사용할 수 있도록 연결
CalculatorModule.swift에서 RCTBridgeModule 프로토콜을 구현할 수 있게 해줌

React Native 타입들은 Objective-C로 정의되어 있기 때문에, Swift에서 사용하려면 브릿징 헤더를 통해 import해야 함
class CalculatorModule: NSObject, RCTBridgeModule {
    // RCTBridgeModule 프로토콜 사용
    // RCTPromiseResolveBlock, RCTPromiseRejectBlock 타입 사용
}

이 헤더 파일이 없으면 Swift 코드에서 React Native의 Objective-C API들을 사용할 수 없어서 네이티브 모듈을 만들 수 없고 Swift와 Objective-C 간의 필수적인 연결고리 역할을 함

xcode 프로젝트 설정에서 헤더 지정 필요
SWIFT_OBJC_BRIDGING_HEADER = "$(SRCROOT)/Calculator/Calculator-Bridging-Header.h"
*/

//RCTBridgeModule: Swift에서 React Native 모듈을 만들 때 필요한 프로토콜/클래스
//RCTLog: React Native 로깅 기능을 Swift에서 사용할 수 있게 함
#import <React/RCTBridgeModule.h>
#import <React/RCTLog.h>

#ifndef Calculator_Bridging_Header_h
#define Calculator_Bridging_Header_h


#endif /* Calculator_Bridging_Header_h */
