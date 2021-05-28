//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TMPro/Distance Field (Surface)" {
Properties {
 _FaceTex ("Fill Texture", 2D) = "white" { }
 _FaceUVSpeedX ("Face UV Speed X", Range(-5.000000,5.000000)) = 0.000000
 _FaceUVSpeedY ("Face UV Speed Y", Range(-5.000000,5.000000)) = 0.000000
 _FaceColor ("Fill Color", Color) = (1.000000,1.000000,1.000000,1.000000)
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
 _BumpMap ("Normalmap", 2D) = "bump" { }
 _BumpOutline ("Bump Outline", Range(0.000000,1.000000)) = 0.500000
 _BumpFace ("Bump Face", Range(0.000000,1.000000)) = 0.500000
 _ReflectFaceColor ("Face Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _ReflectOutlineColor ("Outline Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _Cube ("Reflection Cubemap", CUBE) = "black" { }
 _EnvMatrixRotation ("Texture Rotation", Vector) = (0.000000,0.000000,0.000000,0.000000)
 _SpecColor ("Specular Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _FaceShininess ("Face Shininess", Range(0.000000,1.000000)) = 0.000000
 _OutlineShininess ("Outline Shininess", Range(0.000000,1.000000)) = 0.000000
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
  GpuProgramID 23880
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
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
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
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
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
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
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	lowp vec4 _ReflectFaceColor;
uniform 	lowp vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump vec3 u_xlat16_14;
bool u_xlatb14;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
lowp vec3 u_xlat10_18;
bool u_xlatb26;
float u_xlat36;
mediump float u_xlat16_36;
lowp float u_xlat10_36;
mediump float u_xlat16_37;
mediump float u_xlat16_42;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD4.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb26 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb26) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat14.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat36 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.x = u_xlat36 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat36) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_36 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_36 = (-u_xlat10_36) + 0.5;
    u_xlat36 = u_xlat16_36 + (-vs_TEXCOORD4.x);
    u_xlat36 = u_xlat36 * vs_TEXCOORD4.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_37 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_5.x;
    u_xlat14.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_OutlineTex, u_xlat14.xy);
    u_xlat16_14.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_15 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * vec3(u_xlat16_15) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_37) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_37 = (-u_xlat2.x) * 0.5 + u_xlat36;
    u_xlat36 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat14.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_8 = u_xlat2.x * vs_TEXCOORD4.y + 1.0;
    u_xlat16_37 = u_xlat14.x * 0.5 + u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_37 = (-u_xlat16_37) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat36 * u_xlat6.x + _BumpFace;
    u_xlat10_18.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_9.xyz = u_xlat10_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat10_9.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat18 = u_xlat36 * u_xlat16_18 + _FaceShininess;
    u_xlat16_1.x = u_xlat18 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_42 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_10.xyz = u_xlat16_2.xyz / vec3(u_xlat16_42);
    u_xlat16_1.xyz = u_xlat16_10.xyz * _LightColor0.xyz;
    u_xlat16_37 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_37) + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_11.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat10.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat10.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat36 = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat36 = u_xlat36 + u_xlat36;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat36)) + vs_TEXCOORD5.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	lowp vec4 _ReflectFaceColor;
