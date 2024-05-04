#version 410 core

layout(location=0) in vec3 in_Position;
layout(location=1) in vec3 in_Normal;
layout(location=2) in vec2 in_TexCoord;

// input parameter
uniform float time;
uniform float parameter;
uniform int number;

uniform mat4 modelMat;
uniform mat4 viewMat;
uniform mat4 projMat;
out vec3 normal;
out vec3 worldPos;
out vec2 texCoord;

void main(void)
{
	normal = (modelMat * vec4(in_Normal ,0)).xyz;
	worldPos = (modelMat * vec4(in_Position,1)).xyz;
	texCoord = in_TexCoord;

	//in_Position 대신 사용할 Position. in_Position은 수정이 불가하기 때문.
	vec3 modifiedPos = in_Position;

	vec3 inPos1 = in_Position;

	vec3 inPos2 = in_Position;

	if(number == 1){
		inPos2 = (inPos2) / sqrt(pow(inPos2.x, 2) + pow(inPos2.y, 2) + pow(inPos2.z, 2));

		modifiedPos = mix(inPos1, inPos2, time);
	}
	else if(number == 2){
		inPos2 = (inPos2) / sqrt(pow(inPos2.x, 2) + pow(inPos2.y, 2) + pow(inPos2.z, 2));

		modifiedPos = mix(inPos1, inPos2, parameter);

	}


	gl_Position = projMat * viewMat * modelMat * vec4(modifiedPos, 1);



}

