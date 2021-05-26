//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-PrePassCollectShadows" {
Properties {
 _ShadowMapTexture ("", any) = "" { }
}
SubShader { 
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 58189
Program "vp" {
SubProgram "gles " {
Keywords { "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec3 tmpvar_5;
  tmpvar_5 = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  highp vec4 tmpvar_7;
  tmpvar_7 = (_CameraToWorld * tmpvar_6);
  bvec4 tmpvar_8;
  tmpvar_8 = greaterThanEqual (tmpvar_5.zzzz, _LightSplitsNear);
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (tmpvar_5.zzzz, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = (vec4(tmpvar_8) * vec4(tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (((
    ((unity_World2Shadow[0] * tmpvar_7).xyz * tmpvar_10.x)
   + 
    ((unity_World2Shadow[1] * tmpvar_7).xyz * tmpvar_10.y)
  ) + (
    (unity_World2Shadow[2] * tmpvar_7)
  .xyz * tmpvar_10.z)) + ((unity_World2Shadow[3] * tmpvar_7).xyz * tmpvar_10.w));
  highp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_ShadowMapTexture, tmpvar_11.xy);
  mediump float tmpvar_13;
  if ((tmpvar_12.x < tmpvar_11.z)) {
    tmpvar_13 = 0.0;
  } else {
    tmpvar_13 = 1.0;
  };
  highp float tmpvar_14;
  tmpvar_14 = clamp (((tmpvar_5.z * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  shadow_2 = (mix (_LightShadowData.x, 1.0, tmpvar_13) + tmpvar_14);
  mediump vec4 tmpvar_15;
  tmpvar_15 = vec4(shadow_2);
  res_1 = tmpvar_15;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform lowp sampler2DShadow _ShadowMapTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec3 tmpvar_5;
  tmpvar_5 = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  highp vec4 tmpvar_7;
  tmpvar_7 = (_CameraToWorld * tmpvar_6);
  bvec4 tmpvar_8;
  tmpvar_8 = greaterThanEqual (tmpvar_5.zzzz, _LightSplitsNear);
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (tmpvar_5.zzzz, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = (vec4(tmpvar_8) * vec4(tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (((
    ((unity_World2Shadow[0] * tmpvar_7).xyz * tmpvar_10.x)
   + 
    ((unity_World2Shadow[1] * tmpvar_7).xyz * tmpvar_10.y)
  ) + (
    (unity_World2Shadow[2] * tmpvar_7)
  .xyz * tmpvar_10.z)) + ((unity_World2Shadow[3] * tmpvar_7).xyz * tmpvar_10.w));
  lowp float tmpvar_12;
  tmpvar_12 = shadow2DEXT (_ShadowMapTexture, tmpvar_11.xyz);
  mediump float tmpvar_13;
  tmpvar_13 = tmpvar_12;
  highp float tmpvar_14;
  tmpvar_14 = clamp (((tmpvar_5.z * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  shadow_2 = (mix (_LightShadowData.x, 1.0, tmpvar_13) + tmpvar_14);
  mediump vec4 tmpvar_15;
  tmpvar_15 = vec4(shadow_2);
  res_1 = tmpvar_15;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_NATIVE" }
"!!GLES3
#ifdef VERTEX
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
highp vec4 t0;
highp vec3 t1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    t0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    t1.x = t0.y * _ProjectionParams.x;
    t1.xyz = t1.xxx * unity_CameraInvProjection[1].xyz;
    t1.xyz = unity_CameraInvProjection[0].xyz * t0.xxx + t1.xyz;
    gl_Position = t0;
    t0.x = t1.z + unity_CameraInvProjection[2].z;
    t0.yzw = t1.xyz + (-unity_CameraInvProjection[2].xyz);
    t0 = t0 + unity_CameraInvProjection[3].zxyz;
    vs_TEXCOORD2.xyz = vec3(t0.y * float(1.0), t0.z * float(1.0), t0.w * float(-1.0));
    vs_TEXCOORD2.w = (-t0.x);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
lowp vec4 t10_1;
bvec4 tb1;
highp vec4 t2;
bvec4 tb2;
highp vec3 t3;
mediump float t16_4;
highp vec3 t5;
lowp float t10_5;
highp float t10;
void main()
{
    t0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    t5.x = _ZBufferParams.x * t0.x + _ZBufferParams.y;
    t5.x = float(1.0) / t5.x;
    t10 = (-t5.x) + t0.x;
    t5.x = unity_OrthoParams.w * t10 + t5.x;
    t1.xy = vs_TEXCOORD2.xy;
    t10 = (-vs_TEXCOORD2.z) + vs_TEXCOORD2.w;
    t1.z = t0.x * t10 + vs_TEXCOORD2.z;
    t0.xzw = (-vs_TEXCOORD1.xyz) * t5.xxx + t1.xyz;
    t1.xyz = t5.xxx * vs_TEXCOORD1.xyz;
    t0.xyz = unity_OrthoParams.www * t0.xzw + t1.xyz;
    tb1 = greaterThanEqual(t0.zzzz, _LightSplitsNear);
    t1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(tb1));
    tb2 = lessThan(t0.zzzz, _LightSplitsFar);
    t2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(tb2));
    t10_1 = t1 * t2;
    t2 = t0.yyyy * _CameraToWorld[1];
    t2 = _CameraToWorld[0] * t0.xxxx + t2;
    t2 = _CameraToWorld[2] * t0.zzzz + t2;
    t0.x = t0.z * _LightShadowData.z + _LightShadowData.w;
    t0.x = clamp(t0.x, 0.0, 1.0);
    t2 = t2 + _CameraToWorld[3];
    t5.xyz = t2.yyy * unity_World2Shadow[1][1].xyz;
    t5.xyz = unity_World2Shadow[1][0].xyz * t2.xxx + t5.xyz;
    t5.xyz = unity_World2Shadow[1][2].xyz * t2.zzz + t5.xyz;
    t5.xyz = unity_World2Shadow[1][3].xyz * t2.www + t5.xyz;
    t5.xyz = t10_1.yyy * t5.xyz;
    t3.xyz = t2.yyy * unity_World2Shadow[0][1].xyz;
    t3.xyz = unity_World2Shadow[0][0].xyz * t2.xxx + t3.xyz;
    t3.xyz = unity_World2Shadow[0][2].xyz * t2.zzz + t3.xyz;
    t3.xyz = unity_World2Shadow[0][3].xyz * t2.www + t3.xyz;
    t5.xyz = t3.xyz * t10_1.xxx + t5.xyz;
    t3.xyz = t2.yyy * unity_World2Shadow[2][1].xyz;
    t3.xyz = unity_World2Shadow[2][0].xyz * t2.xxx + t3.xyz;
    t3.xyz = unity_World2Shadow[2][2].xyz * t2.zzz + t3.xyz;
    t3.xyz = unity_World2Shadow[2][3].xyz * t2.www + t3.xyz;
    t5.xyz = t3.xyz * t10_1.zzz + t5.xyz;
    t3.xyz = t2.yyy * unity_World2Shadow[3][1].xyz;
    t3.xyz = unity_World2Shadow[3][0].xyz * t2.xxx + t3.xyz;
    t2.xyz = unity_World2Shadow[3][2].xyz * t2.zzz + t3.xyz;
    t2.xyz = unity_World2Shadow[3][3].xyz * t2.www + t2.xyz;
    t5.xyz = t2.xyz * t10_1.www + t5.xyz;
    vec3 txVec0 = vec3(t5.xy,t5.z);
    t10_5 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    t16_4 = (-_LightShadowData.x) + 1.0;
    t16_4 = t10_5 * t16_4 + _LightShadowData.x;
    t0 = t0.xxxx + vec4(t16_4);
    SV_Target0 = t0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_CameraToWorld * tmpvar_5);
  lowp vec4 weights_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_8, tmpvar_8);
  tmpvar_12.y = dot (tmpvar_9, tmpvar_9);
  tmpvar_12.z = dot (tmpvar_10, tmpvar_10);
  tmpvar_12.w = dot (tmpvar_11, tmpvar_11);
  bvec4 tmpvar_13;
  tmpvar_13 = lessThan (tmpvar_12, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_14;
  tmpvar_14 = vec4(tmpvar_13);
  weights_7.x = tmpvar_14.x;
  weights_7.yzw = clamp ((tmpvar_14.yzw - tmpvar_14.xyz), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    ((unity_World2Shadow[0] * tmpvar_6).xyz * tmpvar_14.x)
   + 
    ((unity_World2Shadow[1] * tmpvar_6).xyz * weights_7.y)
  ) + (
    (unity_World2Shadow[2] * tmpvar_6)
  .xyz * weights_7.z)) + ((unity_World2Shadow[3] * tmpvar_6).xyz * weights_7.w));
  highp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_ShadowMapTexture, tmpvar_15.xy);
  mediump float tmpvar_17;
  if ((tmpvar_16.x < tmpvar_15.z)) {
    tmpvar_17 = 0.0;
  } else {
    tmpvar_17 = 1.0;
  };
  highp float tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = clamp (((
    sqrt(dot (tmpvar_19, tmpvar_19))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  tmpvar_18 = tmpvar_20;
  shadow_2 = (mix (_LightShadowData.x, 1.0, tmpvar_17) + tmpvar_18);
  mediump vec4 tmpvar_22;
  tmpvar_22 = vec4(shadow_2);
  res_1 = tmpvar_22;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform lowp sampler2DShadow _ShadowMapTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_CameraToWorld * tmpvar_5);
  lowp vec4 weights_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_8, tmpvar_8);
  tmpvar_12.y = dot (tmpvar_9, tmpvar_9);
  tmpvar_12.z = dot (tmpvar_10, tmpvar_10);
  tmpvar_12.w = dot (tmpvar_11, tmpvar_11);
  bvec4 tmpvar_13;
  tmpvar_13 = lessThan (tmpvar_12, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_14;
  tmpvar_14 = vec4(tmpvar_13);
  weights_7.x = tmpvar_14.x;
  weights_7.yzw = clamp ((tmpvar_14.yzw - tmpvar_14.xyz), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    ((unity_World2Shadow[0] * tmpvar_6).xyz * tmpvar_14.x)
   + 
    ((unity_World2Shadow[1] * tmpvar_6).xyz * weights_7.y)
  ) + (
    (unity_World2Shadow[2] * tmpvar_6)
  .xyz * weights_7.z)) + ((unity_World2Shadow[3] * tmpvar_6).xyz * weights_7.w));
  lowp float tmpvar_16;
  tmpvar_16 = shadow2DEXT (_ShadowMapTexture, tmpvar_15.xyz);
  mediump float tmpvar_17;
  tmpvar_17 = tmpvar_16;
  highp float tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = clamp (((
    sqrt(dot (tmpvar_19, tmpvar_19))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_20 = tmpvar_21;
  tmpvar_18 = tmpvar_20;
  shadow_2 = (mix (_LightShadowData.x, 1.0, tmpvar_17) + tmpvar_18);
  mediump vec4 tmpvar_22;
  tmpvar_22 = vec4(shadow_2);
  res_1 = tmpvar_22;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
"!!GLES3
#ifdef VERTEX
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
highp vec4 t0;
highp vec3 t1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    t0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    t1.x = t0.y * _ProjectionParams.x;
    t1.xyz = t1.xxx * unity_CameraInvProjection[1].xyz;
    t1.xyz = unity_CameraInvProjection[0].xyz * t0.xxx + t1.xyz;
    gl_Position = t0;
    t0.x = t1.z + unity_CameraInvProjection[2].z;
    t0.yzw = t1.xyz + (-unity_CameraInvProjection[2].xyz);
    t0 = t0 + unity_CameraInvProjection[3].zxyz;
    vs_TEXCOORD2.xyz = vec3(t0.y * float(1.0), t0.z * float(1.0), t0.w * float(-1.0));
    vs_TEXCOORD2.w = (-t0.x);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
bvec4 tb1;
highp vec3 t2;
lowp vec3 t10_3;
mediump float t16_4;
highp vec3 t5;
lowp float t10_5;
highp vec3 t6;
highp float t10;
void main()
{
    t0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    t5.x = _ZBufferParams.x * t0.x + _ZBufferParams.y;
    t5.x = float(1.0) / t5.x;
    t10 = (-t5.x) + t0.x;
    t5.x = unity_OrthoParams.w * t10 + t5.x;
    t1.xy = vs_TEXCOORD2.xy;
    t10 = (-vs_TEXCOORD2.z) + vs_TEXCOORD2.w;
    t1.z = t0.x * t10 + vs_TEXCOORD2.z;
    t0.xzw = (-vs_TEXCOORD1.xyz) * t5.xxx + t1.xyz;
    t1.xyz = t5.xxx * vs_TEXCOORD1.xyz;
    t0.xyz = unity_OrthoParams.www * t0.xzw + t1.xyz;
    t1 = t0.yyyy * _CameraToWorld[1];
    t1 = _CameraToWorld[0] * t0.xxxx + t1;
    t0 = _CameraToWorld[2] * t0.zzzz + t1;
    t0 = t0 + _CameraToWorld[3];
    t1.xyz = t0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    t1.x = dot(t1.xyz, t1.xyz);
    t2.xyz = t0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    t1.y = dot(t2.xyz, t2.xyz);
    t2.xyz = t0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    t1.z = dot(t2.xyz, t2.xyz);
    t2.xyz = t0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    t1.w = dot(t2.xyz, t2.xyz);
    tb1 = lessThan(t1, unity_ShadowSplitSqRadii);
    t10_3.x = (tb1.x) ? float(-1.0) : float(-0.0);
    t10_3.y = (tb1.y) ? float(-1.0) : float(-0.0);
    t10_3.z = (tb1.z) ? float(-1.0) : float(-0.0);
    t1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(tb1));
    t10_3.xyz = vec3(t10_3.x + t1.y, t10_3.y + t1.z, t10_3.z + t1.w);
    t10_3.xyz = max(t10_3.xyz, vec3(0.0, 0.0, 0.0));
    t6.xyz = t0.yyy * unity_World2Shadow[1][1].xyz;
    t6.xyz = unity_World2Shadow[1][0].xyz * t0.xxx + t6.xyz;
    t6.xyz = unity_World2Shadow[1][2].xyz * t0.zzz + t6.xyz;
    t6.xyz = unity_World2Shadow[1][3].xyz * t0.www + t6.xyz;
    t6.xyz = t10_3.xxx * t6.xyz;
    t2.xyz = t0.yyy * unity_World2Shadow[0][1].xyz;
    t2.xyz = unity_World2Shadow[0][0].xyz * t0.xxx + t2.xyz;
    t2.xyz = unity_World2Shadow[0][2].xyz * t0.zzz + t2.xyz;
    t2.xyz = unity_World2Shadow[0][3].xyz * t0.www + t2.xyz;
    t1.xyz = t2.xyz * t1.xxx + t6.xyz;
    t2.xyz = t0.yyy * unity_World2Shadow[2][1].xyz;
    t2.xyz = unity_World2Shadow[2][0].xyz * t0.xxx + t2.xyz;
    t2.xyz = unity_World2Shadow[2][2].xyz * t0.zzz + t2.xyz;
    t2.xyz = unity_World2Shadow[2][3].xyz * t0.www + t2.xyz;
    t1.xyz = t2.xyz * t10_3.yyy + t1.xyz;
    t2.xyz = t0.yyy * unity_World2Shadow[3][1].xyz;
    t2.xyz = unity_World2Shadow[3][0].xyz * t0.xxx + t2.xyz;
    t2.xyz = unity_World2Shadow[3][2].xyz * t0.zzz + t2.xyz;
    t2.xyz = unity_World2Shadow[3][3].xyz * t0.www + t2.xyz;
    t0.xyz = t0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    t0.x = dot(t0.xyz, t0.xyz);
    t0.x = sqrt(t0.x);
    t0.x = t0.x * _LightShadowData.z + _LightShadowData.w;
    t0.x = clamp(t0.x, 0.0, 1.0);
    t5.xyz = t2.xyz * t10_3.zzz + t1.xyz;
    vec3 txVec0 = vec3(t5.xy,t5.z);
    t10_5 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    t16_4 = (-_LightShadowData.x) + 1.0;
    t16_4 = t10_5 * t16_4 + _LightShadowData.x;
    t0 = t0.xxxx + vec4(t16_4);
    SV_Target0 = t0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SINGLE_CASCADE" "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec3 tmpvar_5;
  tmpvar_5 = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = (unity_World2Shadow[0] * (_CameraToWorld * tmpvar_6)).xyz;
  highp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_ShadowMapTexture, tmpvar_7.xy);
  mediump float tmpvar_9;
  if ((tmpvar_8.x < tmpvar_7.z)) {
    tmpvar_9 = 0.0;
  } else {
    tmpvar_9 = 1.0;
  };
  highp float tmpvar_10;
  tmpvar_10 = clamp (((tmpvar_5.z * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  shadow_2 = (mix (_LightShadowData.x, 1.0, tmpvar_9) + tmpvar_10);
  mediump vec4 tmpvar_11;
  tmpvar_11 = vec4(shadow_2);
  res_1 = tmpvar_11;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform lowp sampler2DShadow _ShadowMapTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec3 tmpvar_5;
  tmpvar_5 = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = (unity_World2Shadow[0] * (_CameraToWorld * tmpvar_6)).xyz;
  lowp float tmpvar_8;
  tmpvar_8 = shadow2DEXT (_ShadowMapTexture, tmpvar_7.xyz);
  mediump float tmpvar_9;
  tmpvar_9 = tmpvar_8;
  highp float tmpvar_10;
  tmpvar_10 = clamp (((tmpvar_5.z * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  shadow_2 = (mix (_LightShadowData.x, 1.0, tmpvar_9) + tmpvar_10);
  mediump vec4 tmpvar_11;
  tmpvar_11 = vec4(shadow_2);
  res_1 = tmpvar_11;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES3
#ifdef VERTEX
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
highp vec4 t0;
highp vec3 t1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    t0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    t1.x = t0.y * _ProjectionParams.x;
    t1.xyz = t1.xxx * unity_CameraInvProjection[1].xyz;
    t1.xyz = unity_CameraInvProjection[0].xyz * t0.xxx + t1.xyz;
    gl_Position = t0;
    t0.x = t1.z + unity_CameraInvProjection[2].z;
    t0.yzw = t1.xyz + (-unity_CameraInvProjection[2].xyz);
    t0 = t0 + unity_CameraInvProjection[3].zxyz;
    vs_TEXCOORD2.xyz = vec3(t0.y * float(1.0), t0.z * float(1.0), t0.w * float(-1.0));
    vs_TEXCOORD2.w = (-t0.x);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
mediump float t16_2;
highp vec3 t3;
lowp float t10_3;
highp float t6;
void main()
{
    t0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    t3.x = _ZBufferParams.x * t0.x + _ZBufferParams.y;
    t3.x = float(1.0) / t3.x;
    t6 = (-t3.x) + t0.x;
    t3.x = unity_OrthoParams.w * t6 + t3.x;
    t1.xy = vs_TEXCOORD2.xy;
    t6 = (-vs_TEXCOORD2.z) + vs_TEXCOORD2.w;
    t1.z = t0.x * t6 + vs_TEXCOORD2.z;
    t0.xzw = (-vs_TEXCOORD1.xyz) * t3.xxx + t1.xyz;
    t1.xyz = t3.xxx * vs_TEXCOORD1.xyz;
    t0.xyz = unity_OrthoParams.www * t0.xzw + t1.xyz;
    t1 = t0.yyyy * _CameraToWorld[1];
    t1 = _CameraToWorld[0] * t0.xxxx + t1;
    t1 = _CameraToWorld[2] * t0.zzzz + t1;
    t0.x = t0.z * _LightShadowData.z + _LightShadowData.w;
    t0.x = clamp(t0.x, 0.0, 1.0);
    t1 = t1 + _CameraToWorld[3];
    t3.xyz = t1.yyy * unity_World2Shadow[0][1].xyz;
    t3.xyz = unity_World2Shadow[0][0].xyz * t1.xxx + t3.xyz;
    t3.xyz = unity_World2Shadow[0][2].xyz * t1.zzz + t3.xyz;
    t3.xyz = unity_World2Shadow[0][3].xyz * t1.www + t3.xyz;
    vec3 txVec0 = vec3(t3.xy,t3.z);
    t10_3 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    t16_2 = (-_LightShadowData.x) + 1.0;
    t16_2 = t10_3 * t16_2 + _LightShadowData.x;
    t0 = t0.xxxx + vec4(t16_2);
    SV_Target0 = t0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_CameraToWorld * tmpvar_5);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = (unity_World2Shadow[0] * tmpvar_6).xyz;
  highp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_ShadowMapTexture, tmpvar_7.xy);
  mediump float tmpvar_9;
  if ((tmpvar_8.x < tmpvar_7.z)) {
    tmpvar_9 = 0.0;
  } else {
    tmpvar_9 = 1.0;
  };
  highp float tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = clamp (((
    sqrt(dot (tmpvar_11, tmpvar_11))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  tmpvar_10 = tmpvar_12;
  shadow_2 = (mix (_LightShadowData.x, 1.0, tmpvar_9) + tmpvar_10);
  mediump vec4 tmpvar_14;
  tmpvar_14 = vec4(shadow_2);
  res_1 = tmpvar_14;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform lowp sampler2DShadow _ShadowMapTexture;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_CameraToWorld * tmpvar_5);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = (unity_World2Shadow[0] * tmpvar_6).xyz;
  lowp float tmpvar_8;
  tmpvar_8 = shadow2DEXT (_ShadowMapTexture, tmpvar_7.xyz);
  mediump float tmpvar_9;
  tmpvar_9 = tmpvar_8;
  highp float tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = clamp (((
    sqrt(dot (tmpvar_11, tmpvar_11))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  tmpvar_10 = tmpvar_12;
  shadow_2 = (mix (_LightShadowData.x, 1.0, tmpvar_9) + tmpvar_10);
  mediump vec4 tmpvar_14;
  tmpvar_14 = vec4(shadow_2);
  res_1 = tmpvar_14;
  gl_FragData[0] = res_1;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES3
#ifdef VERTEX
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
highp vec4 t0;
highp vec3 t1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    t0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    t1.x = t0.y * _ProjectionParams.x;
    t1.xyz = t1.xxx * unity_CameraInvProjection[1].xyz;
    t1.xyz = unity_CameraInvProjection[0].xyz * t0.xxx + t1.xyz;
    gl_Position = t0;
    t0.x = t1.z + unity_CameraInvProjection[2].z;
    t0.yzw = t1.xyz + (-unity_CameraInvProjection[2].xyz);
    t0 = t0 + unity_CameraInvProjection[3].zxyz;
    vs_TEXCOORD2.xyz = vec3(t0.y * float(1.0), t0.z * float(1.0), t0.w * float(-1.0));
    vs_TEXCOORD2.w = (-t0.x);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
mediump float t16_2;
highp float t3;
lowp float t10_3;
highp float t6;
void main()
{
    t0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    t3 = _ZBufferParams.x * t0.x + _ZBufferParams.y;
    t3 = float(1.0) / t3;
    t6 = (-t3) + t0.x;
    t3 = unity_OrthoParams.w * t6 + t3;
    t1.xy = vs_TEXCOORD2.xy;
    t6 = (-vs_TEXCOORD2.z) + vs_TEXCOORD2.w;
    t1.z = t0.x * t6 + vs_TEXCOORD2.z;
    t0.xzw = (-vs_TEXCOORD1.xyz) * vec3(t3) + t1.xyz;
    t1.xyz = vec3(t3) * vs_TEXCOORD1.xyz;
    t0.xyz = unity_OrthoParams.www * t0.xzw + t1.xyz;
    t1 = t0.yyyy * _CameraToWorld[1];
    t1 = _CameraToWorld[0] * t0.xxxx + t1;
    t0 = _CameraToWorld[2] * t0.zzzz + t1;
    t0 = t0 + _CameraToWorld[3];
    t1.xyz = t0.yyy * unity_World2Shadow[0][1].xyz;
    t1.xyz = unity_World2Shadow[0][0].xyz * t0.xxx + t1.xyz;
    t1.xyz = unity_World2Shadow[0][2].xyz * t0.zzz + t1.xyz;
    t1.xyz = unity_World2Shadow[0][3].xyz * t0.www + t1.xyz;
    t0.xyz = t0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    t0.x = dot(t0.xyz, t0.xyz);
    t0.x = sqrt(t0.x);
    t0.x = t0.x * _LightShadowData.z + _LightShadowData.w;
    t0.x = clamp(t0.x, 0.0, 1.0);
    vec3 txVec0 = vec3(t1.xy,t1.z);
    t10_3 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    t16_2 = (-_LightShadowData.x) + 1.0;
    t16_2 = t10_3 * t16_2 + _LightShadowData.x;
    t0 = t0.xxxx + vec4(t16_2);
    SV_Target0 = t0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_NATIVE" }
"!!GLES3"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
"!!GLES3"
}
SubProgram "gles " {
Keywords { "SHADOWS_SINGLE_CASCADE" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES3"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES3"
}
}
 }
}
SubShader { 
 Tags { "ShadowmapFilter"="PCF_5x5" }
 Pass {
  Tags { "ShadowmapFilter"="PCF_5x5" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 97017
Program "vp" {
SubProgram "gles " {
Keywords { "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowMapTexture_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec3 tmpvar_5;
  tmpvar_5 = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  highp vec4 tmpvar_7;
  tmpvar_7 = (_CameraToWorld * tmpvar_6);
  bvec4 tmpvar_8;
  tmpvar_8 = greaterThanEqual (tmpvar_5.zzzz, _LightSplitsNear);
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (tmpvar_5.zzzz, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = (vec4(tmpvar_8) * vec4(tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (((
    ((unity_World2Shadow[0] * tmpvar_7).xyz * tmpvar_10.x)
   + 
    ((unity_World2Shadow[1] * tmpvar_7).xyz * tmpvar_10.y)
  ) + (
    (unity_World2Shadow[2] * tmpvar_7)
  .xyz * tmpvar_10.z)) + ((unity_World2Shadow[3] * tmpvar_7).xyz * tmpvar_10.w));
  mediump float shadow_12;
  shadow_12 = 0.0;
  highp vec2 tmpvar_13;
  tmpvar_13 = _ShadowMapTexture_TexelSize.xy;
  highp vec3 tmpvar_14;
  tmpvar_14.xy = (tmpvar_11.xy - _ShadowMapTexture_TexelSize.xy);
  tmpvar_14.z = tmpvar_11.z;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_ShadowMapTexture, tmpvar_14.xy);
  mediump float tmpvar_16;
  if ((tmpvar_15.x < tmpvar_11.z)) {
    tmpvar_16 = 0.0;
  } else {
    tmpvar_16 = 1.0;
  };
  shadow_12 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17.x = 0.0;
  tmpvar_17.y = -(_ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_18;
  tmpvar_18.xy = (tmpvar_11.xy + tmpvar_17);
  tmpvar_18.z = tmpvar_11.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_ShadowMapTexture, tmpvar_18.xy);
  highp float tmpvar_20;
  if ((tmpvar_19.x < tmpvar_11.z)) {
    tmpvar_20 = 0.0;
  } else {
    tmpvar_20 = 1.0;
  };
  shadow_12 = (tmpvar_16 + tmpvar_20);
  highp vec2 tmpvar_21;
  tmpvar_21.x = tmpvar_13.x;
  tmpvar_21.y = -(_ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_22;
  tmpvar_22.xy = (tmpvar_11.xy + tmpvar_21);
  tmpvar_22.z = tmpvar_11.z;
  highp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_ShadowMapTexture, tmpvar_22.xy);
  highp float tmpvar_24;
  if ((tmpvar_23.x < tmpvar_11.z)) {
    tmpvar_24 = 0.0;
  } else {
    tmpvar_24 = 1.0;
  };
  shadow_12 = (shadow_12 + tmpvar_24);
  highp vec2 tmpvar_25;
  tmpvar_25.y = 0.0;
  tmpvar_25.x = -(_ShadowMapTexture_TexelSize.x);
  highp vec3 tmpvar_26;
  tmpvar_26.xy = (tmpvar_11.xy + tmpvar_25);
  tmpvar_26.z = tmpvar_11.z;
  highp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_ShadowMapTexture, tmpvar_26.xy);
  highp float tmpvar_28;
  if ((tmpvar_27.x < tmpvar_11.z)) {
    tmpvar_28 = 0.0;
  } else {
    tmpvar_28 = 1.0;
  };
  shadow_12 = (shadow_12 + tmpvar_28);
  highp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_ShadowMapTexture, tmpvar_11.xy);
  highp float tmpvar_30;
  if ((tmpvar_29.x < tmpvar_11.z)) {
    tmpvar_30 = 0.0;
  } else {
    tmpvar_30 = 1.0;
  };
  shadow_12 = (shadow_12 + tmpvar_30);
  highp vec2 tmpvar_31;
  tmpvar_31.y = 0.0;
  tmpvar_31.x = tmpvar_13.x;
  highp vec3 tmpvar_32;
  tmpvar_32.xy = (tmpvar_11.xy + tmpvar_31);
  tmpvar_32.z = tmpvar_11.z;
  highp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_ShadowMapTexture, tmpvar_32.xy);
  highp float tmpvar_34;
  if ((tmpvar_33.x < tmpvar_11.z)) {
    tmpvar_34 = 0.0;
  } else {
    tmpvar_34 = 1.0;
  };
  shadow_12 = (shadow_12 + tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = -(_ShadowMapTexture_TexelSize.x);
  tmpvar_35.y = tmpvar_13.y;
  highp vec3 tmpvar_36;
  tmpvar_36.xy = (tmpvar_11.xy + tmpvar_35);
  tmpvar_36.z = tmpvar_11.z;
  highp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_ShadowMapTexture, tmpvar_36.xy);
  highp float tmpvar_38;
  if ((tmpvar_37.x < tmpvar_11.z)) {
    tmpvar_38 = 0.0;
  } else {
    tmpvar_38 = 1.0;
  };
  shadow_12 = (shadow_12 + tmpvar_38);
  highp vec2 tmpvar_39;
  tmpvar_39.x = 0.0;
  tmpvar_39.y = tmpvar_13.y;
  highp vec3 tmpvar_40;
  tmpvar_40.xy = (tmpvar_11.xy + tmpvar_39);
  tmpvar_40.z = tmpvar_11.z;
  highp vec4 tmpvar_41;
  tmpvar_41 = texture2D (_ShadowMapTexture, tmpvar_40.xy);
  highp float tmpvar_42;
  if ((tmpvar_41.x < tmpvar_11.z)) {
    tmpvar_42 = 0.0;
  } else {
    tmpvar_42 = 1.0;
  };
  shadow_12 = (shadow_12 + tmpvar_42);
  highp vec3 tmpvar_43;
  tmpvar_43.xy = (tmpvar_11.xy + _ShadowMapTexture_TexelSize.xy);
  tmpvar_43.z = tmpvar_11.z;
  highp vec4 tmpvar_44;
  tmpvar_44 = texture2D (_ShadowMapTexture, tmpvar_43.xy);
  highp float tmpvar_45;
  if ((tmpvar_44.x < tmpvar_11.z)) {
    tmpvar_45 = 0.0;
  } else {
    tmpvar_45 = 1.0;
  };
  shadow_12 = (shadow_12 + tmpvar_45);
  shadow_12 = (shadow_12 / 9.0);
  mediump float tmpvar_46;
  tmpvar_46 = mix (_LightShadowData.x, 1.0, shadow_12);
  shadow_12 = tmpvar_46;
  highp float tmpvar_47;
  tmpvar_47 = clamp (((tmpvar_5.z * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  shadow_2 = (tmpvar_46 + tmpvar_47);
  mediump vec4 tmpvar_48;
  tmpvar_48 = vec4(shadow_2);
  tmpvar_1 = tmpvar_48;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp vec4 _LightSplitsNear;
uniform highp vec4 _LightSplitsFar;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _ShadowMapTexture_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec3 tmpvar_5;
  tmpvar_5 = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  highp vec4 tmpvar_7;
  tmpvar_7 = (_CameraToWorld * tmpvar_6);
  bvec4 tmpvar_8;
  tmpvar_8 = greaterThanEqual (tmpvar_5.zzzz, _LightSplitsNear);
  bvec4 tmpvar_9;
  tmpvar_9 = lessThan (tmpvar_5.zzzz, _LightSplitsFar);
  lowp vec4 tmpvar_10;
  tmpvar_10 = (vec4(tmpvar_8) * vec4(tmpvar_9));
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (((
    ((unity_World2Shadow[0] * tmpvar_7).xyz * tmpvar_10.x)
   + 
    ((unity_World2Shadow[1] * tmpvar_7).xyz * tmpvar_10.y)
  ) + (
    (unity_World2Shadow[2] * tmpvar_7)
  .xyz * tmpvar_10.z)) + ((unity_World2Shadow[3] * tmpvar_7).xyz * tmpvar_10.w));
  mediump vec3 accum_12;
  mediump float sum_13;
  mediump float shadow_14;
  highp vec3 v_15;
  highp vec3 u_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = ((tmpvar_11.xy * _ShadowMapTexture_TexelSize.zw) + vec2(0.5, 0.5));
  highp vec2 tmpvar_18;
  tmpvar_18 = ((floor(tmpvar_17) - vec2(0.5, 0.5)) * _ShadowMapTexture_TexelSize.xy);
  highp vec2 tmpvar_19;
  tmpvar_19 = fract(tmpvar_17);
  highp vec3 tmpvar_20;
  tmpvar_20.y = 7.0;
  tmpvar_20.x = (4.0 - (3.0 * tmpvar_19.x));
  tmpvar_20.z = (1.0 + (3.0 * tmpvar_19.x));
  highp vec3 tmpvar_21;
  tmpvar_21.x = (((3.0 - 
    (2.0 * tmpvar_19.x)
  ) / tmpvar_20.x) - 2.0);
  tmpvar_21.y = ((3.0 + tmpvar_19.x) / 7.0);
  tmpvar_21.z = ((tmpvar_19.x / tmpvar_20.z) + 2.0);
  u_16 = (tmpvar_21 * _ShadowMapTexture_TexelSize.x);
  highp vec3 tmpvar_22;
  tmpvar_22.y = 7.0;
  tmpvar_22.x = (4.0 - (3.0 * tmpvar_19.y));
  tmpvar_22.z = (1.0 + (3.0 * tmpvar_19.y));
  highp vec3 tmpvar_23;
  tmpvar_23.x = (((3.0 - 
    (2.0 * tmpvar_19.y)
  ) / tmpvar_22.x) - 2.0);
  tmpvar_23.y = ((3.0 + tmpvar_19.y) / 7.0);
  tmpvar_23.z = ((tmpvar_19.y / tmpvar_22.z) + 2.0);
  v_15 = (tmpvar_23 * _ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_24;
  tmpvar_24 = (tmpvar_20 * tmpvar_22.x);
  accum_12 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25.x = u_16.x;
  tmpvar_25.y = v_15.x;
  highp float depth_26;
  depth_26 = tmpvar_11.z;
  highp vec3 uv_27;
  highp vec3 tmpvar_28;
  tmpvar_28.xy = (tmpvar_18 + tmpvar_25);
  tmpvar_28.z = depth_26;
  uv_27.xy = tmpvar_28.xy;
  uv_27.z = depth_26;
  lowp float tmpvar_29;
  tmpvar_29 = shadow2DEXT (_ShadowMapTexture, uv_27);
  sum_13 = (accum_12.x * tmpvar_29);
  highp vec2 tmpvar_30;
  tmpvar_30.x = u_16.y;
  tmpvar_30.y = v_15.x;
  highp float depth_31;
  depth_31 = tmpvar_11.z;
  highp vec3 uv_32;
  highp vec3 tmpvar_33;
  tmpvar_33.xy = (tmpvar_18 + tmpvar_30);
  tmpvar_33.z = depth_31;
  uv_32.xy = tmpvar_33.xy;
  uv_32.z = depth_31;
  lowp float tmpvar_34;
  tmpvar_34 = shadow2DEXT (_ShadowMapTexture, uv_32);
  sum_13 = (sum_13 + (accum_12.y * tmpvar_34));
  highp vec2 tmpvar_35;
  tmpvar_35.x = u_16.z;
  tmpvar_35.y = v_15.x;
  highp float depth_36;
  depth_36 = tmpvar_11.z;
  highp vec3 uv_37;
  highp vec3 tmpvar_38;
  tmpvar_38.xy = (tmpvar_18 + tmpvar_35);
  tmpvar_38.z = depth_36;
  uv_37.xy = tmpvar_38.xy;
  uv_37.z = depth_36;
  lowp float tmpvar_39;
  tmpvar_39 = shadow2DEXT (_ShadowMapTexture, uv_37);
  sum_13 = (sum_13 + (accum_12.z * tmpvar_39));
  accum_12 = (tmpvar_20 * 7.0);
  highp vec2 tmpvar_40;
  tmpvar_40.x = u_16.x;
  tmpvar_40.y = v_15.y;
  highp float depth_41;
  depth_41 = tmpvar_11.z;
  highp vec3 uv_42;
  highp vec3 tmpvar_43;
  tmpvar_43.xy = (tmpvar_18 + tmpvar_40);
  tmpvar_43.z = depth_41;
  uv_42.xy = tmpvar_43.xy;
  uv_42.z = depth_41;
  lowp float tmpvar_44;
  tmpvar_44 = shadow2DEXT (_ShadowMapTexture, uv_42);
  sum_13 = (sum_13 + (accum_12.x * tmpvar_44));
  highp vec2 tmpvar_45;
  tmpvar_45.x = u_16.y;
  tmpvar_45.y = v_15.y;
  highp float depth_46;
  depth_46 = tmpvar_11.z;
  highp vec3 uv_47;
  highp vec3 tmpvar_48;
  tmpvar_48.xy = (tmpvar_18 + tmpvar_45);
  tmpvar_48.z = depth_46;
  uv_47.xy = tmpvar_48.xy;
  uv_47.z = depth_46;
  lowp float tmpvar_49;
  tmpvar_49 = shadow2DEXT (_ShadowMapTexture, uv_47);
  sum_13 = (sum_13 + (accum_12.y * tmpvar_49));
  highp vec2 tmpvar_50;
  tmpvar_50.x = u_16.z;
  tmpvar_50.y = v_15.y;
  highp float depth_51;
  depth_51 = tmpvar_11.z;
  highp vec3 uv_52;
  highp vec3 tmpvar_53;
  tmpvar_53.xy = (tmpvar_18 + tmpvar_50);
  tmpvar_53.z = depth_51;
  uv_52.xy = tmpvar_53.xy;
  uv_52.z = depth_51;
  lowp float tmpvar_54;
  tmpvar_54 = shadow2DEXT (_ShadowMapTexture, uv_52);
  sum_13 = (sum_13 + (accum_12.z * tmpvar_54));
  accum_12 = (tmpvar_20 * tmpvar_22.z);
  highp vec2 tmpvar_55;
  tmpvar_55.x = u_16.x;
  tmpvar_55.y = v_15.z;
  highp float depth_56;
  depth_56 = tmpvar_11.z;
  highp vec3 uv_57;
  highp vec3 tmpvar_58;
  tmpvar_58.xy = (tmpvar_18 + tmpvar_55);
  tmpvar_58.z = depth_56;
  uv_57.xy = tmpvar_58.xy;
  uv_57.z = depth_56;
  lowp float tmpvar_59;
  tmpvar_59 = shadow2DEXT (_ShadowMapTexture, uv_57);
  sum_13 = (sum_13 + (accum_12.x * tmpvar_59));
  highp vec2 tmpvar_60;
  tmpvar_60.x = u_16.y;
  tmpvar_60.y = v_15.z;
  highp float depth_61;
  depth_61 = tmpvar_11.z;
  highp vec3 uv_62;
  highp vec3 tmpvar_63;
  tmpvar_63.xy = (tmpvar_18 + tmpvar_60);
  tmpvar_63.z = depth_61;
  uv_62.xy = tmpvar_63.xy;
  uv_62.z = depth_61;
  lowp float tmpvar_64;
  tmpvar_64 = shadow2DEXT (_ShadowMapTexture, uv_62);
  sum_13 = (sum_13 + (accum_12.y * tmpvar_64));
  highp vec2 tmpvar_65;
  tmpvar_65.x = u_16.z;
  tmpvar_65.y = v_15.z;
  highp float depth_66;
  depth_66 = tmpvar_11.z;
  highp vec3 uv_67;
  highp vec3 tmpvar_68;
  tmpvar_68.xy = (tmpvar_18 + tmpvar_65);
  tmpvar_68.z = depth_66;
  uv_67.xy = tmpvar_68.xy;
  uv_67.z = depth_66;
  lowp float tmpvar_69;
  tmpvar_69 = shadow2DEXT (_ShadowMapTexture, uv_67);
  sum_13 = (sum_13 + (accum_12.z * tmpvar_69));
  shadow_14 = (sum_13 / 144.0);
  mediump float tmpvar_70;
  tmpvar_70 = mix (_LightShadowData.x, 1.0, shadow_14);
  shadow_14 = tmpvar_70;
  highp float tmpvar_71;
  tmpvar_71 = clamp (((tmpvar_5.z * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  shadow_2 = (tmpvar_70 + tmpvar_71);
  mediump vec4 tmpvar_72;
  tmpvar_72 = vec4(shadow_2);
  tmpvar_1 = tmpvar_72;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_NATIVE" }
"!!GLES3
#ifdef VERTEX
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
highp vec4 t0;
highp vec3 t1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    t0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    t1.x = t0.y * _ProjectionParams.x;
    t1.xyz = t1.xxx * unity_CameraInvProjection[1].xyz;
    t1.xyz = unity_CameraInvProjection[0].xyz * t0.xxx + t1.xyz;
    gl_Position = t0;
    t0.x = t1.z + unity_CameraInvProjection[2].z;
    t0.yzw = t1.xyz + (-unity_CameraInvProjection[2].xyz);
    t0 = t0 + unity_CameraInvProjection[3].zxyz;
    vs_TEXCOORD2.xyz = vec3(t0.y * float(1.0), t0.z * float(1.0), t0.w * float(-1.0));
    vs_TEXCOORD2.w = (-t0.x);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
lowp vec4 t10_1;
bvec4 tb1;
highp vec4 t2;
lowp float t10_2;
bvec4 tb2;
highp vec4 t3;
highp vec4 t4;
highp vec3 t5;
highp vec4 t6;
highp vec3 t7;
highp vec3 t8;
lowp float t10_8;
highp float t16;
mediump float t16_16;
lowp float t10_16;
highp vec2 t18;
lowp float t10_18;
lowp float t10_24;
void main()
{
    t0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    t8.x = _ZBufferParams.x * t0.x + _ZBufferParams.y;
    t8.x = float(1.0) / t8.x;
    t16 = (-t8.x) + t0.x;
    t8.x = unity_OrthoParams.w * t16 + t8.x;
    t1.xy = vs_TEXCOORD2.xy;
    t16 = (-vs_TEXCOORD2.z) + vs_TEXCOORD2.w;
    t1.z = t0.x * t16 + vs_TEXCOORD2.z;
    t0.xzw = (-vs_TEXCOORD1.xyz) * t8.xxx + t1.xyz;
    t1.xyz = t8.xxx * vs_TEXCOORD1.xyz;
    t0.xyz = unity_OrthoParams.www * t0.xzw + t1.xyz;
    tb1 = greaterThanEqual(t0.zzzz, _LightSplitsNear);
    t1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(tb1));
    tb2 = lessThan(t0.zzzz, _LightSplitsFar);
    t2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(tb2));
    t10_1 = t1 * t2;
    t2 = t0.yyyy * _CameraToWorld[1];
    t2 = _CameraToWorld[0] * t0.xxxx + t2;
    t2 = _CameraToWorld[2] * t0.zzzz + t2;
    t0.x = t0.z * _LightShadowData.z + _LightShadowData.w;
    t0.x = clamp(t0.x, 0.0, 1.0);
    t2 = t2 + _CameraToWorld[3];
    t8.xyz = t2.yyy * unity_World2Shadow[1][1].xyz;
    t8.xyz = unity_World2Shadow[1][0].xyz * t2.xxx + t8.xyz;
    t8.xyz = unity_World2Shadow[1][2].xyz * t2.zzz + t8.xyz;
    t8.xyz = unity_World2Shadow[1][3].xyz * t2.www + t8.xyz;
    t8.xyz = t10_1.yyy * t8.xyz;
    t3.xyz = t2.yyy * unity_World2Shadow[0][1].xyz;
    t3.xyz = unity_World2Shadow[0][0].xyz * t2.xxx + t3.xyz;
    t3.xyz = unity_World2Shadow[0][2].xyz * t2.zzz + t3.xyz;
    t3.xyz = unity_World2Shadow[0][3].xyz * t2.www + t3.xyz;
    t8.xyz = t3.xyz * t10_1.xxx + t8.xyz;
    t3.xyz = t2.yyy * unity_World2Shadow[2][1].xyz;
    t3.xyz = unity_World2Shadow[2][0].xyz * t2.xxx + t3.xyz;
    t3.xyz = unity_World2Shadow[2][2].xyz * t2.zzz + t3.xyz;
    t3.xyz = unity_World2Shadow[2][3].xyz * t2.www + t3.xyz;
    t8.xyz = t3.xyz * t10_1.zzz + t8.xyz;
    t3.xyz = t2.yyy * unity_World2Shadow[3][1].xyz;
    t3.xyz = unity_World2Shadow[3][0].xyz * t2.xxx + t3.xyz;
    t2.xyz = unity_World2Shadow[3][2].xyz * t2.zzz + t3.xyz;
    t2.xyz = unity_World2Shadow[3][3].xyz * t2.www + t2.xyz;
    t8.xyz = t2.xyz * t10_1.www + t8.xyz;
    t8.xy = t8.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
    t2.xy = floor(t8.xy);
    t8.xy = fract(t8.xy);
    t2.xy = t2.xy + vec2(-0.5, -0.5);
    t18.xy = (-t8.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    t3.xy = (-t8.xy) * vec2(3.0, 3.0) + vec2(4.0, 4.0);
    t18.xy = t18.xy / t3.xy;
    t1.xy = t18.xy + vec2(-2.0, -2.0);
    t4.z = t1.y;
    t18.xy = t8.xy * vec2(3.0, 3.0) + vec2(1.0, 1.0);
    t3.xz = t8.xy / t18.xy;
    t4.xw = t3.xz + vec2(2.0, 2.0);
    t1.w = t4.x;
    t3.xz = t8.xy + vec2(3.0, 3.0);
    t8.x = t8.x * 3.0;
    t5.xz = t8.xx * vec2(-1.0, 1.0) + vec2(4.0, 1.0);
    t4.xy = t3.xz * _ShadowMapTexture_TexelSize.xy;
    t6.xz = _ShadowMapTexture_TexelSize.yy;
    t6.y = 0.142857149;
    t6.xyz = vec3(t4.z * t6.x, t4.y * t6.y, t4.w * t6.z);
    t1.z = t4.x;
    t4.w = t6.x;
    t7.xz = _ShadowMapTexture_TexelSize.xx;
    t7.y = 0.142857149;
    t4.xyz = t1.zxw * t7.yxz;
    t1 = t2.xyxy * _ShadowMapTexture_TexelSize.xyxy + t4.ywxw;
    t8.xy = t2.xy * _ShadowMapTexture_TexelSize.xy + t4.zw;
    vec3 txVec1 = vec3(t8.xy,t8.z);
    t10_8 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    vec3 txVec2 = vec3(t1.xy,t8.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(t1.zw,t8.z);
    t10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    t5.y = 7.0;
    t3.xyz = t3.yyy * t5.xyz;
    t7.xyz = t18.yyy * t5.xyz;
    t5.xy = t5.xz * vec2(7.0, 7.0);
    t18.x = t10_18 * t3.y;
    t16 = t3.x * t10_16 + t18.x;
    t8.x = t3.z * t10_8 + t16;
    t6.w = t4.y;
    t1 = t2.xyxy * _ShadowMapTexture_TexelSize.xyxy + t6.wywz;
    t4.yw = t6.yz;
    vec3 txVec4 = vec3(t1.xy,t8.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
    vec3 txVec5 = vec3(t1.zw,t8.z);
    t10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
    t8.x = t5.x * t10_16 + t8.x;
    t1 = t2.xyxy * _ShadowMapTexture_TexelSize.xyxy + t4.xyzy;
    t3 = t2.xyxy * _ShadowMapTexture_TexelSize.xyxy + t4.xwzw;
    vec3 txVec6 = vec3(t1.xy,t8.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
    vec3 txVec7 = vec3(t1.zw,t8.z);
    t10_2 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
    t8.x = t10_16 * 49.0 + t8.x;
    t8.x = t5.y * t10_2 + t8.x;
    t8.x = t7.x * t10_18 + t8.x;
    vec3 txVec8 = vec3(t3.xy,t8.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
    vec3 txVec9 = vec3(t3.zw,t8.z);
    t10_24 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
    t8.x = t7.y * t10_16 + t8.x;
    t8.x = t7.z * t10_24 + t8.x;
    t8.x = t8.x * 0.0069444445;
    t16_16 = (-_LightShadowData.x) + 1.0;
    t8.x = t8.x * t16_16 + _LightShadowData.x;
    t0 = t0.xxxx + t8.xxxx;
    SV_Target0 = t0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowMapTexture_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_CameraToWorld * tmpvar_5);
  lowp vec4 weights_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_8, tmpvar_8);
  tmpvar_12.y = dot (tmpvar_9, tmpvar_9);
  tmpvar_12.z = dot (tmpvar_10, tmpvar_10);
  tmpvar_12.w = dot (tmpvar_11, tmpvar_11);
  bvec4 tmpvar_13;
  tmpvar_13 = lessThan (tmpvar_12, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_14;
  tmpvar_14 = vec4(tmpvar_13);
  weights_7.x = tmpvar_14.x;
  weights_7.yzw = clamp ((tmpvar_14.yzw - tmpvar_14.xyz), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    ((unity_World2Shadow[0] * tmpvar_6).xyz * tmpvar_14.x)
   + 
    ((unity_World2Shadow[1] * tmpvar_6).xyz * weights_7.y)
  ) + (
    (unity_World2Shadow[2] * tmpvar_6)
  .xyz * weights_7.z)) + ((unity_World2Shadow[3] * tmpvar_6).xyz * weights_7.w));
  mediump float shadow_16;
  shadow_16 = 0.0;
  highp vec2 tmpvar_17;
  tmpvar_17 = _ShadowMapTexture_TexelSize.xy;
  highp vec3 tmpvar_18;
  tmpvar_18.xy = (tmpvar_15.xy - _ShadowMapTexture_TexelSize.xy);
  tmpvar_18.z = tmpvar_15.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_ShadowMapTexture, tmpvar_18.xy);
  mediump float tmpvar_20;
  if ((tmpvar_19.x < tmpvar_15.z)) {
    tmpvar_20 = 0.0;
  } else {
    tmpvar_20 = 1.0;
  };
  shadow_16 = tmpvar_20;
  highp vec2 tmpvar_21;
  tmpvar_21.x = 0.0;
  tmpvar_21.y = -(_ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_22;
  tmpvar_22.xy = (tmpvar_15.xy + tmpvar_21);
  tmpvar_22.z = tmpvar_15.z;
  highp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_ShadowMapTexture, tmpvar_22.xy);
  highp float tmpvar_24;
  if ((tmpvar_23.x < tmpvar_15.z)) {
    tmpvar_24 = 0.0;
  } else {
    tmpvar_24 = 1.0;
  };
  shadow_16 = (tmpvar_20 + tmpvar_24);
  highp vec2 tmpvar_25;
  tmpvar_25.x = tmpvar_17.x;
  tmpvar_25.y = -(_ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_26;
  tmpvar_26.xy = (tmpvar_15.xy + tmpvar_25);
  tmpvar_26.z = tmpvar_15.z;
  highp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_ShadowMapTexture, tmpvar_26.xy);
  highp float tmpvar_28;
  if ((tmpvar_27.x < tmpvar_15.z)) {
    tmpvar_28 = 0.0;
  } else {
    tmpvar_28 = 1.0;
  };
  shadow_16 = (shadow_16 + tmpvar_28);
  highp vec2 tmpvar_29;
  tmpvar_29.y = 0.0;
  tmpvar_29.x = -(_ShadowMapTexture_TexelSize.x);
  highp vec3 tmpvar_30;
  tmpvar_30.xy = (tmpvar_15.xy + tmpvar_29);
  tmpvar_30.z = tmpvar_15.z;
  highp vec4 tmpvar_31;
  tmpvar_31 = texture2D (_ShadowMapTexture, tmpvar_30.xy);
  highp float tmpvar_32;
  if ((tmpvar_31.x < tmpvar_15.z)) {
    tmpvar_32 = 0.0;
  } else {
    tmpvar_32 = 1.0;
  };
  shadow_16 = (shadow_16 + tmpvar_32);
  highp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_ShadowMapTexture, tmpvar_15.xy);
  highp float tmpvar_34;
  if ((tmpvar_33.x < tmpvar_15.z)) {
    tmpvar_34 = 0.0;
  } else {
    tmpvar_34 = 1.0;
  };
  shadow_16 = (shadow_16 + tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.y = 0.0;
  tmpvar_35.x = tmpvar_17.x;
  highp vec3 tmpvar_36;
  tmpvar_36.xy = (tmpvar_15.xy + tmpvar_35);
  tmpvar_36.z = tmpvar_15.z;
  highp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_ShadowMapTexture, tmpvar_36.xy);
  highp float tmpvar_38;
  if ((tmpvar_37.x < tmpvar_15.z)) {
    tmpvar_38 = 0.0;
  } else {
    tmpvar_38 = 1.0;
  };
  shadow_16 = (shadow_16 + tmpvar_38);
  highp vec2 tmpvar_39;
  tmpvar_39.x = -(_ShadowMapTexture_TexelSize.x);
  tmpvar_39.y = tmpvar_17.y;
  highp vec3 tmpvar_40;
  tmpvar_40.xy = (tmpvar_15.xy + tmpvar_39);
  tmpvar_40.z = tmpvar_15.z;
  highp vec4 tmpvar_41;
  tmpvar_41 = texture2D (_ShadowMapTexture, tmpvar_40.xy);
  highp float tmpvar_42;
  if ((tmpvar_41.x < tmpvar_15.z)) {
    tmpvar_42 = 0.0;
  } else {
    tmpvar_42 = 1.0;
  };
  shadow_16 = (shadow_16 + tmpvar_42);
  highp vec2 tmpvar_43;
  tmpvar_43.x = 0.0;
  tmpvar_43.y = tmpvar_17.y;
  highp vec3 tmpvar_44;
  tmpvar_44.xy = (tmpvar_15.xy + tmpvar_43);
  tmpvar_44.z = tmpvar_15.z;
  highp vec4 tmpvar_45;
  tmpvar_45 = texture2D (_ShadowMapTexture, tmpvar_44.xy);
  highp float tmpvar_46;
  if ((tmpvar_45.x < tmpvar_15.z)) {
    tmpvar_46 = 0.0;
  } else {
    tmpvar_46 = 1.0;
  };
  shadow_16 = (shadow_16 + tmpvar_46);
  highp vec3 tmpvar_47;
  tmpvar_47.xy = (tmpvar_15.xy + _ShadowMapTexture_TexelSize.xy);
  tmpvar_47.z = tmpvar_15.z;
  highp vec4 tmpvar_48;
  tmpvar_48 = texture2D (_ShadowMapTexture, tmpvar_47.xy);
  highp float tmpvar_49;
  if ((tmpvar_48.x < tmpvar_15.z)) {
    tmpvar_49 = 0.0;
  } else {
    tmpvar_49 = 1.0;
  };
  shadow_16 = (shadow_16 + tmpvar_49);
  shadow_16 = (shadow_16 / 9.0);
  mediump float tmpvar_50;
  tmpvar_50 = mix (_LightShadowData.x, 1.0, shadow_16);
  shadow_16 = tmpvar_50;
  highp float tmpvar_51;
  highp vec3 tmpvar_52;
  tmpvar_52 = (tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_53;
  highp float tmpvar_54;
  tmpvar_54 = clamp (((
    sqrt(dot (tmpvar_52, tmpvar_52))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_53 = tmpvar_54;
  tmpvar_51 = tmpvar_53;
  shadow_2 = (tmpvar_50 + tmpvar_51);
  mediump vec4 tmpvar_55;
  tmpvar_55 = vec4(shadow_2);
  tmpvar_1 = tmpvar_55;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp vec4 unity_ShadowSplitSpheres[4];
uniform highp vec4 unity_ShadowSplitSqRadii;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _ShadowMapTexture_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_CameraToWorld * tmpvar_5);
  lowp vec4 weights_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[0].xyz);
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[1].xyz);
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[2].xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_6.xyz - unity_ShadowSplitSpheres[3].xyz);
  highp vec4 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_8, tmpvar_8);
  tmpvar_12.y = dot (tmpvar_9, tmpvar_9);
  tmpvar_12.z = dot (tmpvar_10, tmpvar_10);
  tmpvar_12.w = dot (tmpvar_11, tmpvar_11);
  bvec4 tmpvar_13;
  tmpvar_13 = lessThan (tmpvar_12, unity_ShadowSplitSqRadii);
  lowp vec4 tmpvar_14;
  tmpvar_14 = vec4(tmpvar_13);
  weights_7.x = tmpvar_14.x;
  weights_7.yzw = clamp ((tmpvar_14.yzw - tmpvar_14.xyz), 0.0, 1.0);
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = (((
    ((unity_World2Shadow[0] * tmpvar_6).xyz * tmpvar_14.x)
   + 
    ((unity_World2Shadow[1] * tmpvar_6).xyz * weights_7.y)
  ) + (
    (unity_World2Shadow[2] * tmpvar_6)
  .xyz * weights_7.z)) + ((unity_World2Shadow[3] * tmpvar_6).xyz * weights_7.w));
  mediump vec3 accum_16;
  mediump float sum_17;
  mediump float shadow_18;
  highp vec3 v_19;
  highp vec3 u_20;
  highp vec2 tmpvar_21;
  tmpvar_21 = ((tmpvar_15.xy * _ShadowMapTexture_TexelSize.zw) + vec2(0.5, 0.5));
  highp vec2 tmpvar_22;
  tmpvar_22 = ((floor(tmpvar_21) - vec2(0.5, 0.5)) * _ShadowMapTexture_TexelSize.xy);
  highp vec2 tmpvar_23;
  tmpvar_23 = fract(tmpvar_21);
  highp vec3 tmpvar_24;
  tmpvar_24.y = 7.0;
  tmpvar_24.x = (4.0 - (3.0 * tmpvar_23.x));
  tmpvar_24.z = (1.0 + (3.0 * tmpvar_23.x));
  highp vec3 tmpvar_25;
  tmpvar_25.x = (((3.0 - 
    (2.0 * tmpvar_23.x)
  ) / tmpvar_24.x) - 2.0);
  tmpvar_25.y = ((3.0 + tmpvar_23.x) / 7.0);
  tmpvar_25.z = ((tmpvar_23.x / tmpvar_24.z) + 2.0);
  u_20 = (tmpvar_25 * _ShadowMapTexture_TexelSize.x);
  highp vec3 tmpvar_26;
  tmpvar_26.y = 7.0;
  tmpvar_26.x = (4.0 - (3.0 * tmpvar_23.y));
  tmpvar_26.z = (1.0 + (3.0 * tmpvar_23.y));
  highp vec3 tmpvar_27;
  tmpvar_27.x = (((3.0 - 
    (2.0 * tmpvar_23.y)
  ) / tmpvar_26.x) - 2.0);
  tmpvar_27.y = ((3.0 + tmpvar_23.y) / 7.0);
  tmpvar_27.z = ((tmpvar_23.y / tmpvar_26.z) + 2.0);
  v_19 = (tmpvar_27 * _ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_28;
  tmpvar_28 = (tmpvar_24 * tmpvar_26.x);
  accum_16 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29.x = u_20.x;
  tmpvar_29.y = v_19.x;
  highp float depth_30;
  depth_30 = tmpvar_15.z;
  highp vec3 uv_31;
  highp vec3 tmpvar_32;
  tmpvar_32.xy = (tmpvar_22 + tmpvar_29);
  tmpvar_32.z = depth_30;
  uv_31.xy = tmpvar_32.xy;
  uv_31.z = depth_30;
  lowp float tmpvar_33;
  tmpvar_33 = shadow2DEXT (_ShadowMapTexture, uv_31);
  sum_17 = (accum_16.x * tmpvar_33);
  highp vec2 tmpvar_34;
  tmpvar_34.x = u_20.y;
  tmpvar_34.y = v_19.x;
  highp float depth_35;
  depth_35 = tmpvar_15.z;
  highp vec3 uv_36;
  highp vec3 tmpvar_37;
  tmpvar_37.xy = (tmpvar_22 + tmpvar_34);
  tmpvar_37.z = depth_35;
  uv_36.xy = tmpvar_37.xy;
  uv_36.z = depth_35;
  lowp float tmpvar_38;
  tmpvar_38 = shadow2DEXT (_ShadowMapTexture, uv_36);
  sum_17 = (sum_17 + (accum_16.y * tmpvar_38));
  highp vec2 tmpvar_39;
  tmpvar_39.x = u_20.z;
  tmpvar_39.y = v_19.x;
  highp float depth_40;
  depth_40 = tmpvar_15.z;
  highp vec3 uv_41;
  highp vec3 tmpvar_42;
  tmpvar_42.xy = (tmpvar_22 + tmpvar_39);
  tmpvar_42.z = depth_40;
  uv_41.xy = tmpvar_42.xy;
  uv_41.z = depth_40;
  lowp float tmpvar_43;
  tmpvar_43 = shadow2DEXT (_ShadowMapTexture, uv_41);
  sum_17 = (sum_17 + (accum_16.z * tmpvar_43));
  accum_16 = (tmpvar_24 * 7.0);
  highp vec2 tmpvar_44;
  tmpvar_44.x = u_20.x;
  tmpvar_44.y = v_19.y;
  highp float depth_45;
  depth_45 = tmpvar_15.z;
  highp vec3 uv_46;
  highp vec3 tmpvar_47;
  tmpvar_47.xy = (tmpvar_22 + tmpvar_44);
  tmpvar_47.z = depth_45;
  uv_46.xy = tmpvar_47.xy;
  uv_46.z = depth_45;
  lowp float tmpvar_48;
  tmpvar_48 = shadow2DEXT (_ShadowMapTexture, uv_46);
  sum_17 = (sum_17 + (accum_16.x * tmpvar_48));
  highp vec2 tmpvar_49;
  tmpvar_49.x = u_20.y;
  tmpvar_49.y = v_19.y;
  highp float depth_50;
  depth_50 = tmpvar_15.z;
  highp vec3 uv_51;
  highp vec3 tmpvar_52;
  tmpvar_52.xy = (tmpvar_22 + tmpvar_49);
  tmpvar_52.z = depth_50;
  uv_51.xy = tmpvar_52.xy;
  uv_51.z = depth_50;
  lowp float tmpvar_53;
  tmpvar_53 = shadow2DEXT (_ShadowMapTexture, uv_51);
  sum_17 = (sum_17 + (accum_16.y * tmpvar_53));
  highp vec2 tmpvar_54;
  tmpvar_54.x = u_20.z;
  tmpvar_54.y = v_19.y;
  highp float depth_55;
  depth_55 = tmpvar_15.z;
  highp vec3 uv_56;
  highp vec3 tmpvar_57;
  tmpvar_57.xy = (tmpvar_22 + tmpvar_54);
  tmpvar_57.z = depth_55;
  uv_56.xy = tmpvar_57.xy;
  uv_56.z = depth_55;
  lowp float tmpvar_58;
  tmpvar_58 = shadow2DEXT (_ShadowMapTexture, uv_56);
  sum_17 = (sum_17 + (accum_16.z * tmpvar_58));
  accum_16 = (tmpvar_24 * tmpvar_26.z);
  highp vec2 tmpvar_59;
  tmpvar_59.x = u_20.x;
  tmpvar_59.y = v_19.z;
  highp float depth_60;
  depth_60 = tmpvar_15.z;
  highp vec3 uv_61;
  highp vec3 tmpvar_62;
  tmpvar_62.xy = (tmpvar_22 + tmpvar_59);
  tmpvar_62.z = depth_60;
  uv_61.xy = tmpvar_62.xy;
  uv_61.z = depth_60;
  lowp float tmpvar_63;
  tmpvar_63 = shadow2DEXT (_ShadowMapTexture, uv_61);
  sum_17 = (sum_17 + (accum_16.x * tmpvar_63));
  highp vec2 tmpvar_64;
  tmpvar_64.x = u_20.y;
  tmpvar_64.y = v_19.z;
  highp float depth_65;
  depth_65 = tmpvar_15.z;
  highp vec3 uv_66;
  highp vec3 tmpvar_67;
  tmpvar_67.xy = (tmpvar_22 + tmpvar_64);
  tmpvar_67.z = depth_65;
  uv_66.xy = tmpvar_67.xy;
  uv_66.z = depth_65;
  lowp float tmpvar_68;
  tmpvar_68 = shadow2DEXT (_ShadowMapTexture, uv_66);
  sum_17 = (sum_17 + (accum_16.y * tmpvar_68));
  highp vec2 tmpvar_69;
  tmpvar_69.x = u_20.z;
  tmpvar_69.y = v_19.z;
  highp float depth_70;
  depth_70 = tmpvar_15.z;
  highp vec3 uv_71;
  highp vec3 tmpvar_72;
  tmpvar_72.xy = (tmpvar_22 + tmpvar_69);
  tmpvar_72.z = depth_70;
  uv_71.xy = tmpvar_72.xy;
  uv_71.z = depth_70;
  lowp float tmpvar_73;
  tmpvar_73 = shadow2DEXT (_ShadowMapTexture, uv_71);
  sum_17 = (sum_17 + (accum_16.z * tmpvar_73));
  shadow_18 = (sum_17 / 144.0);
  mediump float tmpvar_74;
  tmpvar_74 = mix (_LightShadowData.x, 1.0, shadow_18);
  shadow_18 = tmpvar_74;
  highp float tmpvar_75;
  highp vec3 tmpvar_76;
  tmpvar_76 = (tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_77;
  highp float tmpvar_78;
  tmpvar_78 = clamp (((
    sqrt(dot (tmpvar_76, tmpvar_76))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_77 = tmpvar_78;
  tmpvar_75 = tmpvar_77;
  shadow_2 = (tmpvar_74 + tmpvar_75);
  mediump vec4 tmpvar_79;
  tmpvar_79 = vec4(shadow_2);
  tmpvar_1 = tmpvar_79;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
"!!GLES3
#ifdef VERTEX
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
highp vec4 t0;
highp vec3 t1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    t0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    t1.x = t0.y * _ProjectionParams.x;
    t1.xyz = t1.xxx * unity_CameraInvProjection[1].xyz;
    t1.xyz = unity_CameraInvProjection[0].xyz * t0.xxx + t1.xyz;
    gl_Position = t0;
    t0.x = t1.z + unity_CameraInvProjection[2].z;
    t0.yzw = t1.xyz + (-unity_CameraInvProjection[2].xyz);
    t0 = t0 + unity_CameraInvProjection[3].zxyz;
    vs_TEXCOORD2.xyz = vec3(t0.y * float(1.0), t0.z * float(1.0), t0.w * float(-1.0));
    vs_TEXCOORD2.w = (-t0.x);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
lowp float t10_1;
bvec4 tb1;
highp vec4 t2;
highp vec4 t3;
lowp vec3 t10_3;
highp vec4 t4;
highp vec3 t5;
highp vec4 t6;
highp vec3 t7;
highp vec3 t8;
lowp float t10_8;
highp vec3 t9;
highp float t16;
mediump float t16_16;
lowp float t10_16;
highp vec2 t17;
lowp float t10_17;
lowp float t10_24;
void main()
{
    t0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    t8.x = _ZBufferParams.x * t0.x + _ZBufferParams.y;
    t8.x = float(1.0) / t8.x;
    t16 = (-t8.x) + t0.x;
    t8.x = unity_OrthoParams.w * t16 + t8.x;
    t1.xy = vs_TEXCOORD2.xy;
    t16 = (-vs_TEXCOORD2.z) + vs_TEXCOORD2.w;
    t1.z = t0.x * t16 + vs_TEXCOORD2.z;
    t0.xzw = (-vs_TEXCOORD1.xyz) * t8.xxx + t1.xyz;
    t1.xyz = t8.xxx * vs_TEXCOORD1.xyz;
    t0.xyz = unity_OrthoParams.www * t0.xzw + t1.xyz;
    t1 = t0.yyyy * _CameraToWorld[1];
    t1 = _CameraToWorld[0] * t0.xxxx + t1;
    t0 = _CameraToWorld[2] * t0.zzzz + t1;
    t0 = t0 + _CameraToWorld[3];
    t1.xyz = t0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    t1.x = dot(t1.xyz, t1.xyz);
    t2.xyz = t0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    t1.y = dot(t2.xyz, t2.xyz);
    t2.xyz = t0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    t1.z = dot(t2.xyz, t2.xyz);
    t2.xyz = t0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    t1.w = dot(t2.xyz, t2.xyz);
    tb1 = lessThan(t1, unity_ShadowSplitSqRadii);
    t10_3.x = (tb1.x) ? float(-1.0) : float(-0.0);
    t10_3.y = (tb1.y) ? float(-1.0) : float(-0.0);
    t10_3.z = (tb1.z) ? float(-1.0) : float(-0.0);
    t1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(tb1));
    t10_3.xyz = vec3(t10_3.x + t1.y, t10_3.y + t1.z, t10_3.z + t1.w);
    t10_3.xyz = max(t10_3.xyz, vec3(0.0, 0.0, 0.0));
    t9.xyz = t0.yyy * unity_World2Shadow[1][1].xyz;
    t9.xyz = unity_World2Shadow[1][0].xyz * t0.xxx + t9.xyz;
    t9.xyz = unity_World2Shadow[1][2].xyz * t0.zzz + t9.xyz;
    t9.xyz = unity_World2Shadow[1][3].xyz * t0.www + t9.xyz;
    t9.xyz = t10_3.xxx * t9.xyz;
    t2.xyz = t0.yyy * unity_World2Shadow[0][1].xyz;
    t2.xyz = unity_World2Shadow[0][0].xyz * t0.xxx + t2.xyz;
    t2.xyz = unity_World2Shadow[0][2].xyz * t0.zzz + t2.xyz;
    t2.xyz = unity_World2Shadow[0][3].xyz * t0.www + t2.xyz;
    t1.xyz = t2.xyz * t1.xxx + t9.xyz;
    t2.xyz = t0.yyy * unity_World2Shadow[2][1].xyz;
    t2.xyz = unity_World2Shadow[2][0].xyz * t0.xxx + t2.xyz;
    t2.xyz = unity_World2Shadow[2][2].xyz * t0.zzz + t2.xyz;
    t2.xyz = unity_World2Shadow[2][3].xyz * t0.www + t2.xyz;
    t1.xyz = t2.xyz * t10_3.yyy + t1.xyz;
    t2.xyz = t0.yyy * unity_World2Shadow[3][1].xyz;
    t2.xyz = unity_World2Shadow[3][0].xyz * t0.xxx + t2.xyz;
    t2.xyz = unity_World2Shadow[3][2].xyz * t0.zzz + t2.xyz;
    t2.xyz = unity_World2Shadow[3][3].xyz * t0.www + t2.xyz;
    t0.xyz = t0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    t0.x = dot(t0.xyz, t0.xyz);
    t0.x = sqrt(t0.x);
    t0.x = t0.x * _LightShadowData.z + _LightShadowData.w;
    t0.x = clamp(t0.x, 0.0, 1.0);
    t8.xyz = t2.xyz * t10_3.zzz + t1.xyz;
    t8.xy = t8.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
    t1.xy = floor(t8.xy);
    t8.xy = fract(t8.xy);
    t1.xy = t1.xy + vec2(-0.5, -0.5);
    t17.xy = (-t8.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    t2.xy = (-t8.xy) * vec2(3.0, 3.0) + vec2(4.0, 4.0);
    t17.xy = t17.xy / t2.xy;
    t3.xy = t17.xy + vec2(-2.0, -2.0);
    t4.z = t3.y;
    t17.xy = t8.xy * vec2(3.0, 3.0) + vec2(1.0, 1.0);
    t2.xz = t8.xy / t17.xy;
    t4.xw = t2.xz + vec2(2.0, 2.0);
    t3.w = t4.x;
    t2.xz = t8.xy + vec2(3.0, 3.0);
    t8.x = t8.x * 3.0;
    t5.xz = t8.xx * vec2(-1.0, 1.0) + vec2(4.0, 1.0);
    t4.xy = t2.xz * _ShadowMapTexture_TexelSize.xy;
    t6.xz = _ShadowMapTexture_TexelSize.yy;
    t6.y = 0.142857149;
    t6.xyz = vec3(t4.z * t6.x, t4.y * t6.y, t4.w * t6.z);
    t3.z = t4.x;
    t4.w = t6.x;
    t7.xz = _ShadowMapTexture_TexelSize.xx;
    t7.y = 0.142857149;
    t4.xyz = t3.zxw * t7.yxz;
    t3 = t1.xyxy * _ShadowMapTexture_TexelSize.xyxy + t4.ywxw;
    t8.xy = t1.xy * _ShadowMapTexture_TexelSize.xy + t4.zw;
    vec3 txVec0 = vec3(t8.xy,t8.z);
    t10_8 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    vec3 txVec1 = vec3(t3.xy,t8.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    vec3 txVec2 = vec3(t3.zw,t8.z);
    t10_17 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    t5.y = 7.0;
    t2.xyz = t2.yyy * t5.xyz;
    t7.xyz = t17.yyy * t5.xyz;
    t5.xy = t5.xz * vec2(7.0, 7.0);
    t17.x = t10_17 * t2.y;
    t16 = t2.x * t10_16 + t17.x;
    t8.x = t2.z * t10_8 + t16;
    t6.w = t4.y;
    t2 = t1.xyxy * _ShadowMapTexture_TexelSize.xyxy + t6.wywz;
    t4.yw = t6.yz;
    vec3 txVec3 = vec3(t2.xy,t8.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    vec3 txVec4 = vec3(t2.zw,t8.z);
    t10_17 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
    t8.x = t5.x * t10_16 + t8.x;
    t2 = t1.xyxy * _ShadowMapTexture_TexelSize.xyxy + t4.xyzy;
    t3 = t1.xyxy * _ShadowMapTexture_TexelSize.xyxy + t4.xwzw;
    vec3 txVec5 = vec3(t2.xy,t8.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
    vec3 txVec6 = vec3(t2.zw,t8.z);
    t10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
    t8.x = t10_16 * 49.0 + t8.x;
    t8.x = t5.y * t10_1 + t8.x;
    t8.x = t7.x * t10_17 + t8.x;
    vec3 txVec7 = vec3(t3.xy,t8.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
    vec3 txVec8 = vec3(t3.zw,t8.z);
    t10_24 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
    t8.x = t7.y * t10_16 + t8.x;
    t8.x = t7.z * t10_24 + t8.x;
    t8.x = t8.x * 0.0069444445;
    t16_16 = (-_LightShadowData.x) + 1.0;
    t8.x = t8.x * t16_16 + _LightShadowData.x;
    t0 = t0.xxxx + t8.xxxx;
    SV_Target0 = t0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SINGLE_CASCADE" "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowMapTexture_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec3 tmpvar_5;
  tmpvar_5 = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = (unity_World2Shadow[0] * (_CameraToWorld * tmpvar_6)).xyz;
  mediump float shadow_8;
  shadow_8 = 0.0;
  highp vec2 tmpvar_9;
  tmpvar_9 = _ShadowMapTexture_TexelSize.xy;
  highp vec3 tmpvar_10;
  tmpvar_10.xy = (tmpvar_7.xy - _ShadowMapTexture_TexelSize.xy);
  tmpvar_10.z = tmpvar_7.z;
  highp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_ShadowMapTexture, tmpvar_10.xy);
  mediump float tmpvar_12;
  if ((tmpvar_11.x < tmpvar_7.z)) {
    tmpvar_12 = 0.0;
  } else {
    tmpvar_12 = 1.0;
  };
  shadow_8 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13.x = 0.0;
  tmpvar_13.y = -(_ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_14;
  tmpvar_14.xy = (tmpvar_7.xy + tmpvar_13);
  tmpvar_14.z = tmpvar_7.z;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_ShadowMapTexture, tmpvar_14.xy);
  highp float tmpvar_16;
  if ((tmpvar_15.x < tmpvar_7.z)) {
    tmpvar_16 = 0.0;
  } else {
    tmpvar_16 = 1.0;
  };
  shadow_8 = (tmpvar_12 + tmpvar_16);
  highp vec2 tmpvar_17;
  tmpvar_17.x = tmpvar_9.x;
  tmpvar_17.y = -(_ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_18;
  tmpvar_18.xy = (tmpvar_7.xy + tmpvar_17);
  tmpvar_18.z = tmpvar_7.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_ShadowMapTexture, tmpvar_18.xy);
  highp float tmpvar_20;
  if ((tmpvar_19.x < tmpvar_7.z)) {
    tmpvar_20 = 0.0;
  } else {
    tmpvar_20 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_20);
  highp vec2 tmpvar_21;
  tmpvar_21.y = 0.0;
  tmpvar_21.x = -(_ShadowMapTexture_TexelSize.x);
  highp vec3 tmpvar_22;
  tmpvar_22.xy = (tmpvar_7.xy + tmpvar_21);
  tmpvar_22.z = tmpvar_7.z;
  highp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_ShadowMapTexture, tmpvar_22.xy);
  highp float tmpvar_24;
  if ((tmpvar_23.x < tmpvar_7.z)) {
    tmpvar_24 = 0.0;
  } else {
    tmpvar_24 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_24);
  highp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_ShadowMapTexture, tmpvar_7.xy);
  highp float tmpvar_26;
  if ((tmpvar_25.x < tmpvar_7.z)) {
    tmpvar_26 = 0.0;
  } else {
    tmpvar_26 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_26);
  highp vec2 tmpvar_27;
  tmpvar_27.y = 0.0;
  tmpvar_27.x = tmpvar_9.x;
  highp vec3 tmpvar_28;
  tmpvar_28.xy = (tmpvar_7.xy + tmpvar_27);
  tmpvar_28.z = tmpvar_7.z;
  highp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_ShadowMapTexture, tmpvar_28.xy);
  highp float tmpvar_30;
  if ((tmpvar_29.x < tmpvar_7.z)) {
    tmpvar_30 = 0.0;
  } else {
    tmpvar_30 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_30);
  highp vec2 tmpvar_31;
  tmpvar_31.x = -(_ShadowMapTexture_TexelSize.x);
  tmpvar_31.y = tmpvar_9.y;
  highp vec3 tmpvar_32;
  tmpvar_32.xy = (tmpvar_7.xy + tmpvar_31);
  tmpvar_32.z = tmpvar_7.z;
  highp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_ShadowMapTexture, tmpvar_32.xy);
  highp float tmpvar_34;
  if ((tmpvar_33.x < tmpvar_7.z)) {
    tmpvar_34 = 0.0;
  } else {
    tmpvar_34 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = 0.0;
  tmpvar_35.y = tmpvar_9.y;
  highp vec3 tmpvar_36;
  tmpvar_36.xy = (tmpvar_7.xy + tmpvar_35);
  tmpvar_36.z = tmpvar_7.z;
  highp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_ShadowMapTexture, tmpvar_36.xy);
  highp float tmpvar_38;
  if ((tmpvar_37.x < tmpvar_7.z)) {
    tmpvar_38 = 0.0;
  } else {
    tmpvar_38 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_38);
  highp vec3 tmpvar_39;
  tmpvar_39.xy = (tmpvar_7.xy + _ShadowMapTexture_TexelSize.xy);
  tmpvar_39.z = tmpvar_7.z;
  highp vec4 tmpvar_40;
  tmpvar_40 = texture2D (_ShadowMapTexture, tmpvar_39.xy);
  highp float tmpvar_41;
  if ((tmpvar_40.x < tmpvar_7.z)) {
    tmpvar_41 = 0.0;
  } else {
    tmpvar_41 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_41);
  shadow_8 = (shadow_8 / 9.0);
  mediump float tmpvar_42;
  tmpvar_42 = mix (_LightShadowData.x, 1.0, shadow_8);
  shadow_8 = tmpvar_42;
  highp float tmpvar_43;
  tmpvar_43 = clamp (((tmpvar_5.z * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  shadow_2 = (tmpvar_42 + tmpvar_43);
  mediump vec4 tmpvar_44;
  tmpvar_44 = vec4(shadow_2);
  tmpvar_1 = tmpvar_44;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _ShadowMapTexture_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec3 tmpvar_5;
  tmpvar_5 = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_5;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = (unity_World2Shadow[0] * (_CameraToWorld * tmpvar_6)).xyz;
  mediump vec3 accum_8;
  mediump float sum_9;
  mediump float shadow_10;
  highp vec3 v_11;
  highp vec3 u_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((tmpvar_7.xy * _ShadowMapTexture_TexelSize.zw) + vec2(0.5, 0.5));
  highp vec2 tmpvar_14;
  tmpvar_14 = ((floor(tmpvar_13) - vec2(0.5, 0.5)) * _ShadowMapTexture_TexelSize.xy);
  highp vec2 tmpvar_15;
  tmpvar_15 = fract(tmpvar_13);
  highp vec3 tmpvar_16;
  tmpvar_16.y = 7.0;
  tmpvar_16.x = (4.0 - (3.0 * tmpvar_15.x));
  tmpvar_16.z = (1.0 + (3.0 * tmpvar_15.x));
  highp vec3 tmpvar_17;
  tmpvar_17.x = (((3.0 - 
    (2.0 * tmpvar_15.x)
  ) / tmpvar_16.x) - 2.0);
  tmpvar_17.y = ((3.0 + tmpvar_15.x) / 7.0);
  tmpvar_17.z = ((tmpvar_15.x / tmpvar_16.z) + 2.0);
  u_12 = (tmpvar_17 * _ShadowMapTexture_TexelSize.x);
  highp vec3 tmpvar_18;
  tmpvar_18.y = 7.0;
  tmpvar_18.x = (4.0 - (3.0 * tmpvar_15.y));
  tmpvar_18.z = (1.0 + (3.0 * tmpvar_15.y));
  highp vec3 tmpvar_19;
  tmpvar_19.x = (((3.0 - 
    (2.0 * tmpvar_15.y)
  ) / tmpvar_18.x) - 2.0);
  tmpvar_19.y = ((3.0 + tmpvar_15.y) / 7.0);
  tmpvar_19.z = ((tmpvar_15.y / tmpvar_18.z) + 2.0);
  v_11 = (tmpvar_19 * _ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_16 * tmpvar_18.x);
  accum_8 = tmpvar_20;
  highp vec2 tmpvar_21;
  tmpvar_21.x = u_12.x;
  tmpvar_21.y = v_11.x;
  highp float depth_22;
  depth_22 = tmpvar_7.z;
  highp vec3 uv_23;
  highp vec3 tmpvar_24;
  tmpvar_24.xy = (tmpvar_14 + tmpvar_21);
  tmpvar_24.z = depth_22;
  uv_23.xy = tmpvar_24.xy;
  uv_23.z = depth_22;
  lowp float tmpvar_25;
  tmpvar_25 = shadow2DEXT (_ShadowMapTexture, uv_23);
  sum_9 = (accum_8.x * tmpvar_25);
  highp vec2 tmpvar_26;
  tmpvar_26.x = u_12.y;
  tmpvar_26.y = v_11.x;
  highp float depth_27;
  depth_27 = tmpvar_7.z;
  highp vec3 uv_28;
  highp vec3 tmpvar_29;
  tmpvar_29.xy = (tmpvar_14 + tmpvar_26);
  tmpvar_29.z = depth_27;
  uv_28.xy = tmpvar_29.xy;
  uv_28.z = depth_27;
  lowp float tmpvar_30;
  tmpvar_30 = shadow2DEXT (_ShadowMapTexture, uv_28);
  sum_9 = (sum_9 + (accum_8.y * tmpvar_30));
  highp vec2 tmpvar_31;
  tmpvar_31.x = u_12.z;
  tmpvar_31.y = v_11.x;
  highp float depth_32;
  depth_32 = tmpvar_7.z;
  highp vec3 uv_33;
  highp vec3 tmpvar_34;
  tmpvar_34.xy = (tmpvar_14 + tmpvar_31);
  tmpvar_34.z = depth_32;
  uv_33.xy = tmpvar_34.xy;
  uv_33.z = depth_32;
  lowp float tmpvar_35;
  tmpvar_35 = shadow2DEXT (_ShadowMapTexture, uv_33);
  sum_9 = (sum_9 + (accum_8.z * tmpvar_35));
  accum_8 = (tmpvar_16 * 7.0);
  highp vec2 tmpvar_36;
  tmpvar_36.x = u_12.x;
  tmpvar_36.y = v_11.y;
  highp float depth_37;
  depth_37 = tmpvar_7.z;
  highp vec3 uv_38;
  highp vec3 tmpvar_39;
  tmpvar_39.xy = (tmpvar_14 + tmpvar_36);
  tmpvar_39.z = depth_37;
  uv_38.xy = tmpvar_39.xy;
  uv_38.z = depth_37;
  lowp float tmpvar_40;
  tmpvar_40 = shadow2DEXT (_ShadowMapTexture, uv_38);
  sum_9 = (sum_9 + (accum_8.x * tmpvar_40));
  highp vec2 tmpvar_41;
  tmpvar_41.x = u_12.y;
  tmpvar_41.y = v_11.y;
  highp float depth_42;
  depth_42 = tmpvar_7.z;
  highp vec3 uv_43;
  highp vec3 tmpvar_44;
  tmpvar_44.xy = (tmpvar_14 + tmpvar_41);
  tmpvar_44.z = depth_42;
  uv_43.xy = tmpvar_44.xy;
  uv_43.z = depth_42;
  lowp float tmpvar_45;
  tmpvar_45 = shadow2DEXT (_ShadowMapTexture, uv_43);
  sum_9 = (sum_9 + (accum_8.y * tmpvar_45));
  highp vec2 tmpvar_46;
  tmpvar_46.x = u_12.z;
  tmpvar_46.y = v_11.y;
  highp float depth_47;
  depth_47 = tmpvar_7.z;
  highp vec3 uv_48;
  highp vec3 tmpvar_49;
  tmpvar_49.xy = (tmpvar_14 + tmpvar_46);
  tmpvar_49.z = depth_47;
  uv_48.xy = tmpvar_49.xy;
  uv_48.z = depth_47;
  lowp float tmpvar_50;
  tmpvar_50 = shadow2DEXT (_ShadowMapTexture, uv_48);
  sum_9 = (sum_9 + (accum_8.z * tmpvar_50));
  accum_8 = (tmpvar_16 * tmpvar_18.z);
  highp vec2 tmpvar_51;
  tmpvar_51.x = u_12.x;
  tmpvar_51.y = v_11.z;
  highp float depth_52;
  depth_52 = tmpvar_7.z;
  highp vec3 uv_53;
  highp vec3 tmpvar_54;
  tmpvar_54.xy = (tmpvar_14 + tmpvar_51);
  tmpvar_54.z = depth_52;
  uv_53.xy = tmpvar_54.xy;
  uv_53.z = depth_52;
  lowp float tmpvar_55;
  tmpvar_55 = shadow2DEXT (_ShadowMapTexture, uv_53);
  sum_9 = (sum_9 + (accum_8.x * tmpvar_55));
  highp vec2 tmpvar_56;
  tmpvar_56.x = u_12.y;
  tmpvar_56.y = v_11.z;
  highp float depth_57;
  depth_57 = tmpvar_7.z;
  highp vec3 uv_58;
  highp vec3 tmpvar_59;
  tmpvar_59.xy = (tmpvar_14 + tmpvar_56);
  tmpvar_59.z = depth_57;
  uv_58.xy = tmpvar_59.xy;
  uv_58.z = depth_57;
  lowp float tmpvar_60;
  tmpvar_60 = shadow2DEXT (_ShadowMapTexture, uv_58);
  sum_9 = (sum_9 + (accum_8.y * tmpvar_60));
  highp vec2 tmpvar_61;
  tmpvar_61.x = u_12.z;
  tmpvar_61.y = v_11.z;
  highp float depth_62;
  depth_62 = tmpvar_7.z;
  highp vec3 uv_63;
  highp vec3 tmpvar_64;
  tmpvar_64.xy = (tmpvar_14 + tmpvar_61);
  tmpvar_64.z = depth_62;
  uv_63.xy = tmpvar_64.xy;
  uv_63.z = depth_62;
  lowp float tmpvar_65;
  tmpvar_65 = shadow2DEXT (_ShadowMapTexture, uv_63);
  sum_9 = (sum_9 + (accum_8.z * tmpvar_65));
  shadow_10 = (sum_9 / 144.0);
  mediump float tmpvar_66;
  tmpvar_66 = mix (_LightShadowData.x, 1.0, shadow_10);
  shadow_10 = tmpvar_66;
  highp float tmpvar_67;
  tmpvar_67 = clamp (((tmpvar_5.z * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  shadow_2 = (tmpvar_66 + tmpvar_67);
  mediump vec4 tmpvar_68;
  tmpvar_68 = vec4(shadow_2);
  tmpvar_1 = tmpvar_68;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES3
#ifdef VERTEX
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
highp vec4 t0;
highp vec3 t1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    t0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    t1.x = t0.y * _ProjectionParams.x;
    t1.xyz = t1.xxx * unity_CameraInvProjection[1].xyz;
    t1.xyz = unity_CameraInvProjection[0].xyz * t0.xxx + t1.xyz;
    gl_Position = t0;
    t0.x = t1.z + unity_CameraInvProjection[2].z;
    t0.yzw = t1.xyz + (-unity_CameraInvProjection[2].xyz);
    t0 = t0 + unity_CameraInvProjection[3].zxyz;
    vs_TEXCOORD2.xyz = vec3(t0.y * float(1.0), t0.z * float(1.0), t0.w * float(-1.0));
    vs_TEXCOORD2.w = (-t0.x);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
lowp float t10_1;
highp vec3 t2;
lowp float t10_2;
highp vec4 t3;
highp vec4 t4;
highp vec4 t5;
highp vec3 t6;
highp vec3 t7;
lowp float t10_7;
lowp float t10_8;
highp vec2 t9;
lowp float t10_9;
highp float t14;
mediump float t16_14;
lowp float t10_14;
lowp float t10_15;
highp vec2 t16;
lowp float t10_21;
highp float t22;
void main()
{
    t0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    t7.x = _ZBufferParams.x * t0.x + _ZBufferParams.y;
    t7.x = float(1.0) / t7.x;
    t14 = (-t7.x) + t0.x;
    t7.x = unity_OrthoParams.w * t14 + t7.x;
    t1.xy = vs_TEXCOORD2.xy;
    t14 = (-vs_TEXCOORD2.z) + vs_TEXCOORD2.w;
    t1.z = t0.x * t14 + vs_TEXCOORD2.z;
    t0.xzw = (-vs_TEXCOORD1.xyz) * t7.xxx + t1.xyz;
    t1.xyz = t7.xxx * vs_TEXCOORD1.xyz;
    t0.xyz = unity_OrthoParams.www * t0.xzw + t1.xyz;
    t1 = t0.yyyy * _CameraToWorld[1];
    t1 = _CameraToWorld[0] * t0.xxxx + t1;
    t1 = _CameraToWorld[2] * t0.zzzz + t1;
    t0.x = t0.z * _LightShadowData.z + _LightShadowData.w;
    t0.x = clamp(t0.x, 0.0, 1.0);
    t1 = t1 + _CameraToWorld[3];
    t7.xyz = t1.yyy * unity_World2Shadow[0][1].xyz;
    t7.xyz = unity_World2Shadow[0][0].xyz * t1.xxx + t7.xyz;
    t7.xyz = unity_World2Shadow[0][2].xyz * t1.zzz + t7.xyz;
    t7.xyz = unity_World2Shadow[0][3].xyz * t1.www + t7.xyz;
    t1.xz = _ShadowMapTexture_TexelSize.yy;
    t1.y = 0.142857149;
    t7.xy = t7.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
    t2.xy = fract(t7.xy);
    t7.xy = floor(t7.xy);
    t7.xy = t7.xy + vec2(-0.5, -0.5);
    t16.xy = (-t2.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    t3.xy = (-t2.xy) * vec2(3.0, 3.0) + vec2(4.0, 4.0);
    t16.xy = t16.xy / t3.xy;
    t4.xy = t16.xy + vec2(-2.0, -2.0);
    t5.z = t4.y;
    t16.xy = t2.xy * vec2(3.0, 3.0) + vec2(1.0, 1.0);
    t3.xz = t2.xy / t16.xy;
    t5.xw = t3.xz + vec2(2.0, 2.0);
    t4.w = t5.x;
    t9.xy = t2.xy + vec2(3.0, 3.0);
    t22 = t2.x * 3.0;
    t6.xz = vec2(t22) * vec2(-1.0, 1.0) + vec2(4.0, 1.0);
    t5.xy = t9.xy * _ShadowMapTexture_TexelSize.xy;
    t1.xyz = vec3(t1.x * t5.z, t1.y * t5.y, t1.z * t5.w);
    t4.z = t5.x;
    t5.w = t1.x;
    t2.xz = _ShadowMapTexture_TexelSize.xx;
    t2.y = 0.142857149;
    t5.xyz = t2.yxz * t4.zxw;
    t4 = t7.xyxy * _ShadowMapTexture_TexelSize.xyxy + t5.ywxw;
    t2.xy = t7.xy * _ShadowMapTexture_TexelSize.xy + t5.zw;
    vec3 txVec10 = vec3(t2.xy,t7.z);
    t10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
    vec3 txVec11 = vec3(t4.xy,t7.z);
    t10_2 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
    vec3 txVec12 = vec3(t4.zw,t7.z);
    t10_9 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
    t6.y = 7.0;
    t3.xyz = t3.yyy * t6.xyz;
    t4.xyz = t16.yyy * t6.xyz;
    t16.xy = t6.xz * vec2(7.0, 7.0);
    t9.x = t10_9 * t3.y;
    t2.x = t3.x * t10_2 + t9.x;
    t1.x = t3.z * t10_1 + t2.x;
    t1.w = t5.y;
    t3 = t7.xyxy * _ShadowMapTexture_TexelSize.xyxy + t1.wywz;
    t5.yw = t1.yz;
    vec3 txVec13 = vec3(t3.xy,t7.z);
    t10_8 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
    vec3 txVec14 = vec3(t3.zw,t7.z);
    t10_15 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
    t1.x = t16.x * t10_8 + t1.x;
    t3 = t7.xyxy * _ShadowMapTexture_TexelSize.xyxy + t5.xyzy;
    t5 = t7.xyxy * _ShadowMapTexture_TexelSize.xyxy + t5.xwzw;
    vec3 txVec15 = vec3(t3.xy,t7.z);
    t10_7 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
    vec3 txVec16 = vec3(t3.zw,t7.z);
    t10_14 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
    t7.x = t10_7 * 49.0 + t1.x;
    t7.x = t16.y * t10_14 + t7.x;
    t7.x = t4.x * t10_15 + t7.x;
    vec3 txVec17 = vec3(t5.xy,t7.z);
    t10_14 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
    vec3 txVec18 = vec3(t5.zw,t7.z);
    t10_21 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
    t7.x = t4.y * t10_14 + t7.x;
    t7.x = t4.z * t10_21 + t7.x;
    t7.x = t7.x * 0.0069444445;
    t16_14 = (-_LightShadowData.x) + 1.0;
    t7.x = t7.x * t16_14 + _LightShadowData.x;
    t0 = t0.xxxx + t7.xxxx;
    SV_Target0 = t0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" "SHADOWS_NONATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowMapTexture_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_CameraToWorld * tmpvar_5);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = (unity_World2Shadow[0] * tmpvar_6).xyz;
  mediump float shadow_8;
  shadow_8 = 0.0;
  highp vec2 tmpvar_9;
  tmpvar_9 = _ShadowMapTexture_TexelSize.xy;
  highp vec3 tmpvar_10;
  tmpvar_10.xy = (tmpvar_7.xy - _ShadowMapTexture_TexelSize.xy);
  tmpvar_10.z = tmpvar_7.z;
  highp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_ShadowMapTexture, tmpvar_10.xy);
  mediump float tmpvar_12;
  if ((tmpvar_11.x < tmpvar_7.z)) {
    tmpvar_12 = 0.0;
  } else {
    tmpvar_12 = 1.0;
  };
  shadow_8 = tmpvar_12;
  highp vec2 tmpvar_13;
  tmpvar_13.x = 0.0;
  tmpvar_13.y = -(_ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_14;
  tmpvar_14.xy = (tmpvar_7.xy + tmpvar_13);
  tmpvar_14.z = tmpvar_7.z;
  highp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_ShadowMapTexture, tmpvar_14.xy);
  highp float tmpvar_16;
  if ((tmpvar_15.x < tmpvar_7.z)) {
    tmpvar_16 = 0.0;
  } else {
    tmpvar_16 = 1.0;
  };
  shadow_8 = (tmpvar_12 + tmpvar_16);
  highp vec2 tmpvar_17;
  tmpvar_17.x = tmpvar_9.x;
  tmpvar_17.y = -(_ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_18;
  tmpvar_18.xy = (tmpvar_7.xy + tmpvar_17);
  tmpvar_18.z = tmpvar_7.z;
  highp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_ShadowMapTexture, tmpvar_18.xy);
  highp float tmpvar_20;
  if ((tmpvar_19.x < tmpvar_7.z)) {
    tmpvar_20 = 0.0;
  } else {
    tmpvar_20 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_20);
  highp vec2 tmpvar_21;
  tmpvar_21.y = 0.0;
  tmpvar_21.x = -(_ShadowMapTexture_TexelSize.x);
  highp vec3 tmpvar_22;
  tmpvar_22.xy = (tmpvar_7.xy + tmpvar_21);
  tmpvar_22.z = tmpvar_7.z;
  highp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_ShadowMapTexture, tmpvar_22.xy);
  highp float tmpvar_24;
  if ((tmpvar_23.x < tmpvar_7.z)) {
    tmpvar_24 = 0.0;
  } else {
    tmpvar_24 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_24);
  highp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_ShadowMapTexture, tmpvar_7.xy);
  highp float tmpvar_26;
  if ((tmpvar_25.x < tmpvar_7.z)) {
    tmpvar_26 = 0.0;
  } else {
    tmpvar_26 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_26);
  highp vec2 tmpvar_27;
  tmpvar_27.y = 0.0;
  tmpvar_27.x = tmpvar_9.x;
  highp vec3 tmpvar_28;
  tmpvar_28.xy = (tmpvar_7.xy + tmpvar_27);
  tmpvar_28.z = tmpvar_7.z;
  highp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_ShadowMapTexture, tmpvar_28.xy);
  highp float tmpvar_30;
  if ((tmpvar_29.x < tmpvar_7.z)) {
    tmpvar_30 = 0.0;
  } else {
    tmpvar_30 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_30);
  highp vec2 tmpvar_31;
  tmpvar_31.x = -(_ShadowMapTexture_TexelSize.x);
  tmpvar_31.y = tmpvar_9.y;
  highp vec3 tmpvar_32;
  tmpvar_32.xy = (tmpvar_7.xy + tmpvar_31);
  tmpvar_32.z = tmpvar_7.z;
  highp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_ShadowMapTexture, tmpvar_32.xy);
  highp float tmpvar_34;
  if ((tmpvar_33.x < tmpvar_7.z)) {
    tmpvar_34 = 0.0;
  } else {
    tmpvar_34 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = 0.0;
  tmpvar_35.y = tmpvar_9.y;
  highp vec3 tmpvar_36;
  tmpvar_36.xy = (tmpvar_7.xy + tmpvar_35);
  tmpvar_36.z = tmpvar_7.z;
  highp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_ShadowMapTexture, tmpvar_36.xy);
  highp float tmpvar_38;
  if ((tmpvar_37.x < tmpvar_7.z)) {
    tmpvar_38 = 0.0;
  } else {
    tmpvar_38 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_38);
  highp vec3 tmpvar_39;
  tmpvar_39.xy = (tmpvar_7.xy + _ShadowMapTexture_TexelSize.xy);
  tmpvar_39.z = tmpvar_7.z;
  highp vec4 tmpvar_40;
  tmpvar_40 = texture2D (_ShadowMapTexture, tmpvar_39.xy);
  highp float tmpvar_41;
  if ((tmpvar_40.x < tmpvar_7.z)) {
    tmpvar_41 = 0.0;
  } else {
    tmpvar_41 = 1.0;
  };
  shadow_8 = (shadow_8 + tmpvar_41);
  shadow_8 = (shadow_8 / 9.0);
  mediump float tmpvar_42;
  tmpvar_42 = mix (_LightShadowData.x, 1.0, shadow_8);
  shadow_8 = tmpvar_42;
  highp float tmpvar_43;
  highp vec3 tmpvar_44;
  tmpvar_44 = (tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_45;
  highp float tmpvar_46;
  tmpvar_46 = clamp (((
    sqrt(dot (tmpvar_44, tmpvar_44))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_45 = tmpvar_46;
  tmpvar_43 = tmpvar_45;
  shadow_2 = (tmpvar_42 + tmpvar_43);
  mediump vec4 tmpvar_47;
  tmpvar_47 = vec4(shadow_2);
  tmpvar_1 = tmpvar_47;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_CameraInvProjection;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 clipPos_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = (glstate_matrix_mvp * _glesVertex);
  clipPos_1.xzw = tmpvar_2.xzw;
  clipPos_1.y = (tmpvar_2.y * _ProjectionParams.x);
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(-1.0, 1.0);
  tmpvar_3.xy = clipPos_1.xy;
  highp vec4 tmpvar_4;
  tmpvar_4 = (unity_CameraInvProjection * tmpvar_3);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(1.0, 1.0);
  tmpvar_5.xy = clipPos_1.xy;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = tmpvar_4.xy;
  tmpvar_6.z = -(tmpvar_4.z);
  tmpvar_6.w = -((unity_CameraInvProjection * tmpvar_5).z);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = _glesNormal;
  xlv_TEXCOORD2 = tmpvar_6;
  gl_Position = tmpvar_2;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _ZBufferParams;
uniform highp vec4 unity_OrthoParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp mat4 _CameraToWorld;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _ShadowMapTexture_TexelSize;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump float shadow_2;
  highp vec3 vposOrtho_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_CameraDepthTexture, xlv_TEXCOORD0);
  vposOrtho_3.xy = xlv_TEXCOORD2.xy;
  vposOrtho_3.z = mix (xlv_TEXCOORD2.z, xlv_TEXCOORD2.w, tmpvar_4.x);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = mix ((xlv_TEXCOORD1 * mix (
    (1.0/(((_ZBufferParams.x * tmpvar_4.x) + _ZBufferParams.y)))
  , tmpvar_4.x, unity_OrthoParams.w)), vposOrtho_3, unity_OrthoParams.www);
  highp vec4 tmpvar_6;
  tmpvar_6 = (_CameraToWorld * tmpvar_5);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = (unity_World2Shadow[0] * tmpvar_6).xyz;
  mediump vec3 accum_8;
  mediump float sum_9;
  mediump float shadow_10;
  highp vec3 v_11;
  highp vec3 u_12;
  highp vec2 tmpvar_13;
  tmpvar_13 = ((tmpvar_7.xy * _ShadowMapTexture_TexelSize.zw) + vec2(0.5, 0.5));
  highp vec2 tmpvar_14;
  tmpvar_14 = ((floor(tmpvar_13) - vec2(0.5, 0.5)) * _ShadowMapTexture_TexelSize.xy);
  highp vec2 tmpvar_15;
  tmpvar_15 = fract(tmpvar_13);
  highp vec3 tmpvar_16;
  tmpvar_16.y = 7.0;
  tmpvar_16.x = (4.0 - (3.0 * tmpvar_15.x));
  tmpvar_16.z = (1.0 + (3.0 * tmpvar_15.x));
  highp vec3 tmpvar_17;
  tmpvar_17.x = (((3.0 - 
    (2.0 * tmpvar_15.x)
  ) / tmpvar_16.x) - 2.0);
  tmpvar_17.y = ((3.0 + tmpvar_15.x) / 7.0);
  tmpvar_17.z = ((tmpvar_15.x / tmpvar_16.z) + 2.0);
  u_12 = (tmpvar_17 * _ShadowMapTexture_TexelSize.x);
  highp vec3 tmpvar_18;
  tmpvar_18.y = 7.0;
  tmpvar_18.x = (4.0 - (3.0 * tmpvar_15.y));
  tmpvar_18.z = (1.0 + (3.0 * tmpvar_15.y));
  highp vec3 tmpvar_19;
  tmpvar_19.x = (((3.0 - 
    (2.0 * tmpvar_15.y)
  ) / tmpvar_18.x) - 2.0);
  tmpvar_19.y = ((3.0 + tmpvar_15.y) / 7.0);
  tmpvar_19.z = ((tmpvar_15.y / tmpvar_18.z) + 2.0);
  v_11 = (tmpvar_19 * _ShadowMapTexture_TexelSize.y);
  highp vec3 tmpvar_20;
  tmpvar_20 = (tmpvar_16 * tmpvar_18.x);
  accum_8 = tmpvar_20;
  highp vec2 tmpvar_21;
  tmpvar_21.x = u_12.x;
  tmpvar_21.y = v_11.x;
  highp float depth_22;
  depth_22 = tmpvar_7.z;
  highp vec3 uv_23;
  highp vec3 tmpvar_24;
  tmpvar_24.xy = (tmpvar_14 + tmpvar_21);
  tmpvar_24.z = depth_22;
  uv_23.xy = tmpvar_24.xy;
  uv_23.z = depth_22;
  lowp float tmpvar_25;
  tmpvar_25 = shadow2DEXT (_ShadowMapTexture, uv_23);
  sum_9 = (accum_8.x * tmpvar_25);
  highp vec2 tmpvar_26;
  tmpvar_26.x = u_12.y;
  tmpvar_26.y = v_11.x;
  highp float depth_27;
  depth_27 = tmpvar_7.z;
  highp vec3 uv_28;
  highp vec3 tmpvar_29;
  tmpvar_29.xy = (tmpvar_14 + tmpvar_26);
  tmpvar_29.z = depth_27;
  uv_28.xy = tmpvar_29.xy;
  uv_28.z = depth_27;
  lowp float tmpvar_30;
  tmpvar_30 = shadow2DEXT (_ShadowMapTexture, uv_28);
  sum_9 = (sum_9 + (accum_8.y * tmpvar_30));
  highp vec2 tmpvar_31;
  tmpvar_31.x = u_12.z;
  tmpvar_31.y = v_11.x;
  highp float depth_32;
  depth_32 = tmpvar_7.z;
  highp vec3 uv_33;
  highp vec3 tmpvar_34;
  tmpvar_34.xy = (tmpvar_14 + tmpvar_31);
  tmpvar_34.z = depth_32;
  uv_33.xy = tmpvar_34.xy;
  uv_33.z = depth_32;
  lowp float tmpvar_35;
  tmpvar_35 = shadow2DEXT (_ShadowMapTexture, uv_33);
  sum_9 = (sum_9 + (accum_8.z * tmpvar_35));
  accum_8 = (tmpvar_16 * 7.0);
  highp vec2 tmpvar_36;
  tmpvar_36.x = u_12.x;
  tmpvar_36.y = v_11.y;
  highp float depth_37;
  depth_37 = tmpvar_7.z;
  highp vec3 uv_38;
  highp vec3 tmpvar_39;
  tmpvar_39.xy = (tmpvar_14 + tmpvar_36);
  tmpvar_39.z = depth_37;
  uv_38.xy = tmpvar_39.xy;
  uv_38.z = depth_37;
  lowp float tmpvar_40;
  tmpvar_40 = shadow2DEXT (_ShadowMapTexture, uv_38);
  sum_9 = (sum_9 + (accum_8.x * tmpvar_40));
  highp vec2 tmpvar_41;
  tmpvar_41.x = u_12.y;
  tmpvar_41.y = v_11.y;
  highp float depth_42;
  depth_42 = tmpvar_7.z;
  highp vec3 uv_43;
  highp vec3 tmpvar_44;
  tmpvar_44.xy = (tmpvar_14 + tmpvar_41);
  tmpvar_44.z = depth_42;
  uv_43.xy = tmpvar_44.xy;
  uv_43.z = depth_42;
  lowp float tmpvar_45;
  tmpvar_45 = shadow2DEXT (_ShadowMapTexture, uv_43);
  sum_9 = (sum_9 + (accum_8.y * tmpvar_45));
  highp vec2 tmpvar_46;
  tmpvar_46.x = u_12.z;
  tmpvar_46.y = v_11.y;
  highp float depth_47;
  depth_47 = tmpvar_7.z;
  highp vec3 uv_48;
  highp vec3 tmpvar_49;
  tmpvar_49.xy = (tmpvar_14 + tmpvar_46);
  tmpvar_49.z = depth_47;
  uv_48.xy = tmpvar_49.xy;
  uv_48.z = depth_47;
  lowp float tmpvar_50;
  tmpvar_50 = shadow2DEXT (_ShadowMapTexture, uv_48);
  sum_9 = (sum_9 + (accum_8.z * tmpvar_50));
  accum_8 = (tmpvar_16 * tmpvar_18.z);
  highp vec2 tmpvar_51;
  tmpvar_51.x = u_12.x;
  tmpvar_51.y = v_11.z;
  highp float depth_52;
  depth_52 = tmpvar_7.z;
  highp vec3 uv_53;
  highp vec3 tmpvar_54;
  tmpvar_54.xy = (tmpvar_14 + tmpvar_51);
  tmpvar_54.z = depth_52;
  uv_53.xy = tmpvar_54.xy;
  uv_53.z = depth_52;
  lowp float tmpvar_55;
  tmpvar_55 = shadow2DEXT (_ShadowMapTexture, uv_53);
  sum_9 = (sum_9 + (accum_8.x * tmpvar_55));
  highp vec2 tmpvar_56;
  tmpvar_56.x = u_12.y;
  tmpvar_56.y = v_11.z;
  highp float depth_57;
  depth_57 = tmpvar_7.z;
  highp vec3 uv_58;
  highp vec3 tmpvar_59;
  tmpvar_59.xy = (tmpvar_14 + tmpvar_56);
  tmpvar_59.z = depth_57;
  uv_58.xy = tmpvar_59.xy;
  uv_58.z = depth_57;
  lowp float tmpvar_60;
  tmpvar_60 = shadow2DEXT (_ShadowMapTexture, uv_58);
  sum_9 = (sum_9 + (accum_8.y * tmpvar_60));
  highp vec2 tmpvar_61;
  tmpvar_61.x = u_12.z;
  tmpvar_61.y = v_11.z;
  highp float depth_62;
  depth_62 = tmpvar_7.z;
  highp vec3 uv_63;
  highp vec3 tmpvar_64;
  tmpvar_64.xy = (tmpvar_14 + tmpvar_61);
  tmpvar_64.z = depth_62;
  uv_63.xy = tmpvar_64.xy;
  uv_63.z = depth_62;
  lowp float tmpvar_65;
  tmpvar_65 = shadow2DEXT (_ShadowMapTexture, uv_63);
  sum_9 = (sum_9 + (accum_8.z * tmpvar_65));
  shadow_10 = (sum_9 / 144.0);
  mediump float tmpvar_66;
  tmpvar_66 = mix (_LightShadowData.x, 1.0, shadow_10);
  shadow_10 = tmpvar_66;
  highp float tmpvar_67;
  highp vec3 tmpvar_68;
  tmpvar_68 = (tmpvar_6.xyz - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_69;
  highp float tmpvar_70;
  tmpvar_70 = clamp (((
    sqrt(dot (tmpvar_68, tmpvar_68))
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_69 = tmpvar_70;
  tmpvar_67 = tmpvar_69;
  shadow_2 = (tmpvar_66 + tmpvar_67);
  mediump vec4 tmpvar_71;
  tmpvar_71 = vec4(shadow_2);
  tmpvar_1 = tmpvar_71;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES3
#ifdef VERTEX
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
highp vec4 t0;
highp vec3 t1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    t0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    t1.x = t0.y * _ProjectionParams.x;
    t1.xyz = t1.xxx * unity_CameraInvProjection[1].xyz;
    t1.xyz = unity_CameraInvProjection[0].xyz * t0.xxx + t1.xyz;
    gl_Position = t0;
    t0.x = t1.z + unity_CameraInvProjection[2].z;
    t0.yzw = t1.xyz + (-unity_CameraInvProjection[2].xyz);
    t0 = t0 + unity_CameraInvProjection[3].zxyz;
    vs_TEXCOORD2.xyz = vec3(t0.y * float(1.0), t0.z * float(1.0), t0.w * float(-1.0));
    vs_TEXCOORD2.w = (-t0.x);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
precision highp float;
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec4 unity_DeltaTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 unity_CameraWorldClipPlanes[6];
uniform 	mat4 unity_CameraProjection;
uniform 	mat4 unity_CameraInvProjection;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec3 unity_LightColor0;
uniform 	mediump vec3 unity_LightColor1;
uniform 	mediump vec3 unity_LightColor2;
uniform 	mediump vec3 unity_LightColor3;
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	mat4 unity_World2Shadow[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	mat4 glstate_matrix_mvp;
uniform 	mat4 glstate_matrix_modelview0;
uniform 	mat4 glstate_matrix_invtrans_modelview0;
uniform 	mat4 _Object2World;
uniform 	mat4 _World2Object;
uniform 	vec4 unity_LODFade;
uniform 	vec4 unity_WorldTransformParams;
uniform 	mat4 glstate_matrix_transpose_modelview0;
uniform 	mat4 glstate_matrix_projection;
uniform 	lowp vec4 glstate_lightmodel_ambient;
uniform 	mat4 unity_MatrixV;
uniform 	mat4 unity_MatrixVP;
uniform 	lowp vec4 unity_AmbientSky;
uniform 	lowp vec4 unity_AmbientEquator;
uniform 	lowp vec4 unity_AmbientGround;
uniform 	lowp vec4 unity_FogColor;
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	lowp vec4 unity_ColorSpaceGrey;
uniform 	lowp vec4 unity_ColorSpaceDouble;
uniform 	mediump vec4 unity_ColorSpaceDielectricSpec;
uniform 	mediump vec4 unity_ColorSpaceLuminance;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 unity_DynamicLightmap_HDR;
uniform 	vec4 unity_ShadowCascadeScales;
uniform 	mat4 _CameraToWorld;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
lowp float t10_1;
highp vec4 t2;
highp vec4 t3;
highp vec4 t4;
highp vec4 t5;
highp vec3 t6;
highp vec3 t7;
highp vec2 t8;
lowp float t10_8;
highp vec3 t9;
lowp float t10_9;
highp float t16;
mediump float t16_16;
lowp float t10_16;
highp vec2 t19;
highp float t24;
lowp float t10_24;
void main()
{
    t0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    t8.x = _ZBufferParams.x * t0.x + _ZBufferParams.y;
    t8.x = float(1.0) / t8.x;
    t16 = (-t8.x) + t0.x;
    t8.x = unity_OrthoParams.w * t16 + t8.x;
    t1.xy = vs_TEXCOORD2.xy;
    t16 = (-vs_TEXCOORD2.z) + vs_TEXCOORD2.w;
    t1.z = t0.x * t16 + vs_TEXCOORD2.z;
    t0.xzw = (-vs_TEXCOORD1.xyz) * t8.xxx + t1.xyz;
    t1.xyz = t8.xxx * vs_TEXCOORD1.xyz;
    t0.xyz = unity_OrthoParams.www * t0.xzw + t1.xyz;
    t1 = t0.yyyy * _CameraToWorld[1];
    t1 = _CameraToWorld[0] * t0.xxxx + t1;
    t0 = _CameraToWorld[2] * t0.zzzz + t1;
    t0 = t0 + _CameraToWorld[3];
    t1.xyz = t0.yyy * unity_World2Shadow[0][1].xyz;
    t1.xyz = unity_World2Shadow[0][0].xyz * t0.xxx + t1.xyz;
    t1.xyz = unity_World2Shadow[0][2].xyz * t0.zzz + t1.xyz;
    t1.xyz = unity_World2Shadow[0][3].xyz * t0.www + t1.xyz;
    t0.xyz = t0.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    t0.x = dot(t0.xyz, t0.xyz);
    t0.x = sqrt(t0.x);
    t0.x = t0.x * _LightShadowData.z + _LightShadowData.w;
    t0.x = clamp(t0.x, 0.0, 1.0);
    t2.xz = _ShadowMapTexture_TexelSize.yy;
    t2.y = 0.142857149;
    t8.xy = t1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
    t1.xy = fract(t8.xy);
    t8.xy = floor(t8.xy);
    t8.xy = t8.xy + vec2(-0.5, -0.5);
    t3.xy = (-t1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    t19.xy = (-t1.xy) * vec2(3.0, 3.0) + vec2(4.0, 4.0);
    t3.xy = t3.xy / t19.xy;
    t4.xy = t3.xy + vec2(-2.0, -2.0);
    t5.z = t4.y;
    t3.xy = t1.xy * vec2(3.0, 3.0) + vec2(1.0, 1.0);
    t3.xz = t1.xy / t3.xy;
    t5.xw = t3.xz + vec2(2.0, 2.0);
    t4.w = t5.x;
    t9.xz = t1.xy + vec2(3.0, 3.0);
    t24 = t1.x * 3.0;
    t6.xz = vec2(t24) * vec2(-1.0, 1.0) + vec2(4.0, 1.0);
    t5.xy = t9.xz * _ShadowMapTexture_TexelSize.xy;
    t2.xyz = vec3(t2.x * t5.z, t2.y * t5.y, t2.z * t5.w);
    t4.z = t5.x;
    t5.w = t2.x;
    t7.xz = _ShadowMapTexture_TexelSize.xx;
    t7.y = 0.142857149;
    t5.xyz = t4.zxw * t7.yxz;
    t4 = t8.xyxy * _ShadowMapTexture_TexelSize.xyxy + t5.ywxw;
    t1.xy = t8.xy * _ShadowMapTexture_TexelSize.xy + t5.zw;
    vec3 txVec1 = vec3(t1.xy,t1.z);
    t10_24 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    vec3 txVec2 = vec3(t4.xy,t1.z);
    t10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(t4.zw,t1.z);
    t10_9 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    t6.y = 7.0;
    t3.xzw = t19.yyy * t6.xyz;
    t4.xyz = t3.yyy * t6.xyz;
    t6.xy = t6.xz * vec2(7.0, 7.0);
    t9.x = t10_9 * t3.z;
    t1.x = t3.x * t10_1 + t9.x;
    t24 = t3.w * t10_24 + t1.x;
    t2.w = t5.y;
    t3 = t8.xyxy * _ShadowMapTexture_TexelSize.xyxy + t2.wywz;
    t5.yw = t2.yz;
    vec3 txVec4 = vec3(t3.xy,t1.z);
    t10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
    vec3 txVec5 = vec3(t3.zw,t1.z);
    t10_9 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
    t24 = t6.x * t10_1 + t24;
    t2 = t8.xyxy * _ShadowMapTexture_TexelSize.xyxy + t5.xyzy;
    t3 = t8.xyxy * _ShadowMapTexture_TexelSize.xyxy + t5.xwzw;
    vec3 txVec6 = vec3(t2.xy,t1.z);
    t10_8 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
    vec3 txVec7 = vec3(t2.zw,t1.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
    t8.x = t10_8 * 49.0 + t24;
    t8.x = t6.y * t10_16 + t8.x;
    t8.x = t4.x * t10_9 + t8.x;
    vec3 txVec8 = vec3(t3.xy,t1.z);
    t10_16 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
    vec3 txVec9 = vec3(t3.zw,t1.z);
    t10_24 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
    t8.x = t4.y * t10_16 + t8.x;
    t8.x = t4.z * t10_24 + t8.x;
    t8.x = t8.x * 0.0069444445;
    t16_16 = (-_LightShadowData.x) + 1.0;
    t8.x = t8.x * t16_16 + _LightShadowData.x;
    t0 = t0.xxxx + t8.xxxx;
    SV_Target0 = t0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_NATIVE" }
"!!GLES3"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
"!!GLES3"
}
SubProgram "gles " {
Keywords { "SHADOWS_SINGLE_CASCADE" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES3"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" "SHADOWS_SINGLE_CASCADE" }
"!!GLES3"
}
}
 }
}
Fallback Off
}