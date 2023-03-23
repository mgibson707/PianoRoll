//
//  Util.swift
//  
//
//  Created by Matt on 3/21/23.
//

import Foundation

///Extension of Comparable similar to `ClosedRange.clamped(to:_) -> ClosedRange` from standard Swift library.
extension Comparable {
    
    ///Returns a Comparable type that is limited to the range provided.
    /// Usage:
    ///- `15.clamped(to: 0...10)`  returns 10.
    ///- `3.0.clamped(to: 0.0...10.0)`  returns 3.0.
    ///- `"a".clamped(to: "g"..."y")` returns "g".
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
