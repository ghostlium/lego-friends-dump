//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TMPro/Mobile/Distance Field (Surface)" {
Properties {
 _FaceTex ("Fill Texture", 2D) = "white" { }
 _FaceColor ("Fill Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _FaceDilate ("Face Dilate", Range(-1.000000,1.000000)) = 0.000000
 _OutlineColor ("Outline Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _OutlineTex ("Outline Texture", 2D) = "white" { }
 _OutlineWidth ("Outline Thickness", Range(0.000000,1.000000)) = 0.000000
 _OutlineSoftness ("Outline Softness", Range(0.000000,1.000000)) = 0.000000
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
}
SubShader { 
 LOD 300
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull [_CullMode]
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
  GpuProgramID 36400
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
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
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_5.zw = _glesVertex.zw;
  highp vec2 tmpvar_7;
  highp float scale_8;
  highp vec2 pixelSize_9;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_10).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_11;
  tmpvar_11.x = _ScaleX;
  tmpvar_11.y = _ScaleY;
  highp mat2 tmpvar_12;
  tmpvar_12[0] = glstate_matrix_projection[0].xy;
  tmpvar_12[1] = glstate_matrix_projection[1].xy;
  pixelSize_9 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_11 * (tmpvar_12 * _ScreenParams.xy)));
  scale_8 = (inversesqrt(dot (pixelSize_9, pixelSize_9)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_13;
  highp float tmpvar_14;
  tmpvar_14 = unity_WorldToObject[0].x;
  v_13.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[1].x;
  v_13.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[2].x;
  v_13.z = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[3].x;
  v_13.w = tmpvar_17;
  highp vec4 v_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[0].y;
  v_18.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[1].y;
  v_18.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[2].y;
  v_18.z = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[3].y;
  v_18.w = tmpvar_22;
  highp vec4 v_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[0].z;
  v_23.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[1].z;
  v_23.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[2].z;
  v_23.z = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[3].z;
  v_23.w = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = mix ((scale_8 * (1.0 - _PerspectiveFilter)), scale_8, abs(dot (
    normalize((((v_13.xyz * tmpvar_6.x) + (v_18.xyz * tmpvar_6.y)) + (v_23.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_8 = tmpvar_28;
  tmpvar_7.y = tmpvar_28;
  tmpvar_7.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 tmpvar_29;
  tmpvar_29.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_29.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp mat3 tmpvar_30;
  tmpvar_30[0] = _EnvMatrix[0].xyz;
  tmpvar_30[1] = _EnvMatrix[1].xyz;
  tmpvar_30[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_29 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_32;
  tmpvar_32 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp vec4 v_33;
  v_33.x = tmpvar_14;
  v_33.y = tmpvar_15;
  v_33.z = tmpvar_16;
  v_33.w = tmpvar_17;
  highp vec4 v_34;
  v_34.x = tmpvar_19;
  v_34.y = tmpvar_20;
  v_34.z = tmpvar_21;
  v_34.w = tmpvar_22;
  highp vec4 v_35;
  v_35.x = tmpvar_24;
  v_35.y = tmpvar_25;
  v_35.z = tmpvar_26;
  v_35.w = tmpvar_27;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  tmpvar_41.w = tmpvar_32.x;
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  tmpvar_42.w = tmpvar_32.y;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  tmpvar_43.w = tmpvar_32.z;
  mediump vec3 normal_44;
  normal_44 = worldNormal_3;
  mediump vec3 x1_45;
  mediump vec4 tmpvar_46;
  tmpvar_46 = (normal_44.xyzz * normal_44.yzzx);
  x1_45.x = dot (unity_SHBr, tmpvar_46);
  x1_45.y = dot (unity_SHBg, tmpvar_46);
  x1_45.z = dot (unity_SHBb, tmpvar_46);
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD6 = (x1_45 + (unity_SHC.xyz * (
    (normal_44.x * normal_44.x)
   - 
    (normal_44.y * normal_44.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp vec4 _LightColor0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  highp vec4 outlineColor_9;
  highp vec4 faceColor_10;
  highp float c_11;
  lowp float tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (((
    (0.5 - c_11)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_14;
  tmpvar_14 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_15;
  tmpvar_15 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_10 = _FaceColor;
  outlineColor_9 = _OutlineColor;
  faceColor_10 = (faceColor_10 * xlv_COLOR0);
  outlineColor_9.w = (outlineColor_9.w * xlv_COLOR0.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_16.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_FaceTex, tmpvar_16);
  faceColor_10 = (faceColor_10 * tmpvar_17);
  highp vec2 tmpvar_18;
  tmpvar_18.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_18.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_OutlineTex, tmpvar_18);
  outlineColor_9 = (outlineColor_9 * tmpvar_19);
  mediump float d_20;
  d_20 = tmpvar_13;
  lowp vec4 faceColor_21;
  faceColor_21 = faceColor_10;
  lowp vec4 outlineColor_22;
  outlineColor_22 = outlineColor_9;
  mediump float outline_23;
  outline_23 = tmpvar_14;
  mediump float softness_24;
  softness_24 = tmpvar_15;
  mediump float tmpvar_25;
  tmpvar_25 = (1.0 - clamp ((
    ((d_20 - (outline_23 * 0.5)) + (softness_24 * 0.5))
   / 
    (1.0 + softness_24)
  ), 0.0, 1.0));
  faceColor_21.xyz = (faceColor_21.xyz * faceColor_21.w);
  outlineColor_22.xyz = (outlineColor_22.xyz * outlineColor_22.w);
  mediump vec4 tmpvar_26;
  tmpvar_26 = mix (faceColor_21, outlineColor_22, vec4((clamp (
    (d_20 + (outline_23 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_23)
  ))));
  faceColor_21 = tmpvar_26;
  faceColor_21 = (faceColor_21 * tmpvar_25);
  faceColor_10 = faceColor_21;
  faceColor_10.xyz = (faceColor_10.xyz / max (faceColor_10.w, 0.0001));
  tmpvar_7 = faceColor_10.xyz;
  tmpvar_8 = faceColor_10.w;
  highp float tmpvar_27;
  tmpvar_27 = xlv_TEXCOORD1.z;
  worldN_3.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = xlv_TEXCOORD2.z;
  worldN_3.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = xlv_TEXCOORD3.z;
  worldN_3.z = tmpvar_29;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_30;
  normalWorld_30 = worldN_3;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normalWorld_30;
  mediump vec3 x_33;
  x_33.x = dot (unity_SHAr, tmpvar_32);
  x_33.y = dot (unity_SHAg, tmpvar_32);
  x_33.z = dot (unity_SHAb, tmpvar_32);
  ambient_31 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_33)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  lowp vec4 c_34;
  lowp vec4 c_35;
  lowp float diff_36;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_36 = tmpvar_37;
  c_35.xyz = ((tmpvar_7 * tmpvar_1) * diff_36);
  c_35.w = tmpvar_8;
  c_34.w = c_35.w;
  c_34.xyz = (c_35.xyz + (tmpvar_7 * ambient_31));
  c_4.w = c_34.w;
  c_4.xyz = c_34.xyz;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
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
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_5.zw = _glesVertex.zw;
  highp vec2 tmpvar_7;
  highp float scale_8;
  highp vec2 pixelSize_9;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_10).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_11;
  tmpvar_11.x = _ScaleX;
  tmpvar_11.y = _ScaleY;
  highp mat2 tmpvar_12;
  tmpvar_12[0] = glstate_matrix_projection[0].xy;
  tmpvar_12[1] = glstate_matrix_projection[1].xy;
  pixelSize_9 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_11 * (tmpvar_12 * _ScreenParams.xy)));
  scale_8 = (inversesqrt(dot (pixelSize_9, pixelSize_9)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_13;
  highp float tmpvar_14;
  tmpvar_14 = unity_WorldToObject[0].x;
  v_13.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[1].x;
  v_13.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[2].x;
  v_13.z = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[3].x;
  v_13.w = tmpvar_17;
  highp vec4 v_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[0].y;
  v_18.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[1].y;
  v_18.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[2].y;
  v_18.z = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[3].y;
  v_18.w = tmpvar_22;
  highp vec4 v_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[0].z;
  v_23.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[1].z;
  v_23.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[2].z;
  v_23.z = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[3].z;
  v_23.w = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = mix ((scale_8 * (1.0 - _PerspectiveFilter)), scale_8, abs(dot (
    normalize((((v_13.xyz * tmpvar_6.x) + (v_18.xyz * tmpvar_6.y)) + (v_23.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_8 = tmpvar_28;
  tmpvar_7.y = tmpvar_28;
  tmpvar_7.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 tmpvar_29;
  tmpvar_29.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_29.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp mat3 tmpvar_30;
  tmpvar_30[0] = _EnvMatrix[0].xyz;
  tmpvar_30[1] = _EnvMatrix[1].xyz;
  tmpvar_30[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_29 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_32;
  tmpvar_32 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp vec4 v_33;
  v_33.x = tmpvar_14;
  v_33.y = tmpvar_15;
  v_33.z = tmpvar_16;
  v_33.w = tmpvar_17;
  highp vec4 v_34;
  v_34.x = tmpvar_19;
  v_34.y = tmpvar_20;
  v_34.z = tmpvar_21;
  v_34.w = tmpvar_22;
  highp vec4 v_35;
  v_35.x = tmpvar_24;
  v_35.y = tmpvar_25;
  v_35.z = tmpvar_26;
  v_35.w = tmpvar_27;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  tmpvar_41.w = tmpvar_32.x;
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  tmpvar_42.w = tmpvar_32.y;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  tmpvar_43.w = tmpvar_32.z;
  mediump vec3 normal_44;
  normal_44 = worldNormal_3;
  mediump vec3 x1_45;
  mediump vec4 tmpvar_46;
  tmpvar_46 = (normal_44.xyzz * normal_44.yzzx);
  x1_45.x = dot (unity_SHBr, tmpvar_46);
  x1_45.y = dot (unity_SHBg, tmpvar_46);
  x1_45.z = dot (unity_SHBb, tmpvar_46);
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD6 = (x1_45 + (unity_SHC.xyz * (
    (normal_44.x * normal_44.x)
   - 
    (normal_44.y * normal_44.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp vec4 _LightColor0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  highp vec4 outlineColor_9;
  highp vec4 faceColor_10;
  highp float c_11;
  lowp float tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (((
    (0.5 - c_11)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_14;
  tmpvar_14 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_15;
  tmpvar_15 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_10 = _FaceColor;
  outlineColor_9 = _OutlineColor;
  faceColor_10 = (faceColor_10 * xlv_COLOR0);
  outlineColor_9.w = (outlineColor_9.w * xlv_COLOR0.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_16.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_FaceTex, tmpvar_16);
  faceColor_10 = (faceColor_10 * tmpvar_17);
  highp vec2 tmpvar_18;
  tmpvar_18.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_18.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_OutlineTex, tmpvar_18);
  outlineColor_9 = (outlineColor_9 * tmpvar_19);
  mediump float d_20;
  d_20 = tmpvar_13;
  lowp vec4 faceColor_21;
  faceColor_21 = faceColor_10;
  lowp vec4 outlineColor_22;
  outlineColor_22 = outlineColor_9;
  mediump float outline_23;
  outline_23 = tmpvar_14;
  mediump float softness_24;
  softness_24 = tmpvar_15;
  mediump float tmpvar_25;
  tmpvar_25 = (1.0 - clamp ((
    ((d_20 - (outline_23 * 0.5)) + (softness_24 * 0.5))
   / 
    (1.0 + softness_24)
  ), 0.0, 1.0));
  faceColor_21.xyz = (faceColor_21.xyz * faceColor_21.w);
  outlineColor_22.xyz = (outlineColor_22.xyz * outlineColor_22.w);
  mediump vec4 tmpvar_26;
  tmpvar_26 = mix (faceColor_21, outlineColor_22, vec4((clamp (
    (d_20 + (outline_23 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_23)
  ))));
  faceColor_21 = tmpvar_26;
  faceColor_21 = (faceColor_21 * tmpvar_25);
  faceColor_10 = faceColor_21;
  faceColor_10.xyz = (faceColor_10.xyz / max (faceColor_10.w, 0.0001));
  tmpvar_7 = faceColor_10.xyz;
  tmpvar_8 = faceColor_10.w;
  highp float tmpvar_27;
  tmpvar_27 = xlv_TEXCOORD1.z;
  worldN_3.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = xlv_TEXCOORD2.z;
  worldN_3.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = xlv_TEXCOORD3.z;
  worldN_3.z = tmpvar_29;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_30;
  normalWorld_30 = worldN_3;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normalWorld_30;
  mediump vec3 x_33;
  x_33.x = dot (unity_SHAr, tmpvar_32);
  x_33.y = dot (unity_SHAg, tmpvar_32);
  x_33.z = dot (unity_SHAb, tmpvar_32);
  ambient_31 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_33)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  lowp vec4 c_34;
  lowp vec4 c_35;
  lowp float diff_36;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_36 = tmpvar_37;
  c_35.xyz = ((tmpvar_7 * tmpvar_1) * diff_36);
  c_35.w = tmpvar_8;
  c_34.w = c_35.w;
  c_34.xyz = (c_35.xyz + (tmpvar_7 * ambient_31));
  c_4.w = c_34.w;
  c_4.xyz = c_34.xyz;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
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
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_5.zw = _glesVertex.zw;
  highp vec2 tmpvar_7;
  highp float scale_8;
  highp vec2 pixelSize_9;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_10).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_11;
  tmpvar_11.x = _ScaleX;
  tmpvar_11.y = _ScaleY;
  highp mat2 tmpvar_12;
  tmpvar_12[0] = glstate_matrix_projection[0].xy;
  tmpvar_12[1] = glstate_matrix_projection[1].xy;
  pixelSize_9 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_11 * (tmpvar_12 * _ScreenParams.xy)));
  scale_8 = (inversesqrt(dot (pixelSize_9, pixelSize_9)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_13;
  highp float tmpvar_14;
  tmpvar_14 = unity_WorldToObject[0].x;
  v_13.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[1].x;
  v_13.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[2].x;
  v_13.z = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[3].x;
  v_13.w = tmpvar_17;
  highp vec4 v_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[0].y;
  v_18.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[1].y;
  v_18.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[2].y;
  v_18.z = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[3].y;
  v_18.w = tmpvar_22;
  highp vec4 v_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[0].z;
  v_23.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[1].z;
  v_23.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[2].z;
  v_23.z = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[3].z;
  v_23.w = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = mix ((scale_8 * (1.0 - _PerspectiveFilter)), scale_8, abs(dot (
    normalize((((v_13.xyz * tmpvar_6.x) + (v_18.xyz * tmpvar_6.y)) + (v_23.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_8 = tmpvar_28;
  tmpvar_7.y = tmpvar_28;
  tmpvar_7.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 tmpvar_29;
  tmpvar_29.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_29.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp mat3 tmpvar_30;
  tmpvar_30[0] = _EnvMatrix[0].xyz;
  tmpvar_30[1] = _EnvMatrix[1].xyz;
  tmpvar_30[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_29 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_32;
  tmpvar_32 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp vec4 v_33;
  v_33.x = tmpvar_14;
  v_33.y = tmpvar_15;
  v_33.z = tmpvar_16;
  v_33.w = tmpvar_17;
  highp vec4 v_34;
  v_34.x = tmpvar_19;
  v_34.y = tmpvar_20;
  v_34.z = tmpvar_21;
  v_34.w = tmpvar_22;
  highp vec4 v_35;
  v_35.x = tmpvar_24;
  v_35.y = tmpvar_25;
  v_35.z = tmpvar_26;
  v_35.w = tmpvar_27;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  tmpvar_41.w = tmpvar_32.x;
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  tmpvar_42.w = tmpvar_32.y;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  tmpvar_43.w = tmpvar_32.z;
  mediump vec3 normal_44;
  normal_44 = worldNormal_3;
  mediump vec3 x1_45;
  mediump vec4 tmpvar_46;
  tmpvar_46 = (normal_44.xyzz * normal_44.yzzx);
  x1_45.x = dot (unity_SHBr, tmpvar_46);
  x1_45.y = dot (unity_SHBg, tmpvar_46);
  x1_45.z = dot (unity_SHBb, tmpvar_46);
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_7;
  xlv_TEXCOORD5 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD6 = (x1_45 + (unity_SHC.xyz * (
    (normal_44.x * normal_44.x)
   - 
    (normal_44.y * normal_44.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp vec4 _LightColor0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  highp vec4 outlineColor_9;
  highp vec4 faceColor_10;
  highp float c_11;
  lowp float tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (((
    (0.5 - c_11)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_14;
  tmpvar_14 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_15;
  tmpvar_15 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_10 = _FaceColor;
  outlineColor_9 = _OutlineColor;
  faceColor_10 = (faceColor_10 * xlv_COLOR0);
  outlineColor_9.w = (outlineColor_9.w * xlv_COLOR0.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_16.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_FaceTex, tmpvar_16);
  faceColor_10 = (faceColor_10 * tmpvar_17);
  highp vec2 tmpvar_18;
  tmpvar_18.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_18.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_OutlineTex, tmpvar_18);
  outlineColor_9 = (outlineColor_9 * tmpvar_19);
  mediump float d_20;
  d_20 = tmpvar_13;
  lowp vec4 faceColor_21;
  faceColor_21 = faceColor_10;
  lowp vec4 outlineColor_22;
  outlineColor_22 = outlineColor_9;
  mediump float outline_23;
  outline_23 = tmpvar_14;
  mediump float softness_24;
  softness_24 = tmpvar_15;
  mediump float tmpvar_25;
  tmpvar_25 = (1.0 - clamp ((
    ((d_20 - (outline_23 * 0.5)) + (softness_24 * 0.5))
   / 
    (1.0 + softness_24)
  ), 0.0, 1.0));
  faceColor_21.xyz = (faceColor_21.xyz * faceColor_21.w);
  outlineColor_22.xyz = (outlineColor_22.xyz * outlineColor_22.w);
  mediump vec4 tmpvar_26;
  tmpvar_26 = mix (faceColor_21, outlineColor_22, vec4((clamp (
    (d_20 + (outline_23 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_23)
  ))));
  faceColor_21 = tmpvar_26;
  faceColor_21 = (faceColor_21 * tmpvar_25);
  faceColor_10 = faceColor_21;
  faceColor_10.xyz = (faceColor_10.xyz / max (faceColor_10.w, 0.0001));
  tmpvar_7 = faceColor_10.xyz;
  tmpvar_8 = faceColor_10.w;
  highp float tmpvar_27;
  tmpvar_27 = xlv_TEXCOORD1.z;
  worldN_3.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = xlv_TEXCOORD2.z;
  worldN_3.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = xlv_TEXCOORD3.z;
  worldN_3.z = tmpvar_29;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_30;
  normalWorld_30 = worldN_3;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normalWorld_30;
  mediump vec3 x_33;
  x_33.x = dot (unity_SHAr, tmpvar_32);
  x_33.y = dot (unity_SHAg, tmpvar_32);
  x_33.z = dot (unity_SHAb, tmpvar_32);
  ambient_31 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_33)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  lowp vec4 c_34;
  lowp vec4 c_35;
  lowp float diff_36;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_36 = tmpvar_37;
  c_35.xyz = ((tmpvar_7 * tmpvar_1) * diff_36);
  c_35.w = tmpvar_8;
  c_34.w = c_35.w;
  c_34.xyz = (c_35.xyz + (tmpvar_7 * ambient_31));
  c_4.w = c_34.w;
  c_4.xyz = c_34.xyz;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	float _FaceDilate;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in lowp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
float u_xlat14;
int u_xlati14;
vec2 u_xlat15;
float u_xlat21;
int u_xlati21;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat21 = floor(in_TEXCOORD1.x);
    u_xlat15.x = u_xlat21 * _FaceTex_ST.x;
    u_xlat21 = fract(in_TEXCOORD1.x);
    u_xlat15.y = u_xlat21 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat15.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat14 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat14; u_xlati21 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati21 = int((0.0<u_xlat14) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat14<0.0; u_xlati14 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati14 = int((u_xlat14<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati14 = (-u_xlati21) + u_xlati14;
    u_xlat14 = float(u_xlati14);
    u_xlat1.xyz = vec3(u_xlat14) * in_NORMAL0.xyz;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.zw = hlslcc_mtx4unity_WorldToObject[2].yy;
    u_xlat2 = u_xlat1.yyyy * u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].xx;
    u_xlat2 = u_xlat3 * u_xlat1.xxxx + u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].zz;
    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat2;
    u_xlat14 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat1 = vec4(u_xlat14) * u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat2.xyz = vec3(u_xlat14) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.wxy * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.ywx * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat14 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat14) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.z = u_xlat1.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    vs_TEXCOORD1.w = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD2.w = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat1.w;
    vs_TEXCOORD3.w = u_xlat3.z;
    u_xlat2.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat7.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat7.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat7.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat7.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat7.xy;
    u_xlat7.xy = vec2(u_xlat7.x * float(_ScaleX), u_xlat7.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat7.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * 1.5;
    u_xlat14 = (-_PerspectiveFilter) + 1.0;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat7.x);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat2.xyz;
    u_xlat14 = dot(u_xlat1.xyw, u_xlat3.xyz);
    vs_TEXCOORD4.y = abs(u_xlat14) * u_xlat0.x + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat7.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat7.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD4.x = u_xlat7.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    u_xlat16_5 = u_xlat1.y * u_xlat1.y;
    u_xlat16_5 = u_xlat1.x * u_xlat1.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat1.ywzx * u_xlat1;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	lowp vec4 _LightColor0;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
float u_xlat11;
mediump float u_xlat16_17;
vec2 u_xlat18;
mediump float u_xlat16_25;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.x = (-u_xlat10_0.x) + 0.5;
    u_xlat0.x = u_xlat16_0.x + (-vs_TEXCOORD4.x);
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD4.y + 0.5;
    u_xlat8 = _OutlineWidth * _ScaleRatioA;
    u_xlat8 = u_xlat8 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat8 * 0.5 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = (-u_xlat8) * 0.5 + u_xlat0.x;
    u_xlat16_17 = min(u_xlat8, 1.0);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_1.x = u_xlat16_17 * u_xlat16_1.x;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat18.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat18.xy);
    u_xlat16_4 = vs_COLOR0 * _FaceColor;
    u_xlat16_5 = u_xlat10_3 * u_xlat16_4;
    u_xlat10_6.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + (-u_xlat10_6.xyz);
    u_xlat16_6.w = u_xlat16_2.x * u_xlat10_0.w + (-u_xlat16_5.w);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_6;
    u_xlat16_2.w = u_xlat16_4.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_5.www + u_xlat16_0.xyz;
    u_xlat3 = _OutlineSoftness * _ScaleRatioA;
    u_xlat11 = u_xlat3 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat3 * vs_TEXCOORD4.y + 1.0;
    u_xlat16_9 = u_xlat11 * 0.5 + u_xlat16_9;
    u_xlat16_1.x = u_xlat16_9 / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_3.x = max(u_xlat16_0.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xxx;
    u_xlat16_1.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_25 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_25) + u_xlat16_7.xyz;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	float _FaceDilate;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in lowp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
float u_xlat14;
int u_xlati14;
vec2 u_xlat15;
float u_xlat21;
int u_xlati21;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat21 = floor(in_TEXCOORD1.x);
    u_xlat15.x = u_xlat21 * _FaceTex_ST.x;
    u_xlat21 = fract(in_TEXCOORD1.x);
    u_xlat15.y = u_xlat21 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat15.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat14 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat14; u_xlati21 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati21 = int((0.0<u_xlat14) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat14<0.0; u_xlati14 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati14 = int((u_xlat14<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati14 = (-u_xlati21) + u_xlati14;
    u_xlat14 = float(u_xlati14);
    u_xlat1.xyz = vec3(u_xlat14) * in_NORMAL0.xyz;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.zw = hlslcc_mtx4unity_WorldToObject[2].yy;
    u_xlat2 = u_xlat1.yyyy * u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].xx;
    u_xlat2 = u_xlat3 * u_xlat1.xxxx + u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].zz;
    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat2;
    u_xlat14 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat1 = vec4(u_xlat14) * u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat2.xyz = vec3(u_xlat14) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.wxy * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.ywx * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat14 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat14) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.z = u_xlat1.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    vs_TEXCOORD1.w = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD2.w = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat1.w;
    vs_TEXCOORD3.w = u_xlat3.z;
    u_xlat2.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat7.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat7.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat7.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat7.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat7.xy;
    u_xlat7.xy = vec2(u_xlat7.x * float(_ScaleX), u_xlat7.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat7.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * 1.5;
    u_xlat14 = (-_PerspectiveFilter) + 1.0;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat7.x);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat2.xyz;
    u_xlat14 = dot(u_xlat1.xyw, u_xlat3.xyz);
    vs_TEXCOORD4.y = abs(u_xlat14) * u_xlat0.x + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat7.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat7.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD4.x = u_xlat7.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    u_xlat16_5 = u_xlat1.y * u_xlat1.y;
    u_xlat16_5 = u_xlat1.x * u_xlat1.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat1.ywzx * u_xlat1;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	lowp vec4 _LightColor0;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
float u_xlat11;
mediump float u_xlat16_17;
vec2 u_xlat18;
mediump float u_xlat16_25;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.x = (-u_xlat10_0.x) + 0.5;
    u_xlat0.x = u_xlat16_0.x + (-vs_TEXCOORD4.x);
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD4.y + 0.5;
    u_xlat8 = _OutlineWidth * _ScaleRatioA;
    u_xlat8 = u_xlat8 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat8 * 0.5 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = (-u_xlat8) * 0.5 + u_xlat0.x;
    u_xlat16_17 = min(u_xlat8, 1.0);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_1.x = u_xlat16_17 * u_xlat16_1.x;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat18.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat18.xy);
    u_xlat16_4 = vs_COLOR0 * _FaceColor;
    u_xlat16_5 = u_xlat10_3 * u_xlat16_4;
    u_xlat10_6.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + (-u_xlat10_6.xyz);
    u_xlat16_6.w = u_xlat16_2.x * u_xlat10_0.w + (-u_xlat16_5.w);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_6;
    u_xlat16_2.w = u_xlat16_4.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_5.www + u_xlat16_0.xyz;
    u_xlat3 = _OutlineSoftness * _ScaleRatioA;
    u_xlat11 = u_xlat3 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat3 * vs_TEXCOORD4.y + 1.0;
    u_xlat16_9 = u_xlat11 * 0.5 + u_xlat16_9;
    u_xlat16_1.x = u_xlat16_9 / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_3.x = max(u_xlat16_0.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xxx;
    u_xlat16_1.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_25 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_25) + u_xlat16_7.xyz;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	float _FaceDilate;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in lowp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
float u_xlat14;
int u_xlati14;
vec2 u_xlat15;
float u_xlat21;
int u_xlati21;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat21 = floor(in_TEXCOORD1.x);
    u_xlat15.x = u_xlat21 * _FaceTex_ST.x;
    u_xlat21 = fract(in_TEXCOORD1.x);
    u_xlat15.y = u_xlat21 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat15.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat14 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat14; u_xlati21 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati21 = int((0.0<u_xlat14) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat14<0.0; u_xlati14 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati14 = int((u_xlat14<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati14 = (-u_xlati21) + u_xlati14;
    u_xlat14 = float(u_xlati14);
    u_xlat1.xyz = vec3(u_xlat14) * in_NORMAL0.xyz;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.zw = hlslcc_mtx4unity_WorldToObject[2].yy;
    u_xlat2 = u_xlat1.yyyy * u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].xx;
    u_xlat2 = u_xlat3 * u_xlat1.xxxx + u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].zz;
    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat2;
    u_xlat14 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat1 = vec4(u_xlat14) * u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat2.xyz = vec3(u_xlat14) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.wxy * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.ywx * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat14 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat14) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.z = u_xlat1.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    vs_TEXCOORD1.w = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD2.w = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat1.w;
    vs_TEXCOORD3.w = u_xlat3.z;
    u_xlat2.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat7.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat7.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat7.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat7.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat7.xy;
    u_xlat7.xy = vec2(u_xlat7.x * float(_ScaleX), u_xlat7.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat7.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * 1.5;
    u_xlat14 = (-_PerspectiveFilter) + 1.0;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat7.x);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat2.xyz;
    u_xlat14 = dot(u_xlat1.xyw, u_xlat3.xyz);
    vs_TEXCOORD4.y = abs(u_xlat14) * u_xlat0.x + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat7.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat7.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD4.x = u_xlat7.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    u_xlat16_5 = u_xlat1.y * u_xlat1.y;
    u_xlat16_5 = u_xlat1.x * u_xlat1.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat1.ywzx * u_xlat1;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	lowp vec4 _LightColor0;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
float u_xlat11;
mediump float u_xlat16_17;
vec2 u_xlat18;
mediump float u_xlat16_25;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.x = (-u_xlat10_0.x) + 0.5;
    u_xlat0.x = u_xlat16_0.x + (-vs_TEXCOORD4.x);
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD4.y + 0.5;
    u_xlat8 = _OutlineWidth * _ScaleRatioA;
    u_xlat8 = u_xlat8 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat8 * 0.5 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = (-u_xlat8) * 0.5 + u_xlat0.x;
    u_xlat16_17 = min(u_xlat8, 1.0);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_1.x = u_xlat16_17 * u_xlat16_1.x;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat18.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat18.xy);
    u_xlat16_4 = vs_COLOR0 * _FaceColor;
    u_xlat16_5 = u_xlat10_3 * u_xlat16_4;
    u_xlat10_6.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + (-u_xlat10_6.xyz);
    u_xlat16_6.w = u_xlat16_2.x * u_xlat10_0.w + (-u_xlat16_5.w);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_6;
    u_xlat16_2.w = u_xlat16_4.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_5.www + u_xlat16_0.xyz;
    u_xlat3 = _OutlineSoftness * _ScaleRatioA;
    u_xlat11 = u_xlat3 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat3 * vs_TEXCOORD4.y + 1.0;
    u_xlat16_9 = u_xlat11 * 0.5 + u_xlat16_9;
    u_xlat16_1.x = u_xlat16_9 / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_3.x = max(u_xlat16_0.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xxx;
    u_xlat16_1.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_25 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_25) + u_xlat16_7.xyz;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
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
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6.zw = _glesVertex.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_6.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_6).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_7.x) + (v_19.xyz * tmpvar_7.y)) + (v_24.xyz * tmpvar_7.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 tmpvar_30;
  tmpvar_30.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_30.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_30 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_15;
  v_34.y = tmpvar_16;
  v_34.z = tmpvar_17;
  v_34.w = tmpvar_18;
  highp vec4 v_35;
  v_35.x = tmpvar_20;
  v_35.y = tmpvar_21;
  v_35.z = tmpvar_22;
  v_35.w = tmpvar_23;
  highp vec4 v_36;
  v_36.x = tmpvar_25;
  v_36.y = tmpvar_26;
  v_36.z = tmpvar_27;
  v_36.w = tmpvar_28;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * tmpvar_7.x)
   + 
    (v_35.xyz * tmpvar_7.y)
  ) + (v_36.xyz * tmpvar_7.z)));
  worldNormal_3 = tmpvar_37;
  highp mat3 tmpvar_38;
  tmpvar_38[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_38[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_38[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize((tmpvar_38 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.x;
  tmpvar_42.y = tmpvar_41.x;
  tmpvar_42.z = worldNormal_3.x;
  tmpvar_42.w = tmpvar_33.x;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.y;
  tmpvar_43.y = tmpvar_41.y;
  tmpvar_43.z = worldNormal_3.y;
  tmpvar_43.w = tmpvar_33.y;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.z;
  tmpvar_44.y = tmpvar_41.z;
  tmpvar_44.z = worldNormal_3.z;
  tmpvar_44.w = tmpvar_33.z;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_3;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_5 = col_51;
  mediump vec3 normal_59;
  normal_59 = worldNormal_3;
  mediump vec3 ambient_60;
  ambient_60 = (tmpvar_5 * ((tmpvar_5 * 
    ((tmpvar_5 * 0.305306) + 0.6821711)
  ) + 0.01252288));
  mediump vec3 x1_61;
  mediump vec4 tmpvar_62;
  tmpvar_62 = (normal_59.xyzz * normal_59.yzzx);
  x1_61.x = dot (unity_SHBr, tmpvar_62);
  x1_61.y = dot (unity_SHBg, tmpvar_62);
  x1_61.z = dot (unity_SHBb, tmpvar_62);
  ambient_60 = (ambient_60 + (x1_61 + (unity_SHC.xyz * 
    ((normal_59.x * normal_59.x) - (normal_59.y * normal_59.y))
  )));
  tmpvar_5 = ambient_60;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_42;
  xlv_TEXCOORD2 = tmpvar_43;
  xlv_TEXCOORD3 = tmpvar_44;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_8;
  xlv_TEXCOORD5 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD6 = ambient_60;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp vec4 _LightColor0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  highp vec4 outlineColor_9;
  highp vec4 faceColor_10;
  highp float c_11;
  lowp float tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (((
    (0.5 - c_11)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_14;
  tmpvar_14 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_15;
  tmpvar_15 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_10 = _FaceColor;
  outlineColor_9 = _OutlineColor;
  faceColor_10 = (faceColor_10 * xlv_COLOR0);
  outlineColor_9.w = (outlineColor_9.w * xlv_COLOR0.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_16.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_FaceTex, tmpvar_16);
  faceColor_10 = (faceColor_10 * tmpvar_17);
  highp vec2 tmpvar_18;
  tmpvar_18.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_18.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_OutlineTex, tmpvar_18);
  outlineColor_9 = (outlineColor_9 * tmpvar_19);
  mediump float d_20;
  d_20 = tmpvar_13;
  lowp vec4 faceColor_21;
  faceColor_21 = faceColor_10;
  lowp vec4 outlineColor_22;
  outlineColor_22 = outlineColor_9;
  mediump float outline_23;
  outline_23 = tmpvar_14;
  mediump float softness_24;
  softness_24 = tmpvar_15;
  mediump float tmpvar_25;
  tmpvar_25 = (1.0 - clamp ((
    ((d_20 - (outline_23 * 0.5)) + (softness_24 * 0.5))
   / 
    (1.0 + softness_24)
  ), 0.0, 1.0));
  faceColor_21.xyz = (faceColor_21.xyz * faceColor_21.w);
  outlineColor_22.xyz = (outlineColor_22.xyz * outlineColor_22.w);
  mediump vec4 tmpvar_26;
  tmpvar_26 = mix (faceColor_21, outlineColor_22, vec4((clamp (
    (d_20 + (outline_23 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_23)
  ))));
  faceColor_21 = tmpvar_26;
  faceColor_21 = (faceColor_21 * tmpvar_25);
  faceColor_10 = faceColor_21;
  faceColor_10.xyz = (faceColor_10.xyz / max (faceColor_10.w, 0.0001));
  tmpvar_7 = faceColor_10.xyz;
  tmpvar_8 = faceColor_10.w;
  highp float tmpvar_27;
  tmpvar_27 = xlv_TEXCOORD1.z;
  worldN_3.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = xlv_TEXCOORD2.z;
  worldN_3.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = xlv_TEXCOORD3.z;
  worldN_3.z = tmpvar_29;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_30;
  normalWorld_30 = worldN_3;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normalWorld_30;
  mediump vec3 x_33;
  x_33.x = dot (unity_SHAr, tmpvar_32);
  x_33.y = dot (unity_SHAg, tmpvar_32);
  x_33.z = dot (unity_SHAb, tmpvar_32);
  ambient_31 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_33)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  lowp vec4 c_34;
  lowp vec4 c_35;
  lowp float diff_36;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_36 = tmpvar_37;
  c_35.xyz = ((tmpvar_7 * tmpvar_1) * diff_36);
  c_35.w = tmpvar_8;
  c_34.w = c_35.w;
  c_34.xyz = (c_35.xyz + (tmpvar_7 * ambient_31));
  c_4.w = c_34.w;
  c_4.xyz = c_34.xyz;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
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
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6.zw = _glesVertex.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_6.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_6).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_7.x) + (v_19.xyz * tmpvar_7.y)) + (v_24.xyz * tmpvar_7.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 tmpvar_30;
  tmpvar_30.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_30.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_30 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_15;
  v_34.y = tmpvar_16;
  v_34.z = tmpvar_17;
  v_34.w = tmpvar_18;
  highp vec4 v_35;
  v_35.x = tmpvar_20;
  v_35.y = tmpvar_21;
  v_35.z = tmpvar_22;
  v_35.w = tmpvar_23;
  highp vec4 v_36;
  v_36.x = tmpvar_25;
  v_36.y = tmpvar_26;
  v_36.z = tmpvar_27;
  v_36.w = tmpvar_28;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * tmpvar_7.x)
   + 
    (v_35.xyz * tmpvar_7.y)
  ) + (v_36.xyz * tmpvar_7.z)));
  worldNormal_3 = tmpvar_37;
  highp mat3 tmpvar_38;
  tmpvar_38[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_38[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_38[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize((tmpvar_38 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.x;
  tmpvar_42.y = tmpvar_41.x;
  tmpvar_42.z = worldNormal_3.x;
  tmpvar_42.w = tmpvar_33.x;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.y;
  tmpvar_43.y = tmpvar_41.y;
  tmpvar_43.z = worldNormal_3.y;
  tmpvar_43.w = tmpvar_33.y;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.z;
  tmpvar_44.y = tmpvar_41.z;
  tmpvar_44.z = worldNormal_3.z;
  tmpvar_44.w = tmpvar_33.z;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_3;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_5 = col_51;
  mediump vec3 normal_59;
  normal_59 = worldNormal_3;
  mediump vec3 ambient_60;
  ambient_60 = (tmpvar_5 * ((tmpvar_5 * 
    ((tmpvar_5 * 0.305306) + 0.6821711)
  ) + 0.01252288));
  mediump vec3 x1_61;
  mediump vec4 tmpvar_62;
  tmpvar_62 = (normal_59.xyzz * normal_59.yzzx);
  x1_61.x = dot (unity_SHBr, tmpvar_62);
  x1_61.y = dot (unity_SHBg, tmpvar_62);
  x1_61.z = dot (unity_SHBb, tmpvar_62);
  ambient_60 = (ambient_60 + (x1_61 + (unity_SHC.xyz * 
    ((normal_59.x * normal_59.x) - (normal_59.y * normal_59.y))
  )));
  tmpvar_5 = ambient_60;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_42;
  xlv_TEXCOORD2 = tmpvar_43;
  xlv_TEXCOORD3 = tmpvar_44;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_8;
  xlv_TEXCOORD5 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD6 = ambient_60;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp vec4 _LightColor0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  highp vec4 outlineColor_9;
  highp vec4 faceColor_10;
  highp float c_11;
  lowp float tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (((
    (0.5 - c_11)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_14;
  tmpvar_14 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_15;
  tmpvar_15 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_10 = _FaceColor;
  outlineColor_9 = _OutlineColor;
  faceColor_10 = (faceColor_10 * xlv_COLOR0);
  outlineColor_9.w = (outlineColor_9.w * xlv_COLOR0.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_16.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_FaceTex, tmpvar_16);
  faceColor_10 = (faceColor_10 * tmpvar_17);
  highp vec2 tmpvar_18;
  tmpvar_18.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_18.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_OutlineTex, tmpvar_18);
  outlineColor_9 = (outlineColor_9 * tmpvar_19);
  mediump float d_20;
  d_20 = tmpvar_13;
  lowp vec4 faceColor_21;
  faceColor_21 = faceColor_10;
  lowp vec4 outlineColor_22;
  outlineColor_22 = outlineColor_9;
  mediump float outline_23;
  outline_23 = tmpvar_14;
  mediump float softness_24;
  softness_24 = tmpvar_15;
  mediump float tmpvar_25;
  tmpvar_25 = (1.0 - clamp ((
    ((d_20 - (outline_23 * 0.5)) + (softness_24 * 0.5))
   / 
    (1.0 + softness_24)
  ), 0.0, 1.0));
  faceColor_21.xyz = (faceColor_21.xyz * faceColor_21.w);
  outlineColor_22.xyz = (outlineColor_22.xyz * outlineColor_22.w);
  mediump vec4 tmpvar_26;
  tmpvar_26 = mix (faceColor_21, outlineColor_22, vec4((clamp (
    (d_20 + (outline_23 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_23)
  ))));
  faceColor_21 = tmpvar_26;
  faceColor_21 = (faceColor_21 * tmpvar_25);
  faceColor_10 = faceColor_21;
  faceColor_10.xyz = (faceColor_10.xyz / max (faceColor_10.w, 0.0001));
  tmpvar_7 = faceColor_10.xyz;
  tmpvar_8 = faceColor_10.w;
  highp float tmpvar_27;
  tmpvar_27 = xlv_TEXCOORD1.z;
  worldN_3.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = xlv_TEXCOORD2.z;
  worldN_3.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = xlv_TEXCOORD3.z;
  worldN_3.z = tmpvar_29;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_30;
  normalWorld_30 = worldN_3;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normalWorld_30;
  mediump vec3 x_33;
  x_33.x = dot (unity_SHAr, tmpvar_32);
  x_33.y = dot (unity_SHAg, tmpvar_32);
  x_33.z = dot (unity_SHAb, tmpvar_32);
  ambient_31 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_33)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  lowp vec4 c_34;
  lowp vec4 c_35;
  lowp float diff_36;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_36 = tmpvar_37;
  c_35.xyz = ((tmpvar_7 * tmpvar_1) * diff_36);
  c_35.w = tmpvar_8;
  c_34.w = c_35.w;
  c_34.xyz = (c_35.xyz + (tmpvar_7 * ambient_31));
  c_4.w = c_34.w;
  c_4.xyz = c_34.xyz;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
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
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6.zw = _glesVertex.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_6.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_6).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_7.x) + (v_19.xyz * tmpvar_7.y)) + (v_24.xyz * tmpvar_7.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 tmpvar_30;
  tmpvar_30.x = ((floor(_glesMultiTexCoord1.x) * 5.0) / 4096.0);
  tmpvar_30.y = (fract(_glesMultiTexCoord1.x) * 5.0);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_30 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_15;
  v_34.y = tmpvar_16;
  v_34.z = tmpvar_17;
  v_34.w = tmpvar_18;
  highp vec4 v_35;
  v_35.x = tmpvar_20;
  v_35.y = tmpvar_21;
  v_35.z = tmpvar_22;
  v_35.w = tmpvar_23;
  highp vec4 v_36;
  v_36.x = tmpvar_25;
  v_36.y = tmpvar_26;
  v_36.z = tmpvar_27;
  v_36.w = tmpvar_28;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * tmpvar_7.x)
   + 
    (v_35.xyz * tmpvar_7.y)
  ) + (v_36.xyz * tmpvar_7.z)));
  worldNormal_3 = tmpvar_37;
  highp mat3 tmpvar_38;
  tmpvar_38[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_38[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_38[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize((tmpvar_38 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.x;
  tmpvar_42.y = tmpvar_41.x;
  tmpvar_42.z = worldNormal_3.x;
  tmpvar_42.w = tmpvar_33.x;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.y;
  tmpvar_43.y = tmpvar_41.y;
  tmpvar_43.z = worldNormal_3.y;
  tmpvar_43.w = tmpvar_33.y;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.z;
  tmpvar_44.y = tmpvar_41.z;
  tmpvar_44.z = worldNormal_3.z;
  tmpvar_44.w = tmpvar_33.z;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_3;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_5 = col_51;
  mediump vec3 normal_59;
  normal_59 = worldNormal_3;
  mediump vec3 ambient_60;
  ambient_60 = (tmpvar_5 * ((tmpvar_5 * 
    ((tmpvar_5 * 0.305306) + 0.6821711)
  ) + 0.01252288));
  mediump vec3 x1_61;
  mediump vec4 tmpvar_62;
  tmpvar_62 = (normal_59.xyzz * normal_59.yzzx);
  x1_61.x = dot (unity_SHBr, tmpvar_62);
  x1_61.y = dot (unity_SHBg, tmpvar_62);
  x1_61.z = dot (unity_SHBb, tmpvar_62);
  ambient_60 = (ambient_60 + (x1_61 + (unity_SHC.xyz * 
    ((normal_59.x * normal_59.x) - (normal_59.y * normal_59.y))
  )));
  tmpvar_5 = ambient_60;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_42;
  xlv_TEXCOORD2 = tmpvar_43;
  xlv_TEXCOORD3 = tmpvar_44;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_8;
  xlv_TEXCOORD5 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD6 = ambient_60;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform lowp vec4 _LightColor0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 lightDir_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = _WorldSpaceLightPos0.xyz;
  lightDir_5 = tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  highp vec4 outlineColor_9;
  highp vec4 faceColor_10;
  highp float c_11;
  lowp float tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_11 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (((
    (0.5 - c_11)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_14;
  tmpvar_14 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_15;
  tmpvar_15 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_10 = _FaceColor;
  outlineColor_9 = _OutlineColor;
  faceColor_10 = (faceColor_10 * xlv_COLOR0);
  outlineColor_9.w = (outlineColor_9.w * xlv_COLOR0.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_16.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_FaceTex, tmpvar_16);
  faceColor_10 = (faceColor_10 * tmpvar_17);
  highp vec2 tmpvar_18;
  tmpvar_18.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_18.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_OutlineTex, tmpvar_18);
  outlineColor_9 = (outlineColor_9 * tmpvar_19);
  mediump float d_20;
  d_20 = tmpvar_13;
  lowp vec4 faceColor_21;
  faceColor_21 = faceColor_10;
  lowp vec4 outlineColor_22;
  outlineColor_22 = outlineColor_9;
  mediump float outline_23;
  outline_23 = tmpvar_14;
  mediump float softness_24;
  softness_24 = tmpvar_15;
  mediump float tmpvar_25;
  tmpvar_25 = (1.0 - clamp ((
    ((d_20 - (outline_23 * 0.5)) + (softness_24 * 0.5))
   / 
    (1.0 + softness_24)
  ), 0.0, 1.0));
  faceColor_21.xyz = (faceColor_21.xyz * faceColor_21.w);
  outlineColor_22.xyz = (outlineColor_22.xyz * outlineColor_22.w);
  mediump vec4 tmpvar_26;
  tmpvar_26 = mix (faceColor_21, outlineColor_22, vec4((clamp (
    (d_20 + (outline_23 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_23)
  ))));
  faceColor_21 = tmpvar_26;
  faceColor_21 = (faceColor_21 * tmpvar_25);
  faceColor_10 = faceColor_21;
  faceColor_10.xyz = (faceColor_10.xyz / max (faceColor_10.w, 0.0001));
  tmpvar_7 = faceColor_10.xyz;
  tmpvar_8 = faceColor_10.w;
  highp float tmpvar_27;
  tmpvar_27 = xlv_TEXCOORD1.z;
  worldN_3.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = xlv_TEXCOORD2.z;
  worldN_3.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = xlv_TEXCOORD3.z;
  worldN_3.z = tmpvar_29;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_5;
  mediump vec3 normalWorld_30;
  normalWorld_30 = worldN_3;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normalWorld_30;
  mediump vec3 x_33;
  x_33.x = dot (unity_SHAr, tmpvar_32);
  x_33.y = dot (unity_SHAg, tmpvar_32);
  x_33.z = dot (unity_SHAb, tmpvar_32);
  ambient_31 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_33)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  lowp vec4 c_34;
  lowp vec4 c_35;
  lowp float diff_36;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_36 = tmpvar_37;
  c_35.xyz = ((tmpvar_7 * tmpvar_1) * diff_36);
  c_35.w = tmpvar_8;
  c_34.w = c_35.w;
  c_34.xyz = (c_35.xyz + (tmpvar_7 * ambient_31));
  c_4.w = c_34.w;
  c_4.xyz = c_34.xyz;
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	float _FaceDilate;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in lowp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
float u_xlat16;
int u_xlati16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
int u_xlati24;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat24 = floor(in_TEXCOORD1.x);
    u_xlat17.x = u_xlat24 * _FaceTex_ST.x;
    u_xlat24 = fract(in_TEXCOORD1.x);
    u_xlat17.y = u_xlat24 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat17.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat16 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat16; u_xlati24 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati24 = int((0.0<u_xlat16) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat16<0.0; u_xlati16 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati16 = int((u_xlat16<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati16 = (-u_xlati24) + u_xlati16;
    u_xlat16 = float(u_xlati16);
    u_xlat1.xyz = vec3(u_xlat16) * in_NORMAL0.xyz;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.zw = hlslcc_mtx4unity_WorldToObject[2].yy;
    u_xlat2 = u_xlat1.yyyy * u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].xx;
    u_xlat2 = u_xlat3 * u_xlat1.xxxx + u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].zz;
    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat2;
    u_xlat16 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1 = vec4(u_xlat16) * u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.wxy * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.ywx * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat16 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat16) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.z = u_xlat1.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    vs_TEXCOORD1.w = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD2.w = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat1.w;
    vs_TEXCOORD3.w = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb16 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat24 = (-_WeightNormal) + _WeightBold;
    u_xlat16 = u_xlat16 * u_xlat24 + _WeightNormal;
    u_xlat16 = u_xlat16 / _GradientScale;
    u_xlat24 = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD4.x = u_xlat24 * 0.5 + u_xlat16;
    u_xlat8.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat8.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = vec2(u_xlat8.x * float(_ScaleX), u_xlat8.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat8.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * 1.5;
    u_xlat16 = (-_PerspectiveFilter) + 1.0;
    u_xlat8.x = u_xlat16 * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat8.x);
    u_xlat2.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat5.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat16 = dot(u_xlat1.xyw, u_xlat5.xyz);
    vs_TEXCOORD4.y = abs(u_xlat16) * u_xlat0.x + u_xlat8.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    u_xlat0 = (-u_xlat3.yyyy) + unity_4LightPosY0;
    u_xlat2 = u_xlat1.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat3.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
    u_xlat2 = u_xlat4 * u_xlat1.xxxx + u_xlat2;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat3 * u_xlat3 + u_xlat0;
    u_xlat2 = u_xlat3 * u_xlat1.wwzw + u_xlat2;
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
    u_xlat16_1 = u_xlat1.ywzx * u_xlat1;
    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_6.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	lowp vec4 _LightColor0;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
float u_xlat11;
mediump float u_xlat16_17;
vec2 u_xlat18;
mediump float u_xlat16_25;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.x = (-u_xlat10_0.x) + 0.5;
    u_xlat0.x = u_xlat16_0.x + (-vs_TEXCOORD4.x);
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD4.y + 0.5;
    u_xlat8 = _OutlineWidth * _ScaleRatioA;
    u_xlat8 = u_xlat8 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat8 * 0.5 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = (-u_xlat8) * 0.5 + u_xlat0.x;
    u_xlat16_17 = min(u_xlat8, 1.0);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_1.x = u_xlat16_17 * u_xlat16_1.x;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat18.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat18.xy);
    u_xlat16_4 = vs_COLOR0 * _FaceColor;
    u_xlat16_5 = u_xlat10_3 * u_xlat16_4;
    u_xlat10_6.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + (-u_xlat10_6.xyz);
    u_xlat16_6.w = u_xlat16_2.x * u_xlat10_0.w + (-u_xlat16_5.w);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_6;
    u_xlat16_2.w = u_xlat16_4.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_5.www + u_xlat16_0.xyz;
    u_xlat3 = _OutlineSoftness * _ScaleRatioA;
    u_xlat11 = u_xlat3 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat3 * vs_TEXCOORD4.y + 1.0;
    u_xlat16_9 = u_xlat11 * 0.5 + u_xlat16_9;
    u_xlat16_1.x = u_xlat16_9 / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_3.x = max(u_xlat16_0.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xxx;
    u_xlat16_1.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_25 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_25) + u_xlat16_7.xyz;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	float _FaceDilate;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in lowp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
float u_xlat16;
int u_xlati16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
int u_xlati24;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat24 = floor(in_TEXCOORD1.x);
    u_xlat17.x = u_xlat24 * _FaceTex_ST.x;
    u_xlat24 = fract(in_TEXCOORD1.x);
    u_xlat17.y = u_xlat24 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat17.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat16 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat16; u_xlati24 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati24 = int((0.0<u_xlat16) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat16<0.0; u_xlati16 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati16 = int((u_xlat16<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati16 = (-u_xlati24) + u_xlati16;
    u_xlat16 = float(u_xlati16);
    u_xlat1.xyz = vec3(u_xlat16) * in_NORMAL0.xyz;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.zw = hlslcc_mtx4unity_WorldToObject[2].yy;
    u_xlat2 = u_xlat1.yyyy * u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].xx;
    u_xlat2 = u_xlat3 * u_xlat1.xxxx + u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].zz;
    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat2;
    u_xlat16 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1 = vec4(u_xlat16) * u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.wxy * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.ywx * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat16 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat16) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.z = u_xlat1.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    vs_TEXCOORD1.w = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD2.w = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat1.w;
    vs_TEXCOORD3.w = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb16 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat24 = (-_WeightNormal) + _WeightBold;
    u_xlat16 = u_xlat16 * u_xlat24 + _WeightNormal;
    u_xlat16 = u_xlat16 / _GradientScale;
    u_xlat24 = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD4.x = u_xlat24 * 0.5 + u_xlat16;
    u_xlat8.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat8.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = vec2(u_xlat8.x * float(_ScaleX), u_xlat8.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat8.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * 1.5;
    u_xlat16 = (-_PerspectiveFilter) + 1.0;
    u_xlat8.x = u_xlat16 * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat8.x);
    u_xlat2.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat5.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat16 = dot(u_xlat1.xyw, u_xlat5.xyz);
    vs_TEXCOORD4.y = abs(u_xlat16) * u_xlat0.x + u_xlat8.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    u_xlat0 = (-u_xlat3.yyyy) + unity_4LightPosY0;
    u_xlat2 = u_xlat1.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat3.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
    u_xlat2 = u_xlat4 * u_xlat1.xxxx + u_xlat2;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat3 * u_xlat3 + u_xlat0;
    u_xlat2 = u_xlat3 * u_xlat1.wwzw + u_xlat2;
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
    u_xlat16_1 = u_xlat1.ywzx * u_xlat1;
    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_6.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	lowp vec4 _LightColor0;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
float u_xlat11;
mediump float u_xlat16_17;
vec2 u_xlat18;
mediump float u_xlat16_25;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.x = (-u_xlat10_0.x) + 0.5;
    u_xlat0.x = u_xlat16_0.x + (-vs_TEXCOORD4.x);
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD4.y + 0.5;
    u_xlat8 = _OutlineWidth * _ScaleRatioA;
    u_xlat8 = u_xlat8 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat8 * 0.5 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = (-u_xlat8) * 0.5 + u_xlat0.x;
    u_xlat16_17 = min(u_xlat8, 1.0);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_1.x = u_xlat16_17 * u_xlat16_1.x;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat18.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat18.xy);
    u_xlat16_4 = vs_COLOR0 * _FaceColor;
    u_xlat16_5 = u_xlat10_3 * u_xlat16_4;
    u_xlat10_6.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + (-u_xlat10_6.xyz);
    u_xlat16_6.w = u_xlat16_2.x * u_xlat10_0.w + (-u_xlat16_5.w);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_6;
    u_xlat16_2.w = u_xlat16_4.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_5.www + u_xlat16_0.xyz;
    u_xlat3 = _OutlineSoftness * _ScaleRatioA;
    u_xlat11 = u_xlat3 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat3 * vs_TEXCOORD4.y + 1.0;
    u_xlat16_9 = u_xlat11 * 0.5 + u_xlat16_9;
    u_xlat16_1.x = u_xlat16_9 / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_3.x = max(u_xlat16_0.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xxx;
    u_xlat16_1.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_25 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_25) + u_xlat16_7.xyz;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	float _FaceDilate;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in lowp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
float u_xlat16;
int u_xlati16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
int u_xlati24;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat24 = floor(in_TEXCOORD1.x);
    u_xlat17.x = u_xlat24 * _FaceTex_ST.x;
    u_xlat24 = fract(in_TEXCOORD1.x);
    u_xlat17.y = u_xlat24 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat17.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat16 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat16; u_xlati24 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati24 = int((0.0<u_xlat16) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat16<0.0; u_xlati16 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati16 = int((u_xlat16<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati16 = (-u_xlati24) + u_xlati16;
    u_xlat16 = float(u_xlati16);
    u_xlat1.xyz = vec3(u_xlat16) * in_NORMAL0.xyz;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.zw = hlslcc_mtx4unity_WorldToObject[2].yy;
    u_xlat2 = u_xlat1.yyyy * u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].xx;
    u_xlat2 = u_xlat3 * u_xlat1.xxxx + u_xlat2;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat3.zw = hlslcc_mtx4unity_WorldToObject[2].zz;
    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat2;
    u_xlat16 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1 = vec4(u_xlat16) * u_xlat1;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.wxy * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.ywx * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat16 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat16) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.z = u_xlat1.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    vs_TEXCOORD1.w = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD2.w = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat1.w;
    vs_TEXCOORD3.w = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb16 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat24 = (-_WeightNormal) + _WeightBold;
    u_xlat16 = u_xlat16 * u_xlat24 + _WeightNormal;
    u_xlat16 = u_xlat16 / _GradientScale;
    u_xlat24 = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD4.x = u_xlat24 * 0.5 + u_xlat16;
    u_xlat8.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat8.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat8.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat8.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat8.xy;
    u_xlat8.xy = vec2(u_xlat8.x * float(_ScaleX), u_xlat8.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat8.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * 1.5;
    u_xlat16 = (-_PerspectiveFilter) + 1.0;
    u_xlat8.x = u_xlat16 * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat8.x);
    u_xlat2.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat5.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat16 = dot(u_xlat1.xyw, u_xlat5.xyz);
    vs_TEXCOORD4.y = abs(u_xlat16) * u_xlat0.x + u_xlat8.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    u_xlat0 = (-u_xlat3.yyyy) + unity_4LightPosY0;
    u_xlat2 = u_xlat1.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat3.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
    u_xlat2 = u_xlat4 * u_xlat1.xxxx + u_xlat2;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat3 * u_xlat3 + u_xlat0;
    u_xlat2 = u_xlat3 * u_xlat1.wwzw + u_xlat2;
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
    u_xlat16_1 = u_xlat1.ywzx * u_xlat1;
    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_6.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	lowp vec4 _LightColor0;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _ScaleRatioA;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
float u_xlat11;
mediump float u_xlat16_17;
vec2 u_xlat18;
mediump float u_xlat16_25;
void main()
{
    u_xlat10_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.x = (-u_xlat10_0.x) + 0.5;
    u_xlat0.x = u_xlat16_0.x + (-vs_TEXCOORD4.x);
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD4.y + 0.5;
    u_xlat8 = _OutlineWidth * _ScaleRatioA;
    u_xlat8 = u_xlat8 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat8 * 0.5 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = (-u_xlat8) * 0.5 + u_xlat0.x;
    u_xlat16_17 = min(u_xlat8, 1.0);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_1.x = u_xlat16_17 * u_xlat16_1.x;
    u_xlat0.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_0 = texture(_OutlineTex, u_xlat0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat18.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat18.xy);
    u_xlat16_4 = vs_COLOR0 * _FaceColor;
    u_xlat16_5 = u_xlat10_3 * u_xlat16_4;
    u_xlat10_6.xyz = u_xlat16_5.www * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + (-u_xlat10_6.xyz);
    u_xlat16_6.w = u_xlat16_2.x * u_xlat10_0.w + (-u_xlat16_5.w);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_6;
    u_xlat16_2.w = u_xlat16_4.w * u_xlat10_3.w + u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_5.www + u_xlat16_0.xyz;
    u_xlat3 = _OutlineSoftness * _ScaleRatioA;
    u_xlat11 = u_xlat3 * vs_TEXCOORD4.y;
    u_xlat16_1.x = u_xlat3 * vs_TEXCOORD4.y + 1.0;
    u_xlat16_9 = u_xlat11 * 0.5 + u_xlat16_9;
    u_xlat16_1.x = u_xlat16_9 / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_3.x = max(u_xlat16_0.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xxx;
    u_xlat16_1.xyz = u_xlat16_3.xyz * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat2.x = vs_TEXCOORD1.z;
    u_xlat2.y = vs_TEXCOORD2.z;
    u_xlat2.z = vs_TEXCOORD3.z;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_25 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(u_xlat16_25) + u_xlat16_7.xyz;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
}
 }
 Pass {
  Name "CASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true" "RenderType"="Transparent" }
  Cull Off
  ColorMask RGB
  Offset 1.000000, 1.000000
  GpuProgramID 128536
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (glstate_matrix_mvp * tmpvar_2);
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (glstate_matrix_mvp * tmpvar_2);
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (glstate_matrix_mvp * tmpvar_2);
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
float u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat1 = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1;
    u_xlat1 = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
float u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat1 = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1;
    u_xlat1 = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
float u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat1 = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1;
    u_xlat1 = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform lowp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform lowp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform lowp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
 }
}
CustomEditor "TMPro_SDFMaterialEditor"
}