uniform 	lowp vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump vec3 u_xlat16_14;
bool u_xlatb14;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
lowp vec3 u_xlat10_18;
bool u_xlatb26;
float u_xlat36;
mediump float u_xlat16_36;
lowp float u_xlat10_36;
mediump float u_xlat16_37;
mediump float u_xlat16_42;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD4.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb26 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb26) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat14.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat36 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.x = u_xlat36 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat36) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_36 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_36 = (-u_xlat10_36) + 0.5;
    u_xlat36 = u_xlat16_36 + (-vs_TEXCOORD4.x);
    u_xlat36 = u_xlat36 * vs_TEXCOORD4.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_37 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_5.x;
    u_xlat14.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_OutlineTex, u_xlat14.xy);
    u_xlat16_14.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_15 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * vec3(u_xlat16_15) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_37) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_37 = (-u_xlat2.x) * 0.5 + u_xlat36;
    u_xlat36 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat14.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_8 = u_xlat2.x * vs_TEXCOORD4.y + 1.0;
    u_xlat16_37 = u_xlat14.x * 0.5 + u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_37 = (-u_xlat16_37) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat36 * u_xlat6.x + _BumpFace;
    u_xlat10_18.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_9.xyz = u_xlat10_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat10_9.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat18 = u_xlat36 * u_xlat16_18 + _FaceShininess;
    u_xlat16_1.x = u_xlat18 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_42 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_10.xyz = u_xlat16_2.xyz / vec3(u_xlat16_42);
    u_xlat16_1.xyz = u_xlat16_10.xyz * _LightColor0.xyz;
    u_xlat16_37 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_37) + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_11.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat10.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat10.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat36 = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat36 = u_xlat36 + u_xlat36;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat36)) + vs_TEXCOORD5.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	lowp vec4 _ReflectFaceColor;
uniform 	lowp vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump vec3 u_xlat16_14;
bool u_xlatb14;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
lowp vec3 u_xlat10_18;
bool u_xlatb26;
float u_xlat36;
mediump float u_xlat16_36;
lowp float u_xlat10_36;
mediump float u_xlat16_37;
mediump float u_xlat16_42;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD4.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb26 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb26) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat14.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat36 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.x = u_xlat36 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat36) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_36 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_36 = (-u_xlat10_36) + 0.5;
    u_xlat36 = u_xlat16_36 + (-vs_TEXCOORD4.x);
    u_xlat36 = u_xlat36 * vs_TEXCOORD4.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_37 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_5.x;
    u_xlat14.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_OutlineTex, u_xlat14.xy);
    u_xlat16_14.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_15 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * vec3(u_xlat16_15) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_37) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_37 = (-u_xlat2.x) * 0.5 + u_xlat36;
    u_xlat36 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat14.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_8 = u_xlat2.x * vs_TEXCOORD4.y + 1.0;
    u_xlat16_37 = u_xlat14.x * 0.5 + u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_37 = (-u_xlat16_37) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat36 * u_xlat6.x + _BumpFace;
    u_xlat10_18.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_9.xyz = u_xlat10_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat10_9.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat18 = u_xlat36 * u_xlat16_18 + _FaceShininess;
    u_xlat16_1.x = u_xlat18 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_42 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_10.xyz = u_xlat16_2.xyz / vec3(u_xlat16_42);
    u_xlat16_1.xyz = u_xlat16_10.xyz * _LightColor0.xyz;
    u_xlat16_37 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_37) + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_11.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat10.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat10.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat36 = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat36 = u_xlat36 + u_xlat36;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat36)) + vs_TEXCOORD5.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
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
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
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
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
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
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	lowp vec4 _ReflectFaceColor;
uniform 	lowp vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump vec3 u_xlat16_14;
bool u_xlatb14;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
lowp vec3 u_xlat10_18;
bool u_xlatb26;
float u_xlat36;
mediump float u_xlat16_36;
lowp float u_xlat10_36;
mediump float u_xlat16_37;
mediump float u_xlat16_42;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD4.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb26 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb26) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat14.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat36 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.x = u_xlat36 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat36) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_36 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_36 = (-u_xlat10_36) + 0.5;
    u_xlat36 = u_xlat16_36 + (-vs_TEXCOORD4.x);
    u_xlat36 = u_xlat36 * vs_TEXCOORD4.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_37 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_5.x;
    u_xlat14.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_OutlineTex, u_xlat14.xy);
    u_xlat16_14.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_15 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * vec3(u_xlat16_15) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_37) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_37 = (-u_xlat2.x) * 0.5 + u_xlat36;
    u_xlat36 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat14.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_8 = u_xlat2.x * vs_TEXCOORD4.y + 1.0;
    u_xlat16_37 = u_xlat14.x * 0.5 + u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_37 = (-u_xlat16_37) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat36 * u_xlat6.x + _BumpFace;
    u_xlat10_18.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_9.xyz = u_xlat10_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat10_9.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat18 = u_xlat36 * u_xlat16_18 + _FaceShininess;
    u_xlat16_1.x = u_xlat18 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_42 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_10.xyz = u_xlat16_2.xyz / vec3(u_xlat16_42);
    u_xlat16_1.xyz = u_xlat16_10.xyz * _LightColor0.xyz;
    u_xlat16_37 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_37) + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_11.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat10.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat10.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat36 = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat36 = u_xlat36 + u_xlat36;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat36)) + vs_TEXCOORD5.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	lowp vec4 _ReflectFaceColor;
