#version 150 core
	

	
in vec3 pos_VS;
in vec3 colour_VS;							//Colour of pixel - From buffer.
in vec3 normal_VS;


out vec3 colour_PS;							//Colour of pixel - Being sent to next stage.
out vec3 normal_PS;
out vec3 rawPos_PS;



uniform mat4 worldMatrix;
uniform mat4 viewMatrix;
uniform mat4 projMatrix;















void main()
{

	mat4 viewProjMatrix =  projMatrix * viewMatrix * worldMatrix;		//Probs should combine outside of shader
	gl_Position = ( viewProjMatrix * vec4(pos_VS.xyz, 1) );
    
    
	vec4 normal = inverse(transpose(viewMatrix* worldMatrix)) * vec4(normalize(normal_VS), 0);			//Also do normalMatrix outside of shader
	normal_PS = normalize(normal.xyz);
	
    rawPos_PS = pos_VS;
    colour_PS = colour_VS;   
}

