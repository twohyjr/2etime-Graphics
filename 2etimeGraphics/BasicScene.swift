import MetalKit

class BasicScene: Scene{
    
    var speed: Float = 0.05
    
    var moveableObject: Model!
    override init(device: MTLDevice){
        moveableObject = Model(device: device, modelName: "sun", imageName: "")
        super.init(device: device)
        
        moveableObject.position.z = -4
        moveableObject.position.y = -0.5
        
        moveableObject.materialColor = float4(0.6, 0.6, 0.6, 1.0)
        
        
        light.color = float3(1)
        light.direction = float3(0,-1,-1)
        light.diffuseIntensity = 0.8
        
        add(child: moveableObject)
    }
    
    override func updateModel() {
        moveableObject.shininess = Preferences.shininess
        moveableObject.specularIntensity = Preferences.specularIntensity
        
    }
    
    override func updateInput(deltaTime: Float){
        //moveableObject.rotation.x += deltaTime
        moveableObject.rotation.y += deltaTime
        
        
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
