import MetalKit

struct Preferences{
    
    static var useWireFrame: Bool = false
    static var clearColor: MTLClearColor = MTLClearColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    public static func setClearColor(color: NSColor){
        clearColor = MTLClearColor(red: Double(color.redComponent), green: Double(color.greenComponent), blue: Double(color.blueComponent), alpha: Double(color.alphaComponent))
    }
    
}