uniform 	lowp vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump vec3 u_xlat16_14;
bool u_xlatb14;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
lowp vec3 u_xlat10_18;
bool u_xlatb26;
float u_xlat36;
mediump float u_xlat16_36;
lowp float u_xlat10_36;
mediump float u_xlat16_37;
mediump float u_xlat16_42;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD4.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb26 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb26) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat14.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat36 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.x = u_xlat36 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat36) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_36 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_36 = (-u_xlat10_36) + 0.5;
    u_xlat36 = u_xlat16_36 + (-vs_TEXCOORD4.x);
    u_xlat36 = u_xlat36 * vs_TEXCOORD4.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_37 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_5.x;
    u_xlat14.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_OutlineTex, u_xlat14.xy);
    u_xlat16_14.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_15 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * vec3(u_xlat16_15) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_37) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_37 = (-u_xlat2.x) * 0.5 + u_xlat36;
    u_xlat36 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat14.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_8 = u_xlat2.x * vs_TEXCOORD4.y + 1.0;
    u_xlat16_37 = u_xlat14.x * 0.5 + u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_37 = (-u_xlat16_37) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat36 * u_xlat6.x + _BumpFace;
    u_xlat10_18.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_9.xyz = u_xlat10_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat10_9.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat18 = u_xlat36 * u_xlat16_18 + _FaceShininess;
    u_xlat16_1.x = u_xlat18 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_42 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_10.xyz = u_xlat16_2.xyz / vec3(u_xlat16_42);
    u_xlat16_1.xyz = u_xlat16_10.xyz * _LightColor0.xyz;
    u_xlat16_37 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_37) + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_11.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat10.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat10.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat36 = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat36 = u_xlat36 + u_xlat36;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat36)) + vs_TEXCOORD5.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	lowp vec4 _ReflectFaceColor;
