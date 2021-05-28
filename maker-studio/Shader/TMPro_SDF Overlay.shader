//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TMPro/Distance Field Overlay" {
Properties {
 _FaceTex ("Face Texture", 2D) = "white" { }
 _FaceUVSpeedX ("Face UV Speed X", Range(-5.000000,5.000000)) = 0.000000
 _FaceUVSpeedY ("Face UV Speed Y", Range(-5.000000,5.000000)) = 0.000000
 _FaceColor ("Face Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _FaceDilate ("Face Dilate", Range(-1.000000,1.000000)) = 0.000000
 _OutlineColor ("Outline Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _OutlineTex ("Outline Texture", 2D) = "white" { }
 _OutlineUVSpeedX ("Outline UV Speed X", Range(-5.000000,5.000000)) = 0.000000
 _OutlineUVSpeedY ("Outline UV Speed Y", Range(-5.000000,5.000000)) = 0.000000
 _OutlineWidth ("Outline Thickness", Range(0.000000,1.000000)) = 0.000000
 _OutlineSoftness ("Outline Softness", Range(0.000000,1.000000)) = 0.000000
 _Bevel ("Bevel", Range(0.000000,1.000000)) = 0.500000
 _BevelOffset ("Bevel Offset", Range(-0.500000,0.500000)) = 0.000000
 _BevelWidth ("Bevel Width", Range(-0.500000,0.500000)) = 0.000000
 _BevelClamp ("Bevel Clamp", Range(0.000000,1.000000)) = 0.000000
 _BevelRoundness ("Bevel Roundness", Range(0.000000,1.000000)) = 0.000000
 _LightAngle ("Light Angle", Range(0.000000,6.283185)) = 3.141600
 _SpecularColor ("Specular", Color) = (1.000000,1.000000,1.000000,1.000000)
 _SpecularPower ("Specular", Range(0.000000,4.000000)) = 2.000000
 _Reflectivity ("Reflectivity", Range(5.000000,15.000000)) = 10.000000
 _Diffuse ("Diffuse", Range(0.000000,1.000000)) = 0.500000
 _Ambient ("Ambient", Range(1.000000,0.000000)) = 0.500000
 _BumpMap ("Normal map", 2D) = "bump" { }
 _BumpOutline ("Bump Outline", Range(0.000000,1.000000)) = 0.000000
 _BumpFace ("Bump Face", Range(0.000000,1.000000)) = 0.000000
 _ReflectFaceColor ("Reflection Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _ReflectOutlineColor ("Reflection Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _Cube ("Reflection Cubemap", CUBE) = "black" { }
 _EnvMatrixRotation ("Texture Rotation", Vector) = (0.000000,0.000000,0.000000,0.000000)
 _UnderlayColor ("Border Color", Color) = (0.000000,0.000000,0.000000,0.500000)
 _UnderlayOffsetX ("Border OffsetX", Range(-1.000000,1.000000)) = 0.000000
 _UnderlayOffsetY ("Border OffsetY", Range(-1.000000,1.000000)) = 0.000000
 _UnderlayDilate ("Border Dilate", Range(-1.000000,1.000000)) = 0.000000
 _UnderlaySoftness ("Border Softness", Range(0.000000,1.000000)) = 0.000000
 _GlowColor ("Color", Color) = (0.000000,1.000000,0.000000,0.500000)
 _GlowOffset ("Offset", Range(-1.000000,1.000000)) = 0.000000
 _GlowInner ("Inner", Range(0.000000,1.000000)) = 0.050000
 _GlowOuter ("Outer", Range(0.000000,1.000000)) = 0.050000
 _GlowPower ("Falloff", Range(1.000000,0.000000)) = 0.750000
 _WeightNormal ("Weight Normal", Float) = 0.000000
 _WeightBold ("Weight Bold", Float) = 0.500000
 _ShaderFlags ("Flags", Float) = 0.000000
 _ScaleRatioA ("Scale RatioA", Float) = 1.000000
 _ScaleRatioB ("Scale RatioB", Float) = 1.000000
 _ScaleRatioC ("Scale RatioC", Float) = 1.000000
 _MainTex ("Font Atlas", 2D) = "white" { }
 _TextureWidth ("Texture Width", Float) = 512.000000
 _TextureHeight ("Texture Height", Float) = 512.000000
 _GradientScale ("Gradient Scale", Float) = 5.000000
 _ScaleX ("Scale X", Float) = 1.000000
 _ScaleY ("Scale Y", Float) = 1.000000
 _PerspectiveFilter ("Perspective Correction", Range(0.000000,1.000000)) = 0.875000
 _VertexOffsetX ("Vertex OffsetX", Float) = 0.000000
 _VertexOffsetY ("Vertex OffsetY", Float) = 0.000000
 _MaskCoord ("Mask Coordinates", Vector) = (0.000000,0.000000,100000.000000,100000.000000)
 _MaskSoftnessX ("Mask SoftnessX", Float) = 0.000000
 _MaskSoftnessY ("Mask SoftnessY", Float) = 0.000000
}
SubShader { 
 Tags { "QUEUE"="Overlay" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Overlay" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZTest Always
  ZWrite Off
  Cull [_CullMode]
  Blend One OneMinusSrcAlpha
  GpuProgramID 61374
Program "vp" {
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying lowp vec4 xlv_COLOR2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec4 outlineColor_3;
  highp vec4 faceColor_4;
  highp float opacity_5;
  highp float weight_6;
  highp float scale_7;
  highp vec2 pixelSize_8;
  highp vec4 vert_9;
  highp float tmpvar_10;
  tmpvar_10 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_9.zw = _glesVertex.zw;
  vert_9.x = (_glesVertex.x + _VertexOffsetX);
  vert_9.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11 = (glstate_matrix_mvp * vert_9);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_8 = (tmpvar_11.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_7 = ((inversesqrt(
    dot (pixelSize_8, pixelSize_8)
  ) * abs(_glesMultiTexCoord1.y)) * (_GradientScale * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].x;
    v_14.y = unity_WorldToObject[1].x;
    v_14.z = unity_WorldToObject[2].x;
    v_14.w = unity_WorldToObject[3].x;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].y;
    v_15.y = unity_WorldToObject[1].y;
    v_15.z = unity_WorldToObject[2].y;
    v_15.w = unity_WorldToObject[3].y;
    highp vec4 v_16;
    v_16.x = unity_WorldToObject[0].z;
    v_16.y = unity_WorldToObject[1].z;
    v_16.z = unity_WorldToObject[2].z;
    v_16.w = unity_WorldToObject[3].z;
    scale_7 = mix ((scale_7 * (1.0 - _PerspectiveFilter)), scale_7, abs(dot (
      normalize((((v_14.xyz * _glesNormal.x) + (v_15.xyz * _glesNormal.y)) + (v_16.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz))
    )));
  };
  weight_6 = ((mix (_WeightNormal, _WeightBold, tmpvar_10) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  lowp float tmpvar_17;
  tmpvar_17 = tmpvar_1.w;
  opacity_5 = tmpvar_17;
  faceColor_4 = _FaceColor;
  faceColor_4.xyz = (faceColor_4.xyz * _glesColor.xyz);
  faceColor_4.w = (faceColor_4.w * opacity_5);
  outlineColor_3 = _OutlineColor;
  outlineColor_3.w = (outlineColor_3.w * opacity_5);
  highp vec2 tmpvar_18;
  tmpvar_18.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_18.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp vec4 tmpvar_19;
  tmpvar_19.xy = tmpvar_2;
  tmpvar_19.zw = tmpvar_18;
  highp vec4 tmpvar_20;
  tmpvar_20.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_7)) - weight_6);
  tmpvar_20.y = scale_7;
  tmpvar_20.z = ((0.5 - weight_6) + (0.5 / scale_7));
  tmpvar_20.w = weight_6;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = vert_9.xy;
  tmpvar_21.zw = (0.5 / pixelSize_8);
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  lowp vec4 tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_23 = faceColor_4;
  tmpvar_24 = outlineColor_3;
  gl_Position = tmpvar_11;
  xlv_COLOR = tmpvar_1;
  xlv_COLOR1 = tmpvar_23;
  xlv_COLOR2 = tmpvar_24;
  xlv_TEXCOORD0 = tmpvar_19;
  xlv_TEXCOORD1 = tmpvar_20;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform bool _UseClipRect;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR1;
varying lowp vec4 xlv_COLOR2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = xlv_COLOR1;
  outlineColor_2 = xlv_COLOR2;
  highp vec2 tmpvar_10;
  tmpvar_10.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_10.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_FaceTex, tmpvar_10);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_12;
  tmpvar_12.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_12.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_OutlineTex, tmpvar_12);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_14;
  d_14 = tmpvar_7;
  lowp vec4 faceColor_15;
  faceColor_15 = faceColor_3;
  lowp vec4 outlineColor_16;
  outlineColor_16 = outlineColor_2;
  mediump float outline_17;
  outline_17 = tmpvar_8;
  mediump float softness_18;
  softness_18 = tmpvar_9;
  mediump float tmpvar_19;
  tmpvar_19 = (1.0 - clamp ((
    ((d_14 - (outline_17 * 0.5)) + (softness_18 * 0.5))
   / 
    (1.0 + softness_18)
  ), 0.0, 1.0));
  faceColor_15.xyz = (faceColor_15.xyz * faceColor_15.w);
  outlineColor_16.xyz = (outlineColor_16.xyz * outlineColor_16.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = mix (faceColor_15, outlineColor_16, vec4((clamp (
    (d_14 + (outline_17 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_17)
  ))));
  faceColor_15 = tmpvar_20;
  faceColor_15 = (faceColor_15 * tmpvar_19);
  faceColor_3 = faceColor_15;
  if (_UseClipRect) {
    highp float tmpvar_21;
    highp vec2 tmpvar_22;
    tmpvar_22.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
    tmpvar_22.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
    highp vec2 tmpvar_23;
    tmpvar_23 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_22);
    tmpvar_21 = (tmpvar_23.x * tmpvar_23.y);
    faceColor_3 = (faceColor_3 * tmpvar_21);
  };
  tmpvar_1 = faceColor_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying lowp vec4 xlv_COLOR2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec4 outlineColor_3;
  highp vec4 faceColor_4;
  highp float opacity_5;
  highp float weight_6;
  highp float scale_7;
  highp vec2 pixelSize_8;
  highp vec4 vert_9;
  highp float tmpvar_10;
  tmpvar_10 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_9.zw = _glesVertex.zw;
  vert_9.x = (_glesVertex.x + _VertexOffsetX);
  vert_9.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11 = (glstate_matrix_mvp * vert_9);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_8 = (tmpvar_11.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_7 = ((inversesqrt(
    dot (pixelSize_8, pixelSize_8)
  ) * abs(_glesMultiTexCoord1.y)) * (_GradientScale * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].x;
    v_14.y = unity_WorldToObject[1].x;
    v_14.z = unity_WorldToObject[2].x;
    v_14.w = unity_WorldToObject[3].x;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].y;
    v_15.y = unity_WorldToObject[1].y;
    v_15.z = unity_WorldToObject[2].y;
    v_15.w = unity_WorldToObject[3].y;
    highp vec4 v_16;
    v_16.x = unity_WorldToObject[0].z;
    v_16.y = unity_WorldToObject[1].z;
    v_16.z = unity_WorldToObject[2].z;
    v_16.w = unity_WorldToObject[3].z;
    scale_7 = mix ((scale_7 * (1.0 - _PerspectiveFilter)), scale_7, abs(dot (
      normalize((((v_14.xyz * _glesNormal.x) + (v_15.xyz * _glesNormal.y)) + (v_16.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz))
    )));
  };
  weight_6 = ((mix (_WeightNormal, _WeightBold, tmpvar_10) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  lowp float tmpvar_17;
  tmpvar_17 = tmpvar_1.w;
  opacity_5 = tmpvar_17;
  faceColor_4 = _FaceColor;
  faceColor_4.xyz = (faceColor_4.xyz * _glesColor.xyz);
  faceColor_4.w = (faceColor_4.w * opacity_5);
  outlineColor_3 = _OutlineColor;
  outlineColor_3.w = (outlineColor_3.w * opacity_5);
  highp vec2 tmpvar_18;
  tmpvar_18.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_18.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp vec4 tmpvar_19;
  tmpvar_19.xy = tmpvar_2;
  tmpvar_19.zw = tmpvar_18;
  highp vec4 tmpvar_20;
  tmpvar_20.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_7)) - weight_6);
  tmpvar_20.y = scale_7;
  tmpvar_20.z = ((0.5 - weight_6) + (0.5 / scale_7));
  tmpvar_20.w = weight_6;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = vert_9.xy;
  tmpvar_21.zw = (0.5 / pixelSize_8);
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  lowp vec4 tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_23 = faceColor_4;
  tmpvar_24 = outlineColor_3;
  gl_Position = tmpvar_11;
  xlv_COLOR = tmpvar_1;
  xlv_COLOR1 = tmpvar_23;
  xlv_COLOR2 = tmpvar_24;
  xlv_TEXCOORD0 = tmpvar_19;
  xlv_TEXCOORD1 = tmpvar_20;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform bool _UseClipRect;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR1;
varying lowp vec4 xlv_COLOR2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = xlv_COLOR1;
  outlineColor_2 = xlv_COLOR2;
  highp vec2 tmpvar_10;
  tmpvar_10.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_10.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_FaceTex, tmpvar_10);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_12;
  tmpvar_12.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_12.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_OutlineTex, tmpvar_12);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_14;
  d_14 = tmpvar_7;
  lowp vec4 faceColor_15;
  faceColor_15 = faceColor_3;
  lowp vec4 outlineColor_16;
  outlineColor_16 = outlineColor_2;
  mediump float outline_17;
  outline_17 = tmpvar_8;
  mediump float softness_18;
  softness_18 = tmpvar_9;
  mediump float tmpvar_19;
  tmpvar_19 = (1.0 - clamp ((
    ((d_14 - (outline_17 * 0.5)) + (softness_18 * 0.5))
   / 
    (1.0 + softness_18)
  ), 0.0, 1.0));
  faceColor_15.xyz = (faceColor_15.xyz * faceColor_15.w);
  outlineColor_16.xyz = (outlineColor_16.xyz * outlineColor_16.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = mix (faceColor_15, outlineColor_16, vec4((clamp (
    (d_14 + (outline_17 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_17)
  ))));
  faceColor_15 = tmpvar_20;
  faceColor_15 = (faceColor_15 * tmpvar_19);
  faceColor_3 = faceColor_15;
  if (_UseClipRect) {
    highp float tmpvar_21;
    highp vec2 tmpvar_22;
    tmpvar_22.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
    tmpvar_22.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
    highp vec2 tmpvar_23;
    tmpvar_23 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_22);
    tmpvar_21 = (tmpvar_23.x * tmpvar_23.y);
    faceColor_3 = (faceColor_3 * tmpvar_21);
  };
  tmpvar_1 = faceColor_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying lowp vec4 xlv_COLOR2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec4 outlineColor_3;
  highp vec4 faceColor_4;
  highp float opacity_5;
  highp float weight_6;
  highp float scale_7;
  highp vec2 pixelSize_8;
  highp vec4 vert_9;
  highp float tmpvar_10;
  tmpvar_10 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_9.zw = _glesVertex.zw;
  vert_9.x = (_glesVertex.x + _VertexOffsetX);
  vert_9.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11 = (glstate_matrix_mvp * vert_9);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_8 = (tmpvar_11.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_7 = ((inversesqrt(
    dot (pixelSize_8, pixelSize_8)
  ) * abs(_glesMultiTexCoord1.y)) * (_GradientScale * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].x;
    v_14.y = unity_WorldToObject[1].x;
    v_14.z = unity_WorldToObject[2].x;
    v_14.w = unity_WorldToObject[3].x;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].y;
    v_15.y = unity_WorldToObject[1].y;
    v_15.z = unity_WorldToObject[2].y;
    v_15.w = unity_WorldToObject[3].y;
    highp vec4 v_16;
    v_16.x = unity_WorldToObject[0].z;
    v_16.y = unity_WorldToObject[1].z;
    v_16.z = unity_WorldToObject[2].z;
    v_16.w = unity_WorldToObject[3].z;
    scale_7 = mix ((scale_7 * (1.0 - _PerspectiveFilter)), scale_7, abs(dot (
      normalize((((v_14.xyz * _glesNormal.x) + (v_15.xyz * _glesNormal.y)) + (v_16.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz))
    )));
  };
  weight_6 = ((mix (_WeightNormal, _WeightBold, tmpvar_10) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  lowp float tmpvar_17;
  tmpvar_17 = tmpvar_1.w;
  opacity_5 = tmpvar_17;
  faceColor_4 = _FaceColor;
  faceColor_4.xyz = (faceColor_4.xyz * _glesColor.xyz);
  faceColor_4.w = (faceColor_4.w * opacity_5);
  outlineColor_3 = _OutlineColor;
  outlineColor_3.w = (outlineColor_3.w * opacity_5);
  highp vec2 tmpvar_18;
  tmpvar_18.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_18.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp vec4 tmpvar_19;
  tmpvar_19.xy = tmpvar_2;
  tmpvar_19.zw = tmpvar_18;
  highp vec4 tmpvar_20;
  tmpvar_20.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_7)) - weight_6);
  tmpvar_20.y = scale_7;
  tmpvar_20.z = ((0.5 - weight_6) + (0.5 / scale_7));
  tmpvar_20.w = weight_6;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = vert_9.xy;
  tmpvar_21.zw = (0.5 / pixelSize_8);
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  lowp vec4 tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_23 = faceColor_4;
  tmpvar_24 = outlineColor_3;
  gl_Position = tmpvar_11;
  xlv_COLOR = tmpvar_1;
  xlv_COLOR1 = tmpvar_23;
  xlv_COLOR2 = tmpvar_24;
  xlv_TEXCOORD0 = tmpvar_19;
  xlv_TEXCOORD1 = tmpvar_20;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform bool _UseClipRect;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR1;
varying lowp vec4 xlv_COLOR2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = xlv_COLOR1;
  outlineColor_2 = xlv_COLOR2;
  highp vec2 tmpvar_10;
  tmpvar_10.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_10.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_FaceTex, tmpvar_10);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_12;
  tmpvar_12.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_12.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_OutlineTex, tmpvar_12);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_14;
  d_14 = tmpvar_7;
  lowp vec4 faceColor_15;
  faceColor_15 = faceColor_3;
  lowp vec4 outlineColor_16;
  outlineColor_16 = outlineColor_2;
  mediump float outline_17;
  outline_17 = tmpvar_8;
  mediump float softness_18;
  softness_18 = tmpvar_9;
  mediump float tmpvar_19;
  tmpvar_19 = (1.0 - clamp ((
    ((d_14 - (outline_17 * 0.5)) + (softness_18 * 0.5))
   / 
    (1.0 + softness_18)
  ), 0.0, 1.0));
  faceColor_15.xyz = (faceColor_15.xyz * faceColor_15.w);
  outlineColor_16.xyz = (outlineColor_16.xyz * outlineColor_16.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = mix (faceColor_15, outlineColor_16, vec4((clamp (
    (d_14 + (outline_17 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_17)
  ))));
  faceColor_15 = tmpvar_20;
  faceColor_15 = (faceColor_15 * tmpvar_19);
  faceColor_3 = faceColor_15;
  if (_UseClipRect) {
    highp float tmpvar_21;
    highp vec2 tmpvar_22;
    tmpvar_22.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
    tmpvar_22.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
    highp vec2 tmpvar_23;
    tmpvar_23 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_22);
    tmpvar_21 = (tmpvar_23.x * tmpvar_23.y);
    faceColor_3 = (faceColor_3 * tmpvar_21);
  };
  tmpvar_1 = faceColor_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	lowp vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in lowp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_COLOR1;
out lowp vec4 vs_COLOR2;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat4;
float u_xlat6;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = in_COLOR0 * _FaceColor;
    vs_COLOR1 = u_xlat2;
    u_xlat6 = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR2.w = u_xlat6;
    vs_COLOR2.xyz = _OutlineColor.xyz;
    u_xlat6 = floor(in_TEXCOORD1.x);
    vs_TEXCOORD0.z = u_xlat6 * 0.00122070312;
    u_xlat6 = fract(in_TEXCOORD1.x);
    vs_TEXCOORD0.w = u_xlat6 * 5.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = vec2(abs(u_xlat1.x) * float(_ScaleX), abs(u_xlat1.y) * float(_ScaleY));
    u_xlat1.xy = u_xlat1.ww / u_xlat1.xy;
    u_xlat7 = dot(u_xlat1.xy, u_xlat1.xy);
    vs_TEXCOORD2.zw = vec2(0.5, 0.5) / u_xlat1.xy;
    u_xlat1.x = inversesqrt(u_xlat7);
    u_xlat1.x = u_xlat1.x * abs(in_TEXCOORD1.y);
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat4.x = u_xlat1.x * 1.5;
    u_xlat7 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat7 * u_xlat4.x;
    u_xlat1.x = u_xlat1.x * 1.5 + (-u_xlat7);
    u_xlat9 = abs(u_xlat9) * u_xlat1.x + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(hlslcc_mtx4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb1 = hlslcc_mtx4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat4.x = (u_xlatb1) ? u_xlat9 : u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb9 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat9 = u_xlat9 * u_xlat1.x + _WeightNormal;
    u_xlat9 = u_xlat9 / _GradientScale;
    u_xlat1.x = _FaceDilate * _ScaleRatioA;
    u_xlat4.z = u_xlat1.x * 0.5 + u_xlat9;
    vs_TEXCOORD1.yw = u_xlat4.xz;
    u_xlat9 = 0.5 / u_xlat4.x;
    u_xlat1.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat1.x = (-_OutlineSoftness) * _ScaleRatioA + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.5 + (-u_xlat9);
    vs_TEXCOORD1.x = (-u_xlat4.z) + u_xlat1.x;
    u_xlat1.x = (-u_xlat4.z) + 0.5;
    vs_TEXCOORD1.z = u_xlat9 + u_xlat1.x;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in lowp vec4 vs_COLOR1;
in lowp vec4 vs_COLOR2;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat9;
mediump float u_xlat16_13;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = u_xlat10_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat10_0.x) + vs_TEXCOORD1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<0.0);
#else
    u_xlatb6 = u_xlat6<0.0;
#endif
    if((int(u_xlatb6) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = _OutlineWidth * _ScaleRatioA;
    u_xlat6 = u_xlat6 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat6, 1.0);
    u_xlat16_7 = u_xlat6 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_13;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_2 = u_xlat10_0 * vs_COLOR2;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat0.xy);
    u_xlat16_4 = u_xlat10_3 * vs_COLOR1;
    u_xlat10_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.www + (-u_xlat10_5.xyz);
    u_xlat16_2.w = vs_COLOR2.w * u_xlat10_0.w + (-u_xlat16_4.w);
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    u_xlat16_2.w = vs_COLOR1.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat3.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat3.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat3.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat9 * 0.5 + u_xlat16_7;
    u_xlat16_1 = u_xlat16_7 / u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb3.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat3 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb3));
    u_xlat3.xy = vec2(u_xlat3.z * u_xlat3.x, u_xlat3.w * u_xlat3.y);
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat1 = u_xlat16_0 * u_xlat3.xxxx;
    u_xlat16_0 = (_UseClipRect != 0) ? u_xlat1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	lowp vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in lowp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_COLOR1;
