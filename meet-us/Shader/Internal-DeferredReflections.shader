//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DeferredReflections" {
Properties {
 _SrcBlend ("", Float) = 1
 _DstBlend ("", Float) = 1
}
SubShader { 
 Pass {
  ZWrite Off
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 34194
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp float _LightAsQuad;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec3 tmpvar_2;
  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  tmpvar_2 = ((glstate_matrix_modelview0 * _glesVertex).xyz * vec3(-1.0, -1.0, 1.0));
  highp vec3 tmpvar_6;
  tmpvar_6 = mix (tmpvar_2, _glesNormal, vec3(_LightAsQuad));
  tmpvar_2 = tmpvar_6;
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = o_3;
  xlv_TEXCOORD1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform lowp samplerCube unity_SpecCube0;
uniform highp vec4 unity_SpecCube0_BoxMax;
uniform highp vec4 unity_SpecCube0_BoxMin;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform highp vec4 unity_SpecCube1_ProbePosition;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 worldNormalRefl_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_5).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_7;
  tmpvar_7 = (_CameraToWorld * tmpvar_6).xyz;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_CameraGBufferTexture0, tmpvar_5);
  gbuffer0_4 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_CameraGBufferTexture1, tmpvar_5);
  gbuffer1_3 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_CameraGBufferTexture2, tmpvar_5);
  gbuffer2_2 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_7 - _WorldSpaceCameraPos));
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 - (2.0 * (
    dot (tmpvar_11, tmpvar_12)
   * tmpvar_11)));
  worldNormalRefl_1 = tmpvar_13;
  mediump vec4 tmpvar_14;
  tmpvar_14.xyz = worldNormalRefl_1;
  tmpvar_14.w = (pow ((1.0 - gbuffer1_3.w), 0.75) * 7.0);
  lowp vec4 tmpvar_15;
  tmpvar_15 = impl_low_textureCubeLodEXT (unity_SpecCube0, worldNormalRefl_1, tmpvar_14.w);
  mediump vec4 tmpvar_16;
  tmpvar_16 = tmpvar_15;
  mediump vec3 viewDir_17;
  viewDir_17 = -(tmpvar_12);
  mediump float x_18;
  x_18 = (1.0 - max (0.0, dot (tmpvar_11, viewDir_17)));
  mediump vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = (((
    (unity_SpecCube0_HDR.x * tmpvar_16.w)
   * tmpvar_16.xyz) * gbuffer0_4.w) * mix (gbuffer1_3.xyz, vec3(clamp (
    (gbuffer1_3.w + (1.0 - (1.0 - max (
      max (gbuffer1_3.x, gbuffer1_3.y)
    , gbuffer1_3.z))))
  , 0.0, 1.0)), vec3((
    (x_18 * x_18)
   * 
    (x_18 * x_18)
  ))));
  mediump vec3 p_20;
  p_20 = tmpvar_7;
  mediump vec3 aabbMin_21;
  aabbMin_21 = unity_SpecCube0_BoxMin.xyz;
  mediump vec3 aabbMax_22;
  aabbMax_22 = unity_SpecCube0_BoxMax.xyz;
  mediump vec3 tmpvar_23;
  tmpvar_23 = max (max ((p_20 - aabbMax_22), (aabbMin_21 - p_20)), vec3(0.0, 0.0, 0.0));
  mediump float tmpvar_24;
  tmpvar_24 = sqrt(dot (tmpvar_23, tmpvar_23));
  mediump float tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = clamp ((1.0 - (tmpvar_24 / unity_SpecCube1_ProbePosition.w)), 0.0, 1.0);
  tmpvar_25 = tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27.xyz = tmpvar_19.xyz;
  tmpvar_27.w = tmpvar_25;
  gl_FragData[0] = tmpvar_27;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
"!!GLES"
}
}
 }
 Pass {
  ZTest Always
  ZWrite Off
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 127983
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_3.x;
  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
  o_2.xy = (tmpvar_4 + tmpvar_3.w);
  o_2.zw = tmpvar_1.zw;
  xlv_TEXCOORD0 = o_2.xy;
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _CameraReflectionsTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_CameraReflectionsTexture, xlv_TEXCOORD0);
  c_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = exp2(-(c_1.xyz));
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles " {
Keywords { "UNITY_HDR_ON" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = (glstate_matrix_mvp * _glesVertex);
  highp vec4 o_2;
  highp vec4 tmpvar_3;
  tmpvar_3 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_3.x;
  tmpvar_4.y = (tmpvar_3.y * _ProjectionParams.x);
  o_2.xy = (tmpvar_4 + tmpvar_3.w);
  o_2.zw = tmpvar_1.zw;
  xlv_TEXCOORD0 = o_2.xy;
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _CameraReflectionsTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_CameraReflectionsTexture, xlv_TEXCOORD0);
  c_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = c_1.xyz;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
"!!GLES"
}
SubProgram "gles " {
Keywords { "UNITY_HDR_ON" }
"!!GLES"
}
}
 }
}
Fallback Off
}