uniform 	lowp vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump vec3 u_xlat16_14;
bool u_xlatb14;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
lowp vec3 u_xlat10_18;
bool u_xlatb26;
float u_xlat36;
mediump float u_xlat16_36;
lowp float u_xlat10_36;
mediump float u_xlat16_37;
mediump float u_xlat16_42;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD4.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb26 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb26) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat14.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat36 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.x = u_xlat36 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat36) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_36 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_36 = (-u_xlat10_36) + 0.5;
    u_xlat36 = u_xlat16_36 + (-vs_TEXCOORD4.x);
    u_xlat36 = u_xlat36 * vs_TEXCOORD4.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_37 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_5.x;
    u_xlat14.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_OutlineTex, u_xlat14.xy);
    u_xlat16_14.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_15 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_14.xyz * vec3(u_xlat16_15) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_37) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_37 = (-u_xlat2.x) * 0.5 + u_xlat36;
    u_xlat36 = u_xlat2.x * 0.5 + u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat14.x = u_xlat2.x * vs_TEXCOORD4.y;
    u_xlat16_8 = u_xlat2.x * vs_TEXCOORD4.y + 1.0;
    u_xlat16_37 = u_xlat14.x * 0.5 + u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_37 = (-u_xlat16_37) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat36 * u_xlat6.x + _BumpFace;
    u_xlat10_18.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_9.xyz = u_xlat10_18.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat10_9.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat18 = u_xlat36 * u_xlat16_18 + _FaceShininess;
    u_xlat16_1.x = u_xlat18 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_42 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_10.xyz = u_xlat16_2.xyz / vec3(u_xlat16_42);
    u_xlat16_1.xyz = u_xlat16_10.xyz * _LightColor0.xyz;
    u_xlat16_37 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_37) + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_11.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_11.xyz = max(u_xlat16_11.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat10.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat10.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat36 = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat36 = u_xlat36 + u_xlat36;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat36)) + vs_TEXCOORD5.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
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
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull [_CullMode]
  Blend SrcAlpha One
  ColorMask RGB
  GpuProgramID 94129
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, vec2(tmpvar_67)).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, vec2(tmpvar_67)).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, vec2(tmpvar_67)).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat10.xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xx).w;
    u_xlat16_4.xyz = vec3(u_xlat10_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat10.xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xx).w;
    u_xlat16_4.xyz = vec3(u_xlat10_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat10.xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat10.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xx).w;
    u_xlat16_4.xyz = vec3(u_xlat10_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_13 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_17;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_13 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_17;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_13 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_17;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
float u_xlat9;
mediump float u_xlat16_9;
vec2 u_xlat10;
mediump vec3 u_xlat16_10;
bool u_xlatb10;
mediump float u_xlat16_11;
mediump float u_xlat16_13;
lowp vec3 u_xlat10_14;
bool u_xlatb19;
float u_xlat27;
mediump float u_xlat16_27;
lowp float u_xlat10_27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat10.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
    u_xlatb19 = u_xlat10.x>=(-u_xlat10.x);
#endif
    u_xlat10.x = fract(abs(u_xlat10.x));
    u_xlat10.x = (u_xlatb19) ? u_xlat10.x : (-u_xlat10.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10.x>=0.5);
#else
    u_xlatb10 = u_xlat10.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb10)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat10.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat10.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat27 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.x = u_xlat27 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat27) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_27 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_27 = (-u_xlat10_27) + 0.5;
    u_xlat27 = u_xlat16_27 + (-vs_TEXCOORD5.x);
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_13 = min(u_xlat1.x, 1.0);
    u_xlat16_13 = sqrt(u_xlat16_13);
    u_xlat16_4.x = u_xlat16_13 * u_xlat16_4.x;
    u_xlat10.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat10.xy);
    u_xlat16_10.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_11 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(u_xlat16_11) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat27;
    u_xlat27 = u_xlat1.x * 0.5 + u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat10.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_13 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat10.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_13;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat27 * u_xlat5.x + _BumpFace;
    u_xlat10_14.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat5.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_4.xyz = vec3(u_xlat16_31) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat10_8.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_9 = (-_FaceShininess) + _OutlineShininess;
    u_xlat9 = u_xlat27 * u_xlat16_9 + _FaceShininess;
    u_xlat16_4.x = u_xlat9 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_4.xzw;
    u_xlat16_27 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_27);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
float u_xlat9;
mediump float u_xlat16_9;
vec2 u_xlat10;
mediump vec3 u_xlat16_10;
bool u_xlatb10;
mediump float u_xlat16_11;
mediump float u_xlat16_13;
lowp vec3 u_xlat10_14;
bool u_xlatb19;
float u_xlat27;
mediump float u_xlat16_27;
lowp float u_xlat10_27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat10.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
    u_xlatb19 = u_xlat10.x>=(-u_xlat10.x);
#endif
    u_xlat10.x = fract(abs(u_xlat10.x));
    u_xlat10.x = (u_xlatb19) ? u_xlat10.x : (-u_xlat10.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10.x>=0.5);
#else
    u_xlatb10 = u_xlat10.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb10)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat10.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat10.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat27 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.x = u_xlat27 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat27) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_27 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_27 = (-u_xlat10_27) + 0.5;
    u_xlat27 = u_xlat16_27 + (-vs_TEXCOORD5.x);
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_13 = min(u_xlat1.x, 1.0);
    u_xlat16_13 = sqrt(u_xlat16_13);
    u_xlat16_4.x = u_xlat16_13 * u_xlat16_4.x;
    u_xlat10.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat10.xy);
    u_xlat16_10.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_11 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(u_xlat16_11) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat27;
    u_xlat27 = u_xlat1.x * 0.5 + u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat10.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_13 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat10.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_13;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat27 * u_xlat5.x + _BumpFace;
    u_xlat10_14.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat5.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_4.xyz = vec3(u_xlat16_31) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat10_8.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_9 = (-_FaceShininess) + _OutlineShininess;
    u_xlat9 = u_xlat27 * u_xlat16_9 + _FaceShininess;
    u_xlat16_4.x = u_xlat9 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_4.xzw;
    u_xlat16_27 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_27);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