out lowp vec4 vs_COLOR2;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat4;
float u_xlat6;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = in_COLOR0 * _FaceColor;
    vs_COLOR1 = u_xlat2;
    u_xlat6 = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR2.w = u_xlat6;
    vs_COLOR2.xyz = _OutlineColor.xyz;
    u_xlat6 = floor(in_TEXCOORD1.x);
    vs_TEXCOORD0.z = u_xlat6 * 0.00122070312;
    u_xlat6 = fract(in_TEXCOORD1.x);
    vs_TEXCOORD0.w = u_xlat6 * 5.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = vec2(abs(u_xlat1.x) * float(_ScaleX), abs(u_xlat1.y) * float(_ScaleY));
    u_xlat1.xy = u_xlat1.ww / u_xlat1.xy;
    u_xlat7 = dot(u_xlat1.xy, u_xlat1.xy);
    vs_TEXCOORD2.zw = vec2(0.5, 0.5) / u_xlat1.xy;
    u_xlat1.x = inversesqrt(u_xlat7);
    u_xlat1.x = u_xlat1.x * abs(in_TEXCOORD1.y);
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat4.x = u_xlat1.x * 1.5;
    u_xlat7 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat7 * u_xlat4.x;
    u_xlat1.x = u_xlat1.x * 1.5 + (-u_xlat7);
    u_xlat9 = abs(u_xlat9) * u_xlat1.x + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(hlslcc_mtx4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb1 = hlslcc_mtx4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat4.x = (u_xlatb1) ? u_xlat9 : u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb9 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat9 = u_xlat9 * u_xlat1.x + _WeightNormal;
    u_xlat9 = u_xlat9 / _GradientScale;
    u_xlat1.x = _FaceDilate * _ScaleRatioA;
    u_xlat4.z = u_xlat1.x * 0.5 + u_xlat9;
    vs_TEXCOORD1.yw = u_xlat4.xz;
    u_xlat9 = 0.5 / u_xlat4.x;
    u_xlat1.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat1.x = (-_OutlineSoftness) * _ScaleRatioA + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.5 + (-u_xlat9);
    vs_TEXCOORD1.x = (-u_xlat4.z) + u_xlat1.x;
    u_xlat1.x = (-u_xlat4.z) + 0.5;
    vs_TEXCOORD1.z = u_xlat9 + u_xlat1.x;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in lowp vec4 vs_COLOR1;
in lowp vec4 vs_COLOR2;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat9;
mediump float u_xlat16_13;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = u_xlat10_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat10_0.x) + vs_TEXCOORD1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<0.0);
#else
    u_xlatb6 = u_xlat6<0.0;
