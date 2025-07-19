//
//  CalculatorModule.swift
//  Calculator
//
//  Created by Seoyul Kim on 7/18/25.
//

import Foundation

/*
@objc는 Swift 코드의 클래스, 함수, 프로퍼티 등을 Objective-C 런타임에 노출
@objc(CalculatorModule)은 Swift의 CalculatorModule 클래스를 Objective-C에서는 CalculatorModule이라는 이름으로 사용 가능
React Native의 RCTBridgeModule이 Objective-C 기반이기 때문에 반드시 필요

React Native의 RCTBridgeModule은 Objective-C 프로토콜로 Swift에서 Objective-C 프로토콜을 채택하려면 반드시 class여야 함
대부분의 Apple 플랫폼 프레임워크(API)는 NSObject 기반으로 이걸 상속하려면 class만 가능함
모듈 객체가 전역으로 공유되거나, 상태(state)를 유지해야 하는 경우 struct 대신 class를 사용해야 함

React Native 모듈 개발, UIKit 상속 뷰/컨트롤러, 상태 공유 매니저 구현시 class 사용
순수 데이터 모델, SwiftUI View 사용시 struct 사용

모듈 개발처럼 Objective-C 런타임과 호환되는 상황에서는 반드시 class를 써야 하고, 그 외 일반 앱 로직에서는 struct가 기본값
*/


/*
NSObject 상속시

Objective-C 호환  : `@objc` 없이도 자동으로 런타임 메타데이터 제공     
`isEqual`, `hash`, `description` 등 : 디폴트 구현 제공 (비교, 설명 등)  
`Selector`, KVC (Key-Value Coding), KVO: 동적 속성 접근, 옵저빙 
`NSObjectProtocol` 자동 채택 : `responds(to:)`, `perform(_:)` 같은 메서드 사용 가능 
React Native, UIKit 등 프레임워크에서 요구 : `RCTBridgeModule`, `UIViewController`, `Timer`, `NotificationCenter` 등이 `NSObject` 기반
*/

@objc(CalculatorModule)
class CalculatorModule: NSObject, RCTBridgeModule {
  //static은 타입에 귀속된 속성이나 함수를 정의할 때 사용하며, 인스턴스를 만들지 않고도 접근 가능한 메서드나 프로퍼티
  //React Native는 Objective-C 런타임을 통해 이 클래스 메서드(static) 를 호출해서 모듈 이름을 가져옴
  //인스턴스 생성 전에 모듈 이름을 알아야 하므로 static으로 선언
  static func moduleName() -> String! {
    return "CalculatorModule"
  }

  static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  @objc(executeCalc:numberA:numberB:resolver:rejector:)
  public func executeCalc(_ action:String,numberA:Int, numberB:Int, resolver:RCTPromiseResolveBlock, rejector: RCTPromiseRejectBlock)->Void {
    
    if(action == "plus"){
      resolver(numberA + numberB);
      return;
    }
    
    if(action == "minus"){
      resolver(numberA - numberB);
      return;
    }
    
    if(action == "multiply"){
      resolver(numberA * numberB);
      return;
    }
    
    if(action == "divide"){
      resolver(numberA / numberB);
      return;
    }
    
    rejector("Unexpected action type", action, nil)
  }
  
}
