//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TMPro/Mobile/Distance Field Overlay" {
Properties {
 _FaceColor ("Face Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _FaceDilate ("Face Dilate", Range(-1.000000,1.000000)) = 0.000000
 _OutlineColor ("Outline Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _OutlineWidth ("Outline Thickness", Range(0.000000,1.000000)) = 0.000000
 _OutlineSoftness ("Outline Softness", Range(0.000000,1.000000)) = 0.000000
 _UnderlayColor ("Border Color", Color) = (0.000000,0.000000,0.000000,0.500000)
 _UnderlayOffsetX ("Border OffsetX", Range(-1.000000,1.000000)) = 0.000000
 _UnderlayOffsetY ("Border OffsetY", Range(-1.000000,1.000000)) = 0.000000
 _UnderlayDilate ("Border Dilate", Range(-1.000000,1.000000)) = 0.000000
 _UnderlaySoftness ("Border Softness", Range(0.000000,1.000000)) = 0.000000
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
  GpuProgramID 61614
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  lowp vec4 outlineColor_3;
  lowp vec4 faceColor_4;
  highp float opacity_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  tmpvar_10 = (glstate_matrix_mvp * vert_8);
  highp vec2 tmpvar_11;
  tmpvar_11.x = _ScaleX;
  tmpvar_11.y = _ScaleY;
  highp mat2 tmpvar_12;
  tmpvar_12[0] = glstate_matrix_projection[0].xy;
  tmpvar_12[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_11 * abs(
    (tmpvar_12 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_13;
    v_13.x = unity_WorldToObject[0].x;
    v_13.y = unity_WorldToObject[1].x;
    v_13.z = unity_WorldToObject[2].x;
    v_13.w = unity_WorldToObject[3].x;
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].y;
    v_14.y = unity_WorldToObject[1].y;
    v_14.z = unity_WorldToObject[2].y;
    v_14.w = unity_WorldToObject[3].y;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].z;
    v_15.y = unity_WorldToObject[1].z;
    v_15.z = unity_WorldToObject[2].z;
    v_15.w = unity_WorldToObject[3].z;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((((v_13.xyz * _glesNormal.x) + (v_14.xyz * _glesNormal.y)) + (v_15.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  scale_6 = (scale_6 / (1.0 + (
    (_OutlineSoftness * _ScaleRatioA)
   * scale_6)));
  highp float tmpvar_16;
  tmpvar_16 = (((0.5 - 
    ((mix (_WeightNormal, _WeightBold, tmpvar_9) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5))
  ) * scale_6) - 0.5);
  highp float tmpvar_17;
  tmpvar_17 = ((_OutlineWidth * _ScaleRatioA) * (0.5 * scale_6));
  lowp float tmpvar_18;
  tmpvar_18 = tmpvar_1.w;
  opacity_5 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_1.xyz;
  tmpvar_19.w = opacity_5;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * _FaceColor);
  faceColor_4 = tmpvar_20;
  outlineColor_3.xyz = _OutlineColor.xyz;
  faceColor_4.xyz = (faceColor_4.xyz * faceColor_4.w);
  outlineColor_3.w = (_OutlineColor.w * opacity_5);
  outlineColor_3.xyz = (_OutlineColor.xyz * outlineColor_3.w);
  highp vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_4, outlineColor_3, vec4(sqrt(min (1.0, 
    (tmpvar_17 * 2.0)
  ))));
  outlineColor_3 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.x = scale_6;
  tmpvar_22.y = (tmpvar_16 - tmpvar_17);
  tmpvar_22.z = (tmpvar_16 + tmpvar_17);
  tmpvar_22.w = tmpvar_16;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = vert_8.xy;
  tmpvar_23.zw = (0.5 / pixelSize_7);
  mediump vec4 tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_24 = tmpvar_22;
  tmpvar_25 = tmpvar_23;
  gl_Position = tmpvar_10;
  xlv_COLOR = faceColor_4;
  xlv_COLOR1 = outlineColor_3;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_24;
  xlv_TEXCOORD2 = tmpvar_25;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bool _UseClipRect;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((tmpvar_3.w * xlv_TEXCOORD1.x) - xlv_TEXCOORD1.w), 0.0, 1.0);
  lowp vec4 tmpvar_5;
  tmpvar_5 = (xlv_COLOR * tmpvar_4);
  c_2 = tmpvar_5;
  if (_UseClipRect) {
    highp float tmpvar_6;
    highp vec2 position_7;
    position_7 = xlv_TEXCOORD2.xy;
    highp vec2 tmpvar_8;
    tmpvar_8.x = float((_ClipRect.z >= position_7.x));
    tmpvar_8.y = float((_ClipRect.w >= position_7.y));
    highp vec2 tmpvar_9;
    tmpvar_9 = (vec2(greaterThanEqual (position_7, _ClipRect.xy)) * tmpvar_8);
    tmpvar_6 = (tmpvar_9.x * tmpvar_9.y);
    c_2 = (c_2 * tmpvar_6);
  };
  tmpvar_1 = c_2;
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  lowp vec4 outlineColor_3;
  lowp vec4 faceColor_4;
  highp float opacity_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  tmpvar_10 = (glstate_matrix_mvp * vert_8);
  highp vec2 tmpvar_11;
  tmpvar_11.x = _ScaleX;
  tmpvar_11.y = _ScaleY;
  highp mat2 tmpvar_12;
  tmpvar_12[0] = glstate_matrix_projection[0].xy;
  tmpvar_12[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_11 * abs(
    (tmpvar_12 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_13;
    v_13.x = unity_WorldToObject[0].x;
    v_13.y = unity_WorldToObject[1].x;
    v_13.z = unity_WorldToObject[2].x;
    v_13.w = unity_WorldToObject[3].x;
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].y;
    v_14.y = unity_WorldToObject[1].y;
    v_14.z = unity_WorldToObject[2].y;
    v_14.w = unity_WorldToObject[3].y;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].z;
    v_15.y = unity_WorldToObject[1].z;
    v_15.z = unity_WorldToObject[2].z;
    v_15.w = unity_WorldToObject[3].z;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((((v_13.xyz * _glesNormal.x) + (v_14.xyz * _glesNormal.y)) + (v_15.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  scale_6 = (scale_6 / (1.0 + (
    (_OutlineSoftness * _ScaleRatioA)
   * scale_6)));
  highp float tmpvar_16;
  tmpvar_16 = (((0.5 - 
    ((mix (_WeightNormal, _WeightBold, tmpvar_9) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5))
  ) * scale_6) - 0.5);
  highp float tmpvar_17;
  tmpvar_17 = ((_OutlineWidth * _ScaleRatioA) * (0.5 * scale_6));
  lowp float tmpvar_18;
  tmpvar_18 = tmpvar_1.w;
  opacity_5 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_1.xyz;
  tmpvar_19.w = opacity_5;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * _FaceColor);
  faceColor_4 = tmpvar_20;
  outlineColor_3.xyz = _OutlineColor.xyz;
  faceColor_4.xyz = (faceColor_4.xyz * faceColor_4.w);
  outlineColor_3.w = (_OutlineColor.w * opacity_5);
  outlineColor_3.xyz = (_OutlineColor.xyz * outlineColor_3.w);
  highp vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_4, outlineColor_3, vec4(sqrt(min (1.0, 
    (tmpvar_17 * 2.0)
  ))));
  outlineColor_3 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.x = scale_6;
  tmpvar_22.y = (tmpvar_16 - tmpvar_17);
  tmpvar_22.z = (tmpvar_16 + tmpvar_17);
  tmpvar_22.w = tmpvar_16;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = vert_8.xy;
  tmpvar_23.zw = (0.5 / pixelSize_7);
  mediump vec4 tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_24 = tmpvar_22;
  tmpvar_25 = tmpvar_23;
  gl_Position = tmpvar_10;
  xlv_COLOR = faceColor_4;
  xlv_COLOR1 = outlineColor_3;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_24;
  xlv_TEXCOORD2 = tmpvar_25;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bool _UseClipRect;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((tmpvar_3.w * xlv_TEXCOORD1.x) - xlv_TEXCOORD1.w), 0.0, 1.0);
  lowp vec4 tmpvar_5;
  tmpvar_5 = (xlv_COLOR * tmpvar_4);
  c_2 = tmpvar_5;
  if (_UseClipRect) {
    highp float tmpvar_6;
    highp vec2 position_7;
    position_7 = xlv_TEXCOORD2.xy;
    highp vec2 tmpvar_8;
    tmpvar_8.x = float((_ClipRect.z >= position_7.x));
    tmpvar_8.y = float((_ClipRect.w >= position_7.y));
    highp vec2 tmpvar_9;
    tmpvar_9 = (vec2(greaterThanEqual (position_7, _ClipRect.xy)) * tmpvar_8);
    tmpvar_6 = (tmpvar_9.x * tmpvar_9.y);
    c_2 = (c_2 * tmpvar_6);
  };
  tmpvar_1 = c_2;
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
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  lowp vec4 outlineColor_3;
  lowp vec4 faceColor_4;
  highp float opacity_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  tmpvar_10 = (glstate_matrix_mvp * vert_8);
  highp vec2 tmpvar_11;
  tmpvar_11.x = _ScaleX;
  tmpvar_11.y = _ScaleY;
  highp mat2 tmpvar_12;
  tmpvar_12[0] = glstate_matrix_projection[0].xy;
  tmpvar_12[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_11 * abs(
    (tmpvar_12 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_13;
    v_13.x = unity_WorldToObject[0].x;
    v_13.y = unity_WorldToObject[1].x;
    v_13.z = unity_WorldToObject[2].x;
    v_13.w = unity_WorldToObject[3].x;
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].y;
    v_14.y = unity_WorldToObject[1].y;
    v_14.z = unity_WorldToObject[2].y;
    v_14.w = unity_WorldToObject[3].y;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].z;
    v_15.y = unity_WorldToObject[1].z;
    v_15.z = unity_WorldToObject[2].z;
    v_15.w = unity_WorldToObject[3].z;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((((v_13.xyz * _glesNormal.x) + (v_14.xyz * _glesNormal.y)) + (v_15.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  scale_6 = (scale_6 / (1.0 + (
    (_OutlineSoftness * _ScaleRatioA)
   * scale_6)));
  highp float tmpvar_16;
  tmpvar_16 = (((0.5 - 
    ((mix (_WeightNormal, _WeightBold, tmpvar_9) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5))
  ) * scale_6) - 0.5);
  highp float tmpvar_17;
  tmpvar_17 = ((_OutlineWidth * _ScaleRatioA) * (0.5 * scale_6));
  lowp float tmpvar_18;
  tmpvar_18 = tmpvar_1.w;
  opacity_5 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.xyz = tmpvar_1.xyz;
  tmpvar_19.w = opacity_5;
  highp vec4 tmpvar_20;
  tmpvar_20 = (tmpvar_19 * _FaceColor);
  faceColor_4 = tmpvar_20;
  outlineColor_3.xyz = _OutlineColor.xyz;
  faceColor_4.xyz = (faceColor_4.xyz * faceColor_4.w);
  outlineColor_3.w = (_OutlineColor.w * opacity_5);
  outlineColor_3.xyz = (_OutlineColor.xyz * outlineColor_3.w);
  highp vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_4, outlineColor_3, vec4(sqrt(min (1.0, 
    (tmpvar_17 * 2.0)
  ))));
  outlineColor_3 = tmpvar_21;
  highp vec4 tmpvar_22;
  tmpvar_22.x = scale_6;
  tmpvar_22.y = (tmpvar_16 - tmpvar_17);
  tmpvar_22.z = (tmpvar_16 + tmpvar_17);
  tmpvar_22.w = tmpvar_16;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = vert_8.xy;
  tmpvar_23.zw = (0.5 / pixelSize_7);
  mediump vec4 tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_24 = tmpvar_22;
  tmpvar_25 = tmpvar_23;
  gl_Position = tmpvar_10;
  xlv_COLOR = faceColor_4;
  xlv_COLOR1 = outlineColor_3;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_24;
  xlv_TEXCOORD2 = tmpvar_25;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform bool _UseClipRect;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((tmpvar_3.w * xlv_TEXCOORD1.x) - xlv_TEXCOORD1.w), 0.0, 1.0);
  lowp vec4 tmpvar_5;
  tmpvar_5 = (xlv_COLOR * tmpvar_4);
  c_2 = tmpvar_5;
  if (_UseClipRect) {
    highp float tmpvar_6;
    highp vec2 position_7;
    position_7 = xlv_TEXCOORD2.xy;
    highp vec2 tmpvar_8;
    tmpvar_8.x = float((_ClipRect.z >= position_7.x));
    tmpvar_8.y = float((_ClipRect.w >= position_7.y));
    highp vec2 tmpvar_9;
    tmpvar_9 = (vec2(greaterThanEqual (position_7, _ClipRect.xy)) * tmpvar_8);
    tmpvar_6 = (tmpvar_9.x * tmpvar_9.y);
    c_2 = (c_2 * tmpvar_6);
  };
  tmpvar_1 = c_2;
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
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
float u_xlat16;
float u_xlat18;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat10_2 = in_COLOR0 * _FaceColor;
    u_xlat10_2.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    vs_COLOR0 = u_xlat10_2;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xxx;
    u_xlat3.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat4.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat4.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat4.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat4.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat4.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat6.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat6.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat6.xy;
    u_xlat6.xy = vec2(abs(u_xlat6.x) * float(_ScaleX), abs(u_xlat6.y) * float(_ScaleY));
    u_xlat6.xy = u_xlat1.ww / u_xlat6.xy;
    u_xlat16 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat0.zw = vec2(0.5, 0.5) / u_xlat6.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.x = inversesqrt(u_xlat16);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat10 = u_xlat10 * abs(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat10);
    u_xlat0.x = abs(u_xlat1.x) * u_xlat0.x + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(hlslcc_mtx4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb10 = hlslcc_mtx4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : u_xlat5.x;
    u_xlat5.xy = vec2(_FaceDilate, _OutlineSoftness) * vec2(vec2(_ScaleRatioA, _ScaleRatioA));
    u_xlat10 = u_xlat5.y * u_xlat0.x + 1.0;
    u_xlat1.x = u_xlat0.x / u_xlat10;
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat10 = min(u_xlat0.x, 1.0);
    u_xlat10 = sqrt(u_xlat10);
    u_xlat15 = in_COLOR0.w * _OutlineColor.w;
    u_xlat3.xyz = _OutlineColor.xyz * vec3(u_xlat15) + (-u_xlat10_2.xyz);
    u_xlat3.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat10_2.w);
    u_xlat2 = vec4(u_xlat10) * u_xlat3 + u_xlat10_2;
    vs_COLOR1 = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb10 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat15 = (-_WeightNormal) + _WeightBold;
    u_xlat10 = u_xlat10 * u_xlat15 + _WeightNormal;
    u_xlat10 = u_xlat10 / _GradientScale;
    u_xlat5.x = u_xlat5.x * 0.5 + u_xlat10;
    u_xlat5.x = (-u_xlat5.x) + 0.5;
    u_xlat1.w = u_xlat5.x * u_xlat1.x + -0.5;
    u_xlat1.y = (-u_xlat0.x) * 0.5 + u_xlat1.w;
    u_xlat1.z = u_xlat0.x * 0.5 + u_xlat1.w;
    vs_TEXCOORD1 = u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1.x = u_xlat10_2 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    u_xlat16_0 = (_UseClipRect != 0) ? u_xlat0 : u_xlat16_1;
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
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
float u_xlat16;
float u_xlat18;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat10_2 = in_COLOR0 * _FaceColor;
    u_xlat10_2.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    vs_COLOR0 = u_xlat10_2;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xxx;
    u_xlat3.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat4.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat4.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat4.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat4.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat4.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat6.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat6.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat6.xy;
    u_xlat6.xy = vec2(abs(u_xlat6.x) * float(_ScaleX), abs(u_xlat6.y) * float(_ScaleY));
    u_xlat6.xy = u_xlat1.ww / u_xlat6.xy;
    u_xlat16 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat0.zw = vec2(0.5, 0.5) / u_xlat6.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.x = inversesqrt(u_xlat16);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat10 = u_xlat10 * abs(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat10);
    u_xlat0.x = abs(u_xlat1.x) * u_xlat0.x + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(hlslcc_mtx4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb10 = hlslcc_mtx4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : u_xlat5.x;
    u_xlat5.xy = vec2(_FaceDilate, _OutlineSoftness) * vec2(vec2(_ScaleRatioA, _ScaleRatioA));
    u_xlat10 = u_xlat5.y * u_xlat0.x + 1.0;
    u_xlat1.x = u_xlat0.x / u_xlat10;
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat10 = min(u_xlat0.x, 1.0);
    u_xlat10 = sqrt(u_xlat10);
    u_xlat15 = in_COLOR0.w * _OutlineColor.w;
    u_xlat3.xyz = _OutlineColor.xyz * vec3(u_xlat15) + (-u_xlat10_2.xyz);
    u_xlat3.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat10_2.w);
    u_xlat2 = vec4(u_xlat10) * u_xlat3 + u_xlat10_2;
    vs_COLOR1 = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb10 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat15 = (-_WeightNormal) + _WeightBold;
    u_xlat10 = u_xlat10 * u_xlat15 + _WeightNormal;
    u_xlat10 = u_xlat10 / _GradientScale;
    u_xlat5.x = u_xlat5.x * 0.5 + u_xlat10;
    u_xlat5.x = (-u_xlat5.x) + 0.5;
    u_xlat1.w = u_xlat5.x * u_xlat1.x + -0.5;
    u_xlat1.y = (-u_xlat0.x) * 0.5 + u_xlat1.w;
    u_xlat1.z = u_xlat0.x * 0.5 + u_xlat1.w;
    vs_TEXCOORD1 = u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1.x = u_xlat10_2 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    u_xlat16_0 = (_UseClipRect != 0) ? u_xlat0 : u_xlat16_1;
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
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
float u_xlat16;
float u_xlat18;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat10_2 = in_COLOR0 * _FaceColor;
    u_xlat10_2.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    vs_COLOR0 = u_xlat10_2;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xxx;
    u_xlat3.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat4.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat4.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat4.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat4.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat4.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat6.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat6.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat6.xy;
    u_xlat6.xy = vec2(abs(u_xlat6.x) * float(_ScaleX), abs(u_xlat6.y) * float(_ScaleY));
    u_xlat6.xy = u_xlat1.ww / u_xlat6.xy;
    u_xlat16 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat0.zw = vec2(0.5, 0.5) / u_xlat6.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.x = inversesqrt(u_xlat16);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat10 = u_xlat10 * abs(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat10);
    u_xlat0.x = abs(u_xlat1.x) * u_xlat0.x + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(hlslcc_mtx4glstate_matrix_projection[3].w==0.0);
#else
    u_xlatb10 = hlslcc_mtx4glstate_matrix_projection[3].w==0.0;
#endif
    u_xlat0.x = (u_xlatb10) ? u_xlat0.x : u_xlat5.x;
    u_xlat5.xy = vec2(_FaceDilate, _OutlineSoftness) * vec2(vec2(_ScaleRatioA, _ScaleRatioA));
    u_xlat10 = u_xlat5.y * u_xlat0.x + 1.0;
    u_xlat1.x = u_xlat0.x / u_xlat10;
    u_xlat0.x = _OutlineWidth * _ScaleRatioA;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat10 = min(u_xlat0.x, 1.0);
    u_xlat10 = sqrt(u_xlat10);
    u_xlat15 = in_COLOR0.w * _OutlineColor.w;
    u_xlat3.xyz = _OutlineColor.xyz * vec3(u_xlat15) + (-u_xlat10_2.xyz);
    u_xlat3.w = _OutlineColor.w * in_COLOR0.w + (-u_xlat10_2.w);
    u_xlat2 = vec4(u_xlat10) * u_xlat3 + u_xlat10_2;
    vs_COLOR1 = u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb10 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat15 = (-_WeightNormal) + _WeightBold;
    u_xlat10 = u_xlat10 * u_xlat15 + _WeightNormal;
    u_xlat10 = u_xlat10 / _GradientScale;
    u_xlat5.x = u_xlat5.x * 0.5 + u_xlat10;
    u_xlat5.x = (-u_xlat5.x) + 0.5;
    u_xlat1.w = u_xlat5.x * u_xlat1.x + -0.5;
    u_xlat1.y = (-u_xlat0.x) * 0.5 + u_xlat1.w;
    u_xlat1.z = u_xlat0.x * 0.5 + u_xlat1.w;
    vs_TEXCOORD1 = u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _MainTex;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1.x = u_xlat10_2 * vs_TEXCOORD1.x + (-vs_TEXCOORD1.w);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    u_xlat16_0 = (_UseClipRect != 0) ? u_xlat0 : u_xlat16_1;
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
}