#endif
    if((int(u_xlatb6) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = _OutlineWidth * _ScaleRatioA;
    u_xlat6 = u_xlat6 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat6, 1.0);
    u_xlat16_7 = u_xlat6 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_13;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_2 = u_xlat10_0 * vs_COLOR2;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat0.xy);
    u_xlat16_4 = u_xlat10_3 * vs_COLOR1;
    u_xlat10_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.www + (-u_xlat10_5.xyz);
    u_xlat16_2.w = vs_COLOR2.w * u_xlat10_0.w + (-u_xlat16_4.w);
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    u_xlat16_2.w = vs_COLOR1.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat3.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat3.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat3.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat9 * 0.5 + u_xlat16_7;
    u_xlat16_1 = u_xlat16_7 / u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb3.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat3 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb3));
    u_xlat3.xy = vec2(u_xlat3.z * u_xlat3.x, u_xlat3.w * u_xlat3.y);
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat1 = u_xlat16_0 * u_xlat3.xxxx;
    u_xlat16_0 = (_UseClipRect != 0) ? u_xlat1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	lowp vec4 _FaceColor;
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	vec4 hlslcc_mtx4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in lowp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_COLOR1;
out lowp vec4 vs_COLOR2;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat4;
float u_xlat6;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = in_COLOR0 * _FaceColor;
    vs_COLOR1 = u_xlat2;
    u_xlat6 = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR2.w = u_xlat6;
    vs_COLOR2.xyz = _OutlineColor.xyz;
    u_xlat6 = floor(in_TEXCOORD1.x);
    vs_TEXCOORD0.z = u_xlat6 * 0.00122070312;
    u_xlat6 = fract(in_TEXCOORD1.x);
    vs_TEXCOORD0.w = u_xlat6 * 5.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat1.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat1.xy;
    u_xlat1.xy = vec2(abs(u_xlat1.x) * float(_ScaleX), abs(u_xlat1.y) * float(_ScaleY));
    u_xlat1.xy = u_xlat1.ww / u_xlat1.xy;
    u_xlat7 = dot(u_xlat1.xy, u_xlat1.xy);
    vs_TEXCOORD2.zw = vec2(0.5, 0.5) / u_xlat1.xy;
    u_xlat1.x = inversesqrt(u_xlat7);
    u_xlat1.x = u_xlat1.x * abs(in_TEXCOORD1.y);
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat4.x = u_xlat1.x * 1.5;
    u_xlat7 = (-_PerspectiveFilter) + 1.0;
    u_xlat7 = u_xlat7 * u_xlat4.x;
    u_xlat1.x = u_xlat1.x * 1.5 + (-u_xlat7);
    u_xlat9 = abs(u_xlat9) * u_xlat1.x + u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(hlslcc_mtx4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb1 = hlslcc_mtx4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat4.x = (u_xlatb1) ? u_xlat9 : u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb9 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat9 = u_xlat9 * u_xlat1.x + _WeightNormal;
    u_xlat9 = u_xlat9 / _GradientScale;
    u_xlat1.x = _FaceDilate * _ScaleRatioA;
    u_xlat4.z = u_xlat1.x * 0.5 + u_xlat9;
    vs_TEXCOORD1.yw = u_xlat4.xz;
    u_xlat9 = 0.5 / u_xlat4.x;
    u_xlat1.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat1.x = (-_OutlineSoftness) * _ScaleRatioA + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.5 + (-u_xlat9);
    vs_TEXCOORD1.x = (-u_xlat4.z) + u_xlat1.x;
    u_xlat1.x = (-u_xlat4.z) + 0.5;
    vs_TEXCOORD1.z = u_xlat9 + u_xlat1.x;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in lowp vec4 vs_COLOR1;
in lowp vec4 vs_COLOR2;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
float u_xlat9;
mediump float u_xlat16_13;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat6 = u_xlat10_0.x + (-vs_TEXCOORD1.x);
    u_xlat0.x = (-u_xlat10_0.x) + vs_TEXCOORD1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6<0.0);
