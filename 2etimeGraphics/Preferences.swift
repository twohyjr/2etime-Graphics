import MetalKit

struct Preferences{
    
    static var useWireFrame: Bool = false
    static var clearColor: MTLClearColor = MTLClearColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    static var ambientIntensity: Float = 0.0
    static var diffuseIntensity: Float = 0.0
    static var specularIntensity: Float = 0.0
    
    static var shininess: Float = 0.0
    
    public static func setClearColor(color: NSColor){
        self.clearColor = MTLClearColor(red: Double(color.redComponent), green: Double(color.greenComponent), blue: Double(color.blueComponent), alpha: Double(color.alphaComponent))
    }
    
    public static func setAmbientIntensity(ambientIntensity: Float){
        self.ambientIntensity = ambientIntensity
    }
    
    public static func setDiffuseIntensity(diffuseIntensity: Float){
        self.diffuseIntensity = diffuseIntensity
    }
    
    public static func setSpecularIntensity(specularIntensity: Float){
        self.specularIntensity = specularIntensity
    }
    
    public static func setShininess(shininess: Float){
        self.shininess = shininess
    }
    
}
