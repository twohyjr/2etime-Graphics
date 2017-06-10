import MetalKit

class BasicScene: Scene{
    
    var speed: Float = 0.5
    
    var c: Cube!
    var wall: Plane!
    override init(device: MTLDevice){
        c = Cube(device: device, imageName: "smiley-face.png")
        wall = Plane(device: device, imageName: "stone.png")
        super.init(device: device)
        
        wall.position.z = -10
        wall.scale = float3(5)
        c.position.z = -3
        
        add(child: c)
        add(child: wall)
    }
    
    override func updateInput(deltaTime: Float){
        c.rotation.x += deltaTime
        c.rotation.y += deltaTime
        
//        let mousePosition = InputHandler.getMousePosition()
//        camera.rotation.y = mousePosition.x / 800
//        camera.rotation.x = mousePosition.y / 550
        
        //Model
//        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_W)){c2.position.y += speed}
//        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_S)){c2.position.y -= speed}
//        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_D)){c2.position.x += speed}
//        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_A)){c2.position.x -= speed}
//        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_1)){c2.position.z -= speed}
//        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_2)){c2.position.z += speed}
        
        //Camera
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Up)){camera.position.z += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Down)){camera.position.z -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Left)){camera.position.x -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Right)){camera.position.x += speed}
    }

}
