//
//  CalculatorModuleBridge.m
//  Calculator
//
//  Created by Seoyul Kim on 7/19
//

/*
Swift와 React Native 간의 브릿지 역할

실제 계산 로직은 CalculatorModule.swift에 Swift로 구현되어 있음
React Native는 기본적으로 Objective-C 기반으로 동작하기 때문에, Swift 코드를 인식하려면 Objective-C 브릿지가 필요
*/

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>


//RCT_EXTERN_MODULE 매크로를 사용하여 Swift로 작성된 CalculatorModule을 React Native에 노출
@interface RCT_EXTERN_MODULE(CalculatorModule, NSObject)

//Swift 메서드를 JavaScript에서 호출할 수 있도록 인터페이스를 정의, 타입 안정성 보장 및 파라미터 정보 제공
RCT_EXTERN_METHOD(
                  executeCalc: (NSString *) action
                  numberA: (int) numberA
                  numberB: (int) numberB
                  resolver:(RCTPromiseResolveBlock) resolve
                  rejector:(RCTPromiseRejectBlock) reject
                  )
@end