float u_xlat9;
mediump float u_xlat16_9;
vec2 u_xlat10;
mediump vec3 u_xlat16_10;
bool u_xlatb10;
mediump float u_xlat16_11;
mediump float u_xlat16_13;
lowp vec3 u_xlat10_14;
bool u_xlatb19;
float u_xlat27;
mediump float u_xlat16_27;
lowp float u_xlat10_27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat10.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
    u_xlatb19 = u_xlat10.x>=(-u_xlat10.x);
#endif
    u_xlat10.x = fract(abs(u_xlat10.x));
    u_xlat10.x = (u_xlatb19) ? u_xlat10.x : (-u_xlat10.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10.x>=0.5);
#else
    u_xlatb10 = u_xlat10.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb10)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat10.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat10.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat27 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.x = u_xlat27 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat27) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_27 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_27 = (-u_xlat10_27) + 0.5;
    u_xlat27 = u_xlat16_27 + (-vs_TEXCOORD5.x);
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_13 = min(u_xlat1.x, 1.0);
    u_xlat16_13 = sqrt(u_xlat16_13);
    u_xlat16_4.x = u_xlat16_13 * u_xlat16_4.x;
    u_xlat10.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat10.xy);
    u_xlat16_10.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_11 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(u_xlat16_11) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat27;
    u_xlat27 = u_xlat1.x * 0.5 + u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat10.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_13 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat10.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_13;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat27 * u_xlat5.x + _BumpFace;
    u_xlat10_14.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_14.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat5.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_4.xyz = vec3(u_xlat16_31) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat10_8.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_9 = (-_FaceShininess) + _OutlineShininess;
    u_xlat9 = u_xlat27 * u_xlat16_9 + _FaceShininess;
    u_xlat16_4.x = u_xlat9 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_4.xzw;
    u_xlat16_27 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_27);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_11 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_10 = tmpvar_13;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD4;
  highp vec4 tmpvar_67;
  tmpvar_67 = (unity_WorldToLight * tmpvar_66);
  lowp vec4 tmpvar_68;
  highp vec2 P_69;
  P_69 = ((tmpvar_67.xy / tmpvar_67.w) + 0.5);
  tmpvar_68 = texture2D (_LightTexture0, P_69);
  highp float tmpvar_70;
  tmpvar_70 = dot (tmpvar_67.xyz, tmpvar_67.xyz);
  lowp vec4 tmpvar_71;
  tmpvar_71 = texture2D (_LightTextureB0, vec2(tmpvar_70));
  highp float tmpvar_72;
  tmpvar_72 = ((float(
    (tmpvar_67.z > 0.0)
  ) * tmpvar_68.w) * tmpvar_71.w);
  atten_4 = tmpvar_72;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_15);
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_10;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_11 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_10 = tmpvar_13;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD4;
  highp vec4 tmpvar_67;
  tmpvar_67 = (unity_WorldToLight * tmpvar_66);
  lowp vec4 tmpvar_68;
  highp vec2 P_69;
  P_69 = ((tmpvar_67.xy / tmpvar_67.w) + 0.5);
  tmpvar_68 = texture2D (_LightTexture0, P_69);
  highp float tmpvar_70;
  tmpvar_70 = dot (tmpvar_67.xyz, tmpvar_67.xyz);
  lowp vec4 tmpvar_71;
  tmpvar_71 = texture2D (_LightTextureB0, vec2(tmpvar_70));
  highp float tmpvar_72;
  tmpvar_72 = ((float(
    (tmpvar_67.z > 0.0)
  ) * tmpvar_68.w) * tmpvar_71.w);
  atten_4 = tmpvar_72;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_15);
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_10;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "SPOT" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_11 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_10 = tmpvar_13;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD4;
  highp vec4 tmpvar_67;
  tmpvar_67 = (unity_WorldToLight * tmpvar_66);
  lowp vec4 tmpvar_68;
  highp vec2 P_69;
  P_69 = ((tmpvar_67.xy / tmpvar_67.w) + 0.5);
  tmpvar_68 = texture2D (_LightTexture0, P_69);
  highp float tmpvar_70;
  tmpvar_70 = dot (tmpvar_67.xyz, tmpvar_67.xyz);
  lowp vec4 tmpvar_71;
  tmpvar_71 = texture2D (_LightTextureB0, vec2(tmpvar_70));
  highp float tmpvar_72;
  tmpvar_72 = ((float(
    (tmpvar_67.z > 0.0)
  ) * tmpvar_68.w) * tmpvar_71.w);
  atten_4 = tmpvar_72;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_15);
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_10;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
uniform lowp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb20;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2 = vs_TEXCOORD4.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4unity_WorldToLight[3];
    u_xlat10.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat10.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0<u_xlat2.z);
