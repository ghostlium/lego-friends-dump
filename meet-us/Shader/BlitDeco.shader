//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Utils/BlitDeco" {
Properties {
 _MainTex ("SkinTex", 2D) = "" { }
 _DecoTexture ("DecoTex", 2D) = "" { }
}
SubShader { 
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 50260
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  highp vec2 inUV_2;
  inUV_2 = tmpvar_1;
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 0.0);
  tmpvar_3.xy = inUV_2;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * tmpvar_3).xy;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DecoTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 skinColor_1;
  mediump vec4 decoColor_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_DecoTexture, xlv_TEXCOORD0);
  decoColor_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  skinColor_1 = tmpvar_4;
  mediump float tmpvar_5;
  tmpvar_5 = float((0.0 >= decoColor_2.w));
  gl_FragData[0] = ((tmpvar_5 * skinColor_1) + (abs(
    (tmpvar_5 - 1.0)
  ) * decoColor_2));
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
}
Fallback Off
}