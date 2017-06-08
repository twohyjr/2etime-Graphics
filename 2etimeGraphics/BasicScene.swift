import MetalKit

class BasicScene: Scene{
    
    var speed: Float = 0.5
    
    let c: Cube!
    let c2: Cube!
    override init(device: MTLDevice){
        c = Cube(device: device)
        c2 = Cube(device: device)
        
        super.init(device: device)
        
        c2.position.x = -3
        camera.position.z = -20
        add(child: c2)
        add(child: c)
    }
    
    override func updateInput(deltaTime: Float){
        c.rotation.x += deltaTime
        c.rotation.y += deltaTime
        
        let mousePosition = InputHandler.getMousePosition()
        camera.rotation.y = mousePosition.x / 800
        camera.rotation.x = mousePosition.y / 550
        
        //Model
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_W)){c2.position.y += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_S)){c2.position.y -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_D)){c2.position.x += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_A)){c2.position.x -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_1)){c2.position.z -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_2)){c2.position.z += speed}
        
        //Camera
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Up)){camera.position.z += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Down)){camera.position.z -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Left)){camera.position.x -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Right)){camera.position.x += speed}
    }

}
