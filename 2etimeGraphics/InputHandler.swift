import MetalKit

enum KEY_CODES: Int {
    case Key_W = 13
    case Key_S = 1
    case Key_A = 0
    case Key_D = 2
    case Key_1 = 18
    case Key_2 = 19
    case Key_3 = 20
    case Key_4 = 21
    
    case Key_Arrow_Up = 126
    case Key_Arrow_Down = 125
    case Key_Arrow_Left = 123
    case Key_Arrow_Right = 124
}

class InputHandler{
    
    private static var KEY_COUNT = 256
    
    private static var keyList = [Bool].init(repeating: false, count: KEY_COUNT)
    
    private static var mousePosition = float2(0)
    
    public static func setMousePosition(position: float2){
        self.mousePosition = position
    }
    
    public static func setKeyPressed(key: UInt16, isOn: Bool){
        keyList[Int(key)] = isOn
    }
    
    public static func getMousePosition()->float2{
        return mousePosition
    }
    
    public static func isKeyPressed(key: KEY_CODES)->Bool{
        return keyList[Int(key.rawValue)] == true
    }
    
}