#else
    u_xlatb20 = 0.0<u_xlat2.z;
#endif
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_30 = texture(_LightTextureB0, vec2(u_xlat30)).w;
    u_xlat10_8.x = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat10_8.x = u_xlat10_10 * u_xlat10_8.x;
    u_xlat10_8.x = u_xlat10_30 * u_xlat10_8.x;
    u_xlat16_4.xyz = u_xlat10_8.xxx * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
uniform lowp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb20;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2 = vs_TEXCOORD4.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4unity_WorldToLight[3];
    u_xlat10.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat10.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0<u_xlat2.z);
#else
    u_xlatb20 = 0.0<u_xlat2.z;
#endif
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_30 = texture(_LightTextureB0, vec2(u_xlat30)).w;
    u_xlat10_8.x = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat10_8.x = u_xlat10_10 * u_xlat10_8.x;
    u_xlat10_8.x = u_xlat10_30 * u_xlat10_8.x;
    u_xlat16_4.xyz = u_xlat10_8.xxx * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
uniform lowp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb20;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2 = vs_TEXCOORD4.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4unity_WorldToLight[3];
    u_xlat10.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat10.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.0<u_xlat2.z);
#else
    u_xlatb20 = 0.0<u_xlat2.z;
#endif
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_30 = texture(_LightTextureB0, vec2(u_xlat30)).w;
    u_xlat10_8.x = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat10_8.x = u_xlat10_10 * u_xlat10_8.x;
    u_xlat10_8.x = u_xlat10_30 * u_xlat10_8.x;
    u_xlat16_4.xyz = u_xlat10_8.xxx * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = (texture2D (_LightTextureB0, vec2(tmpvar_67)).w * textureCube (_LightTexture0, tmpvar_66).w);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = (texture2D (_LightTextureB0, vec2(tmpvar_67)).w * textureCube (_LightTexture0, tmpvar_66).w);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT_COOKIE" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = (texture2D (_LightTextureB0, vec2(tmpvar_67)).w * textureCube (_LightTexture0, tmpvar_66).w);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
