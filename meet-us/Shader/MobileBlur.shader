//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/FastBlur" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" { }
 _Bloom ("Bloom (RGB)", 2D) = "black" { }
}
SubShader { 
 Pass {
  ZTest False
  ZWrite Off
  Cull Off
  GpuProgramID 6716
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
void main ()
{
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = (_glesMultiTexCoord0.xy + _MainTex_TexelSize.xy);
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xy + (_MainTex_TexelSize.xy * vec2(-0.5, -0.5)));
  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xy + (_MainTex_TexelSize.xy * vec2(0.5, -0.5)));
  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xy + (_MainTex_TexelSize.xy * vec2(-0.5, 0.5)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
void main ()
{
  mediump vec4 color_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_1 = tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1);
  color_1 = (color_1 + tmpvar_3);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD2);
  color_1 = (color_1 + tmpvar_4);
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD3);
  color_1 = (color_1 + tmpvar_5);
  gl_FragData[0] = (color_1 / 4.0);
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
  Cull Off
  GpuProgramID 78991
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _Parameter;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 tmpvar_1;
  tmpvar_1.zw = vec2(1.0, 1.0);
  tmpvar_1.xy = _glesMultiTexCoord0.xy;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = ((_MainTex_TexelSize.xy * vec2(0.0, 1.0)) * _Parameter.x);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 color_1;
  mediump vec2 coords_2;
  coords_2 = (xlv_TEXCOORD0.xy - (xlv_TEXCOORD1 * 3.0));
  mediump vec4 tap_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, coords_2);
  tap_3 = tmpvar_4;
  color_1 = (tap_3 * vec4(0.0205, 0.0205, 0.0205, 0.0));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, coords_2);
  tap_5 = tmpvar_6;
  color_1 = (color_1 + (tap_5 * vec4(0.0855, 0.0855, 0.0855, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, coords_2);
  tap_7 = tmpvar_8;
  color_1 = (color_1 + (tap_7 * vec4(0.232, 0.232, 0.232, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, coords_2);
  tap_9 = tmpvar_10;
  color_1 = (color_1 + (tap_9 * vec4(0.324, 0.324, 0.324, 1.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, coords_2);
  tap_11 = tmpvar_12;
  color_1 = (color_1 + (tap_11 * vec4(0.232, 0.232, 0.232, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, coords_2);
  tap_13 = tmpvar_14;
  color_1 = (color_1 + (tap_13 * vec4(0.0855, 0.0855, 0.0855, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_MainTex, coords_2);
  tap_15 = tmpvar_16;
  color_1 = (color_1 + (tap_15 * vec4(0.0205, 0.0205, 0.0205, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  gl_FragData[0] = color_1;
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
  Cull Off
  GpuProgramID 155529
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _Parameter;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 tmpvar_1;
  tmpvar_1.zw = vec2(1.0, 1.0);
  tmpvar_1.xy = _glesMultiTexCoord0.xy;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = ((_MainTex_TexelSize.xy * vec2(1.0, 0.0)) * _Parameter.x);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec4 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 color_1;
  mediump vec2 coords_2;
  coords_2 = (xlv_TEXCOORD0.xy - (xlv_TEXCOORD1 * 3.0));
  mediump vec4 tap_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, coords_2);
  tap_3 = tmpvar_4;
  color_1 = (tap_3 * vec4(0.0205, 0.0205, 0.0205, 0.0));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, coords_2);
  tap_5 = tmpvar_6;
  color_1 = (color_1 + (tap_5 * vec4(0.0855, 0.0855, 0.0855, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, coords_2);
  tap_7 = tmpvar_8;
  color_1 = (color_1 + (tap_7 * vec4(0.232, 0.232, 0.232, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, coords_2);
  tap_9 = tmpvar_10;
  color_1 = (color_1 + (tap_9 * vec4(0.324, 0.324, 0.324, 1.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, coords_2);
  tap_11 = tmpvar_12;
  color_1 = (color_1 + (tap_11 * vec4(0.232, 0.232, 0.232, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, coords_2);
  tap_13 = tmpvar_14;
  color_1 = (color_1 + (tap_13 * vec4(0.0855, 0.0855, 0.0855, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  mediump vec4 tap_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_MainTex, coords_2);
  tap_15 = tmpvar_16;
  color_1 = (color_1 + (tap_15 * vec4(0.0205, 0.0205, 0.0205, 0.0)));
  coords_2 = (coords_2 + xlv_TEXCOORD1);
  gl_FragData[0] = color_1;
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
  Cull Off
  GpuProgramID 245501
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _Parameter;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD1_1;
varying mediump vec4 xlv_TEXCOORD1_2;
void main ()
{
  mediump vec4 coords_1;
  mediump vec4 tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.zw = vec2(1.0, 1.0);
  tmpvar_3.xy = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_4;
  tmpvar_4 = ((_MainTex_TexelSize.xy * vec2(0.0, 1.0)) * _Parameter.x);
  mediump vec4 tmpvar_5;
  tmpvar_5 = (-(tmpvar_4.xyxy) * 3.0);
  coords_1 = (tmpvar_5 + tmpvar_4.xyxy);
  tmpvar_2 = (_glesMultiTexCoord0.xyxy + (coords_1 * vec4(1.0, 1.0, -1.0, -1.0)));
  coords_1 = (coords_1 + tmpvar_4.xyxy);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3.xy;
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xyxy + (tmpvar_5 * vec4(1.0, 1.0, -1.0, -1.0)));
  xlv_TEXCOORD1_1 = tmpvar_2;
  xlv_TEXCOORD1_2 = (_glesMultiTexCoord0.xyxy + (coords_1 * vec4(1.0, 1.0, -1.0, -1.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD1_1;
varying mediump vec4 xlv_TEXCOORD1_2;
void main ()
{
  mediump vec4 color_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_1 = (tmpvar_2 * vec4(0.324, 0.324, 0.324, 1.0));
  mediump vec4 tapB_3;
  mediump vec4 tapA_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1.xy);
  tapA_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD1.zw);
  tapB_3 = tmpvar_6;
  color_1 = (color_1 + ((tapA_4 + tapB_3) * vec4(0.0205, 0.0205, 0.0205, 0.0)));
  mediump vec4 tapB_7;
  mediump vec4 tapA_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD1_1.xy);
  tapA_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD1_1.zw);
  tapB_7 = tmpvar_10;
  color_1 = (color_1 + ((tapA_8 + tapB_7) * vec4(0.0855, 0.0855, 0.0855, 0.0)));
  mediump vec4 tapB_11;
  mediump vec4 tapA_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MainTex, xlv_TEXCOORD1_2.xy);
  tapA_12 = tmpvar_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, xlv_TEXCOORD1_2.zw);
  tapB_11 = tmpvar_14;
  color_1 = (color_1 + ((tapA_12 + tapB_11) * vec4(0.232, 0.232, 0.232, 0.0)));
  gl_FragData[0] = color_1;
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
  Cull Off
  GpuProgramID 285244
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _Parameter;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD1_1;
varying mediump vec4 xlv_TEXCOORD1_2;
void main ()
{
  mediump vec4 coords_1;
  mediump vec4 tmpvar_2;
  mediump vec2 tmpvar_3;
  tmpvar_3 = ((_MainTex_TexelSize.xy * vec2(1.0, 0.0)) * _Parameter.x);
  mediump vec4 tmpvar_4;
  tmpvar_4 = (-(tmpvar_3.xyxy) * 3.0);
  coords_1 = (tmpvar_4 + tmpvar_3.xyxy);
  tmpvar_2 = (_glesMultiTexCoord0.xyxy + (coords_1 * vec4(1.0, 1.0, -1.0, -1.0)));
  coords_1 = (coords_1 + tmpvar_3.xyxy);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xyxy + (tmpvar_4 * vec4(1.0, 1.0, -1.0, -1.0)));
  xlv_TEXCOORD1_1 = tmpvar_2;
  xlv_TEXCOORD1_2 = (_glesMultiTexCoord0.xyxy + (coords_1 * vec4(1.0, 1.0, -1.0, -1.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD1_1;
varying mediump vec4 xlv_TEXCOORD1_2;
void main ()
{
  mediump vec4 color_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  color_1 = (tmpvar_2 * vec4(0.324, 0.324, 0.324, 1.0));
  mediump vec4 tapB_3;
  mediump vec4 tapA_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1.xy);
  tapA_4 = tmpvar_5;
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD1.zw);
  tapB_3 = tmpvar_6;
  color_1 = (color_1 + ((tapA_4 + tapB_3) * vec4(0.0205, 0.0205, 0.0205, 0.0)));
  mediump vec4 tapB_7;
  mediump vec4 tapA_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD1_1.xy);
  tapA_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD1_1.zw);
  tapB_7 = tmpvar_10;
  color_1 = (color_1 + ((tapA_8 + tapB_7) * vec4(0.0855, 0.0855, 0.0855, 0.0)));
  mediump vec4 tapB_11;
  mediump vec4 tapA_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MainTex, xlv_TEXCOORD1_2.xy);
  tapA_12 = tmpvar_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, xlv_TEXCOORD1_2.zw);
  tapB_11 = tmpvar_14;
  color_1 = (color_1 + ((tapA_12 + tapB_11) * vec4(0.232, 0.232, 0.232, 0.0)));
  gl_FragData[0] = color_1;
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