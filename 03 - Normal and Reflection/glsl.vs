	#version 150 core

in vec3 pos_VS;

in vec3 normal_VS;
in vec3 tangent_VS;
in vec3 binormal_VS;
in vec2 tcoord_VS;



out vec3 normal_GS;
out vec2 tcoord_GS;
out vec3 rawPos_GS;
out vec3 rawNormal_GS;
out vec3 rawTangent_GS;
out vec3 rawBinormal_GS;


uniform vec3 centre;



uniform mat4 worldMatrix;
uniform mat4 viewMatrix;
uniform mat4 projMatrix;







uniform int drawingSkybox;










void main()
{



	mat4 viewProjMatrix =  projMatrix * viewMatrix * worldMatrix;		//Probs should combine outside of shader
	gl_Position = ( viewProjMatrix * vec4(pos_VS.xyz, 1) );
    
    
	vec4 normal = inverse(transpose(viewMatrix* worldMatrix)) * vec4(normalize(normal_VS), 0);			//Also do normalMatrix outside of shader
	normal_GS = normalize(normal.xyz);
	
    rawPos_GS = pos_VS;
	rawNormal_GS = normal_VS;
	
	rawTangent_GS = tangent_VS;
	rawBinormal_GS = binormal_VS;
	
	

		
	tcoord_GS = tcoord_VS;

}
