//
//  CalculatorModule.swift
//  Calculator
//
//  Created by Seoyul Kim on 7/18/25.
//

import Foundation

@objc(CalculatorModule)
class CalculatorModule: NSObject, RCTBridgeModule {
  
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
