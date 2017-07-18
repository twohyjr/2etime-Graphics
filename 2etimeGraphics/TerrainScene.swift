import MetalKit

class TerrainScene: Scene{
    
    var speed: Float = 0.1
    var moveableObject: Terrain!
    override init(device: MTLDevice){
        moveableObject = Terrain(device: device, imageName: "Grass.jpg")
        super.init(device: device)
        
        camera.farZ = -1000
        
        self.rotation.x = 10
        
        camera.position.x = -(1000/2)
        camera.position.z = -(1000/2)
        camera.position.y = -4
        
        add(child: moveableObject)
    }
    
    override func updateModel() {
        
    }
    
    override func updateInput(deltaTime: Float){
        //Model
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_W)){moveableObject.position.y += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_S)){moveableObject.position.y -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_D)){moveableObject.position.x += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_A)){moveableObject.position.x -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_1)){moveableObject.position.z -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_2)){moveableObject.position.z += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_3)){moveableObject.rotation.y += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_4)){moveableObject.rotation.y -= speed}
        
        //Camera
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Up)){camera.position.z += speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Down)){camera.position.z -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Left)){camera.position.x -= speed}
        if(InputHandler.isKeyPressed(key: KEY_CODES.Key_Arrow_Right)){camera.position.x += speed}
    }
    
}

