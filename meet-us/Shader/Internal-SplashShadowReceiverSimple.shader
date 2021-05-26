//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/InternalSplashShadowReceiverSimple" {
SubShader { 
 Pass {
  Cull Off
  GpuProgramID 38741
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2 = (unity_World2Shadow[0] * tmpvar_1);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesNormal;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD2 = (((tmpvar_2.xy / tmpvar_2.w) * 0.5) + 0.5);
}


#endif
#ifdef FRAGMENT
uniform mediump vec3 unity_LightColor0;
uniform mediump vec3 unity_LightColor1;
uniform highp mat4 unity_World2Shadow[4];
uniform sampler2D unity_SplashScreenShadowTex0;
uniform sampler2D unity_SplashScreenShadowTex1;
uniform highp vec3 unity_LightPosition0;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  lowp float shadowedIntensity_2;
  highp vec4 planeShadows_3;
  lowp vec4 shadowSample1_4;
  lowp vec4 shadowSample0_5;
  shadowSample0_5 = texture2D (unity_SplashScreenShadowTex0, xlv_TEXCOORD2);
  shadowSample1_4 = texture2D (unity_SplashScreenShadowTex1, xlv_TEXCOORD2);
  planeShadows_3 = vec4(0.0, 0.0, 0.0, 0.0);
  highp mat4 m_6;
  m_6 = unity_World2Shadow[1];
  highp vec4 v_7;
  v_7.x = m_6[0].x;
  v_7.y = m_6[1].x;
  v_7.z = m_6[2].x;
  v_7.w = m_6[3].x;
  highp float tmpvar_8;
  tmpvar_8 = dot (v_7, xlv_TEXCOORD1);
  if ((tmpvar_8 > 0.5)) {
    lowp vec4 weightedShadowSample_9;
    highp float tmpvar_10;
    tmpvar_10 = clamp ((1.0 - (tmpvar_8 * 0.25)), 0.0, 1.0);
    highp vec4 tmpvar_11;
    tmpvar_11 = ((shadowSample0_5 * tmpvar_10) + (shadowSample1_4 * (1.0 - tmpvar_10)));
    weightedShadowSample_9 = tmpvar_11;
    lowp vec4 tmpvar_12;
    tmpvar_12.yzw = vec3(0.0, 0.0, 0.0);
    tmpvar_12.x = weightedShadowSample_9.x;
    planeShadows_3 = tmpvar_12;
  };
  highp mat4 m_13;
  m_13 = unity_World2Shadow[1];
  highp vec4 v_14;
  v_14.x = m_13[0].y;
  v_14.y = m_13[1].y;
  v_14.z = m_13[2].y;
  v_14.w = m_13[3].y;
  highp float tmpvar_15;
  tmpvar_15 = dot (v_14, xlv_TEXCOORD1);
  if ((tmpvar_15 > 0.5)) {
    lowp vec4 weightedShadowSample_16;
    highp float tmpvar_17;
    tmpvar_17 = clamp ((1.0 - (tmpvar_15 * 0.25)), 0.0, 1.0);
    highp vec4 tmpvar_18;
    tmpvar_18 = ((shadowSample0_5 * tmpvar_17) + (shadowSample1_4 * (1.0 - tmpvar_17)));
    weightedShadowSample_16 = tmpvar_18;
    highp vec4 tmpvar_19;
    tmpvar_19.xzw = planeShadows_3.xzw;
    tmpvar_19.y = weightedShadowSample_16.y;
    planeShadows_3 = tmpvar_19;
  };
  highp mat4 m_20;
  m_20 = unity_World2Shadow[1];
  highp vec4 v_21;
  v_21.x = m_20[0].z;
  v_21.y = m_20[1].z;
  v_21.z = m_20[2].z;
  v_21.w = m_20[3].z;
  highp float tmpvar_22;
  tmpvar_22 = dot (v_21, xlv_TEXCOORD1);
  if ((tmpvar_22 > 0.5)) {
    lowp vec4 weightedShadowSample_23;
    highp float tmpvar_24;
    tmpvar_24 = clamp ((1.0 - (tmpvar_22 * 0.25)), 0.0, 1.0);
    highp vec4 tmpvar_25;
    tmpvar_25 = ((shadowSample0_5 * tmpvar_24) + (shadowSample1_4 * (1.0 - tmpvar_24)));
    weightedShadowSample_23 = tmpvar_25;
    highp vec4 tmpvar_26;
    tmpvar_26.xyw = planeShadows_3.xyw;
    tmpvar_26.z = weightedShadowSample_23.z;
    planeShadows_3 = tmpvar_26;
  };
  highp mat4 m_27;
  m_27 = unity_World2Shadow[1];
  highp vec4 v_28;
  v_28.x = m_27[0].w;
  v_28.y = m_27[1].w;
  v_28.z = m_27[2].w;
  v_28.w = m_27[3].w;
  highp float tmpvar_29;
  tmpvar_29 = dot (v_28, xlv_TEXCOORD1);
  if ((tmpvar_29 > 0.5)) {
    lowp vec4 weightedShadowSample_30;
    highp float tmpvar_31;
    tmpvar_31 = clamp ((1.0 - (tmpvar_29 * 0.25)), 0.0, 1.0);
    highp vec4 tmpvar_32;
    tmpvar_32 = ((shadowSample0_5 * tmpvar_31) + (shadowSample1_4 * (1.0 - tmpvar_31)));
    weightedShadowSample_30 = tmpvar_32;
    highp vec4 tmpvar_33;
    tmpvar_33.xyz = planeShadows_3.xyz;
    tmpvar_33.w = weightedShadowSample_30.w;
    planeShadows_3 = tmpvar_33;
  };
  highp float tmpvar_34;
  tmpvar_34 = (pow (clamp (
    dot (xlv_TEXCOORD0, normalize((unity_LightPosition0 - xlv_TEXCOORD1.xyz)))
  , 0.0, 1.0), 3.0) * (1.0 - max (
    max (planeShadows_3.x, planeShadows_3.y)
  , 
    max (planeShadows_3.z, planeShadows_3.w)
  )));
  shadowedIntensity_2 = tmpvar_34;
  mediump vec4 tmpvar_35;
  tmpvar_35.w = 1.0;
  tmpvar_35.xyz = mix (unity_LightColor1, unity_LightColor0, vec3(shadowedIntensity_2));
  tmpvar_1 = tmpvar_35;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 " {
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
uniform 	vec3 unity_LightPosition0;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
highp vec4 t0;
void main()
{
    t0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    t0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + t0;
    t0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + t0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + t0;
    vs_TEXCOORD0.xyz = in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    vs_TEXCOORD1.w = 1.0;
    t0.xyz = in_POSITION0.yyy * unity_World2Shadow[0][1].xyw;
    t0.xyz = unity_World2Shadow[0][0].xyw * in_POSITION0.xxx + t0.xyz;
    t0.xyz = unity_World2Shadow[0][2].xyw * in_POSITION0.zzz + t0.xyz;
    t0.xyz = t0.xyz + unity_World2Shadow[0][3].xyw;
    t0.xy = t0.xy / t0.zz;
    vs_TEXCOORD2.xy = t0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec3 unity_LightPosition0;
uniform lowp sampler2D unity_SplashScreenShadowTex0;
uniform lowp sampler2D unity_SplashScreenShadowTex1;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp float t1;
lowp vec4 t10_1;
lowp vec4 t10_2;
highp vec4 t3;
mediump vec3 t16_4;
highp vec3 t5;
bool tb5;
highp float t10;
bool tb10;
highp float t15;
void main()
{
    t0.x = unity_World2Shadow[1][0].x;
    t0.y = unity_World2Shadow[1][1].x;
    t0.z = unity_World2Shadow[1][2].x;
    t0.w = unity_World2Shadow[1][3].x;
    t0.x = dot(t0, vs_TEXCOORD1);
    tb5 = 0.5<t0.x;
    t0.x = (-t0.x) * 0.25 + 1.0;
    t0.x = clamp(t0.x, 0.0, 1.0);
    t10 = (-t0.x) + 1.0;
    t10_1 = texture(unity_SplashScreenShadowTex1, vs_TEXCOORD2.xy);
    t10 = t10 * t10_1.x;
    t10_2 = texture(unity_SplashScreenShadowTex0, vs_TEXCOORD2.xy);
    t0.x = t10_2.x * t0.x + t10;
    t0.x = tb5 ? t0.x : float(0.0);
    t3.x = unity_World2Shadow[1][0].y;
    t3.y = unity_World2Shadow[1][1].y;
    t3.z = unity_World2Shadow[1][2].y;
    t3.w = unity_World2Shadow[1][3].y;
    t5.x = dot(t3, vs_TEXCOORD1);
    tb10 = 0.5<t5.x;
    t5.x = (-t5.x) * 0.25 + 1.0;
    t5.x = clamp(t5.x, 0.0, 1.0);
    t15 = (-t5.x) + 1.0;
    t15 = t15 * t10_1.y;
    t5.x = t10_2.y * t5.x + t15;
    t5.x = tb10 ? t5.x : float(0.0);
    t0.x = max(t5.x, t0.x);
    t3.x = unity_World2Shadow[1][0].z;
    t3.y = unity_World2Shadow[1][1].z;
    t3.z = unity_World2Shadow[1][2].z;
    t3.w = unity_World2Shadow[1][3].z;
    t5.x = dot(t3, vs_TEXCOORD1);
    t10 = (-t5.x) * 0.25 + 1.0;
    t10 = clamp(t10, 0.0, 1.0);
    tb5 = 0.5<t5.x;
    t15 = (-t10) + 1.0;
    t15 = t15 * t10_1.z;
    t10 = t10_2.z * t10 + t15;
    t5.x = tb5 ? t10 : float(0.0);
    t3.x = unity_World2Shadow[1][0].w;
    t3.y = unity_World2Shadow[1][1].w;
    t3.z = unity_World2Shadow[1][2].w;
    t3.w = unity_World2Shadow[1][3].w;
    t10 = dot(t3, vs_TEXCOORD1);
    t15 = (-t10) * 0.25 + 1.0;
    t15 = clamp(t15, 0.0, 1.0);
    tb10 = 0.5<t10;
    t1 = (-t15) + 1.0;
    t1 = t1 * t10_1.w;
    t15 = t10_2.w * t15 + t1;
    t10 = tb10 ? t15 : float(0.0);
    t5.x = max(t10, t5.x);
    t0.x = max(t5.x, t0.x);
    t0.x = (-t0.x) + 1.0;
    t5.xyz = (-vs_TEXCOORD1.xyz) + unity_LightPosition0.xyzx.xyz;
    t1 = dot(t5.xyz, t5.xyz);
    t1 = inversesqrt(t1);
    t5.xyz = t5.xyz * vec3(t1);
    t5.x = dot(vs_TEXCOORD0.xyz, t5.xyz);
    t5.x = clamp(t5.x, 0.0, 1.0);
    t10 = t5.x * t5.x;
    t5.x = t10 * t5.x;
    t0.x = t0.x * t5.x;
    t16_4.xyz = unity_LightColor0.xyzx.xyz + (-unity_LightColor1.xyzx.xyz);
    t16_4.xyz = t0.xxx * t16_4.xyz + unity_LightColor1.xyzx.xyz;
    SV_Target0.xyz = t16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }
}
Fallback Off
}