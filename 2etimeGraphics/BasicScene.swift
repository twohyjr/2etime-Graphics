import MetalKit

class BasicScene: Scene{
    
    var speed: Float = 0.05
    
    var moveableObject: Instance!
    override init(device: MTLDevice){
        moveableObject = Instance(device: device, modelName: "armadillo", imageName: "", instanceCount: 40)
        super.init(device: device)
        
        for model in moveableObject.nodes{
            model.position.x = Float(arc4random_uniform(20))
            model.position.y = Float(arc4random_uniform(20))
        }
        
        
        add(child: moveableObject)
    }
    
    override func updateInput(deltaTime: Float){
        //moveableObject.rotation.x += deltaTime
//        moveableObject.rotation.y += deltaTime
        
//        let mousePosition = InputHandler.getMousePosition()
//        camera.rotation.y = mousePosition.x / 800
//        camera.rotation.x = mousePosition.y / 550
        
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