lowp float u_xlat10_20;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat10.xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xyz).w;
    u_xlat10_20 = texture(_LightTextureB0, u_xlat5.xx).w;
    u_xlat16_10 = u_xlat10_10 * u_xlat10_20;
    u_xlat16_4.xyz = vec3(u_xlat16_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
lowp float u_xlat10_20;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat10.xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xyz).w;
    u_xlat10_20 = texture(_LightTextureB0, u_xlat5.xx).w;
    u_xlat16_10 = u_xlat10_10 * u_xlat10_20;
    u_xlat16_4.xyz = vec3(u_xlat16_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
lowp float u_xlat10_20;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
float u_xlat35;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat35 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat0.xyz;
    u_xlat16_4.w = dot(u_xlat10_8.xyz, u_xlat0.xyz);
    u_xlat16_9.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat10.xyz;
    u_xlat10.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz + hlslcc_mtx4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xyz).w;
    u_xlat10_20 = texture(_LightTextureB0, u_xlat5.xx).w;
    u_xlat16_10 = u_xlat10_10 * u_xlat10_20;
    u_xlat16_4.xyz = vec3(u_xlat16_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec2 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xy;
  lowp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, tmpvar_66).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_67);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_9;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec2 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xy;
  lowp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, tmpvar_66).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_67);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_9;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
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
  highp vec4 v_32;
  v_32.x = tmpvar_14;
  v_32.y = tmpvar_15;
  v_32.z = tmpvar_16;
  v_32.w = tmpvar_17;
  highp vec4 v_33;
  v_33.x = tmpvar_19;
  v_33.y = tmpvar_20;
  v_33.z = tmpvar_21;
  v_33.w = tmpvar_22;
  highp vec4 v_34;
  v_34.x = tmpvar_24;
  v_34.y = tmpvar_25;
  v_34.z = tmpvar_26;
  v_34.w = tmpvar_27;
  highp vec3 tmpvar_35;
  tmpvar_35 = normalize(((
    (v_32.xyz * tmpvar_6.x)
   + 
    (v_33.xyz * tmpvar_6.y)
  ) + (v_34.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_35;
  highp mat3 tmpvar_36;
  tmpvar_36[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_36[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_36[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize((tmpvar_36 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_38;
  lowp vec3 tmpvar_39;
  tmpvar_39 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_40;
  tmpvar_40.x = worldTangent_2.x;
  tmpvar_40.y = tmpvar_39.x;
  tmpvar_40.z = worldNormal_3.x;
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.y;
  tmpvar_41.y = tmpvar_39.y;
  tmpvar_41.z = worldNormal_3.y;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.z;
  tmpvar_42.y = tmpvar_39.z;
  tmpvar_42.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_31);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_40;
  xlv_TEXCOORD2 = tmpvar_41;
  xlv_TEXCOORD3 = tmpvar_42;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_30 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
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
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec2 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xy;
  lowp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, tmpvar_66).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_67);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_9;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat5.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat16_34 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_4.xyz = vec3(u_xlat16_34) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat10_8.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xy = vs_TEXCOORD4.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat10.xy = hlslcc_mtx4unity_WorldToLight[0].xy * vs_TEXCOORD4.xx + u_xlat10.xy;
    u_xlat10.xy = hlslcc_mtx4unity_WorldToLight[2].xy * vs_TEXCOORD4.zz + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + hlslcc_mtx4unity_WorldToLight[3].xy;
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xy).w;
    u_xlat16_4.xzw = vec3(u_xlat10_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat5.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat16_34 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_4.xyz = vec3(u_xlat16_34) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat10_8.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xy = vs_TEXCOORD4.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat10.xy = hlslcc_mtx4unity_WorldToLight[0].xy * vs_TEXCOORD4.xx + u_xlat10.xy;
    u_xlat10.xy = hlslcc_mtx4unity_WorldToLight[2].xy * vs_TEXCOORD4.zz + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + hlslcc_mtx4unity_WorldToLight[3].xy;
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xy).w;
    u_xlat16_4.xzw = vec3(u_xlat10_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
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
out lowp vec3 vs_TEXCOORD1;
out lowp vec3 vs_TEXCOORD2;
out lowp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
float u_xlat10;
int u_xlati10;
vec2 u_xlat11;
float u_xlat15;
int u_xlati15;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4glstate_matrix_mvp[3];
    u_xlat15 = floor(in_TEXCOORD1.x);
    u_xlat11.x = u_xlat15 * _FaceTex_ST.x;
    u_xlat15 = fract(in_TEXCOORD1.x);
    u_xlat11.y = u_xlat15 * _FaceTex_ST.y;
    vs_TEXCOORD0.zw = u_xlat11.xy * vec2(0.00122070312, 5.0) + _FaceTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat10 = dot(in_NORMAL0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat10; u_xlati15 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati15 = int((0.0<u_xlat10) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat10<0.0; u_xlati10 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati10 = int((u_xlat10<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati10 = (-u_xlati15) + u_xlati10;
    u_xlat10 = float(u_xlati10);
    u_xlat1.xyz = vec3(u_xlat10) * in_NORMAL0.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat2.xyz = u_xlat1.yyy * u_xlat2.xyz;
    u_xlat3.y = hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat3.z = hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat3.x = hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.y = hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.z = hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.x = hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.z = u_xlat1.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat10_4.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat10_4.xyz);
    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat10_4.xyz = vec3(u_xlat10) * u_xlat10_4.xyz;
    vs_TEXCOORD1.y = u_xlat10_4.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD2.y = u_xlat10_4.y;
    vs_TEXCOORD3.y = u_xlat10_4.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat5.x = u_xlat0.y * hlslcc_mtx4glstate_matrix_mvp[1].w;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[0].w * u_xlat0.x + u_xlat5.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[2].w * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4glstate_matrix_mvp[3].w * in_POSITION0.w + u_xlat0.x;
    u_xlat5.xy = _ScreenParams.yy * hlslcc_mtx4glstate_matrix_projection[1].xy;
    u_xlat5.xy = hlslcc_mtx4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat5.xy;
    u_xlat5.xy = vec2(u_xlat5.x * float(_ScaleX), u_xlat5.y * float(_ScaleY));
    u_xlat0.xy = u_xlat0.xx / u_xlat5.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.x = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat0.x * 1.5;
    u_xlat10 = (-_PerspectiveFilter) + 1.0;
    u_xlat5.x = u_xlat10 * u_xlat5.x;
    u_xlat0.x = u_xlat0.x * 1.5 + (-u_xlat5.x);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat10) * u_xlat0.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb0 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = (-_WeightNormal) + _WeightBold;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _WeightNormal;
    u_xlat0.x = u_xlat0.x / _GradientScale;
    u_xlat5.x = _FaceDilate * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat5.x * 0.5 + u_xlat0.x;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	lowp vec4 _LightColor0;
uniform 	lowp vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	lowp vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	lowp vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in lowp vec3 vs_TEXCOORD1;
in lowp vec3 vs_TEXCOORD2;
in lowp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
lowp vec3 u_xlat10_7;
lowp vec3 u_xlat10_8;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
vec2 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
lowp vec3 u_xlat10_15;
bool u_xlatb21;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat11.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb21 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb21) ? u_xlat11.x : (-u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x>=0.5);
#else
    u_xlatb11 = u_xlat11.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb11)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat11.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat11.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.x = u_xlat30 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_14 = min(u_xlat1.x, 1.0);
    u_xlat16_14 = sqrt(u_xlat16_14);
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat11.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_2 = texture(_OutlineTex, u_xlat11.xy);
    u_xlat16_11.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat10_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat16_12) + (-u_xlat10_7.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat1.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat11.x = u_xlat1.x * vs_TEXCOORD5.y;
    u_xlat16_14 = u_xlat1.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_4.x = u_xlat11.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat30 * u_xlat5.x + _BumpFace;
    u_xlat10_15.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat10_8.xyz = u_xlat10_15.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat10_8.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat10_8.x = dot(vs_TEXCOORD1.xyz, (-u_xlat0.xyz));
    u_xlat10_8.y = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat10_8.z = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat5.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat16_34 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_4.xyz = vec3(u_xlat16_34) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat10_8.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat10_8.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_10 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10.x = u_xlat30 * u_xlat16_10 + _FaceShininess;
    u_xlat16_4.x = u_xlat10.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat10.xy = vs_TEXCOORD4.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat10.xy = hlslcc_mtx4unity_WorldToLight[0].xy * vs_TEXCOORD4.xx + u_xlat10.xy;
    u_xlat10.xy = hlslcc_mtx4unity_WorldToLight[2].xy * vs_TEXCOORD4.zz + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + hlslcc_mtx4unity_WorldToLight[3].xy;
    u_xlat10_10 = texture(_LightTexture0, u_xlat10.xy).w;
    u_xlat16_4.xzw = vec3(u_xlat10_10) * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_9.xyz;
    u_xlat16_30 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_30);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
  GpuProgramID 151538
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