#else
    u_xlatb6 = u_xlat6<0.0;
#endif
    if((int(u_xlatb6) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = _OutlineWidth * _ScaleRatioA;
    u_xlat6 = u_xlat6 * vs_TEXCOORD1.y;
    u_xlat16_1 = min(u_xlat6, 1.0);
    u_xlat16_7 = u_xlat6 * 0.5;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_13 = u_xlat0.x * vs_TEXCOORD1.y + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_7 = u_xlat0.x * vs_TEXCOORD1.y + (-u_xlat16_7);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_13;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_2 = u_xlat10_0 * vs_COLOR2;
    u_xlat0.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat0.xy);
    u_xlat16_4 = u_xlat10_3 * vs_COLOR1;
    u_xlat10_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_2.www + (-u_xlat10_5.xyz);
    u_xlat16_2.w = vs_COLOR2.w * u_xlat10_0.w + (-u_xlat16_4.w);
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    u_xlat16_2.w = vs_COLOR1.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat3.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9 = u_xlat3.x * vs_TEXCOORD1.y;
    u_xlat16_1 = u_xlat3.x * vs_TEXCOORD1.y + 1.0;
    u_xlat16_7 = u_xlat9 * 0.5 + u_xlat16_7;
    u_xlat16_1 = u_xlat16_7 / u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_2;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb3.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat3 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb3));
    u_xlat3.xy = vec2(u_xlat3.z * u_xlat3.x, u_xlat3.w * u_xlat3.y);
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat1 = u_xlat16_0 * u_xlat3.xxxx;
    u_xlat16_0 = (_UseClipRect != 0) ? u_xlat1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles hw_tier03 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "gles3 hw_tier03 " {
""
}
}
 }
}
CustomEditor "TMPro_SDFMaterialEditor"
Fallback "TMPro/Mobile/Distance Field"
}