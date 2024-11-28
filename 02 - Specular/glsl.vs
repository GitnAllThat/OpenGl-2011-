	#version 150 core

in vec3 pos_VS;
in vec3 colour_VS;							//Colour of pixel - From buffer.
in vec3 normal_VS;
in vec2 tcoord_VS;



out vec3 colour_GS;							//Colour of pixel - Being sent to next stage.
out vec3 normal_GS;
out vec2 tcoord_GS;
out vec3 rawPos_GS;



uniform vec3 centre;



uniform mat4 worldMatrix;
uniform mat4 viewMatrix;
uniform mat4 projMatrix;


















void main()
{
//do it all without homogenous co-ords


	mat4 viewProjMatrix =  projMatrix * viewMatrix * worldMatrix;		//Probs should combine outside of shader
	gl_Position = ( viewProjMatrix * vec4(pos_VS.xyz, 1) );
    
    
	vec4 normal = inverse(transpose(viewMatrix* worldMatrix)) * vec4(normalize(normal_VS), 0);			//Also do normalMatrix outside of shader
	normal_GS = normalize(normal.xyz);
	
    rawPos_GS = pos_VS;
    colour_GS = colour_VS;   
	

   

		
	tcoord_GS = tcoord_VS;

}
