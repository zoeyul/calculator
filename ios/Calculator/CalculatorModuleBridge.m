//
//  CalculatorModuleBridge.m
//  Calculator
//
//  Created by Seoyul Kim on 7/19/25.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(CalculatorModule, NSObject)

RCT_EXTERN_METHOD(
                  executeCalc: (NSString *) action
                  numberA: (int) numberA
                  numberB: (int) numberB
                  resolver:(RCTPromiseResolveBlock) resolve
                  rejector:(RCTPromiseRejectBlock) reject
                  )
@end

