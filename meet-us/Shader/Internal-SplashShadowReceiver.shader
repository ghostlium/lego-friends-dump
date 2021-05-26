//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/InternalSplashShadowReceiver" {
SubShader { 
 Pass {
  Cull Off
  GpuProgramID 50027
Program "vp" {
SubProgram "gles " {
"!!GLES
#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
uniform highp mat4 glstate_matrix_mvp;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesNormal;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_COLOR = _glesColor;
}


#endif
#ifdef FRAGMENT
uniform mediump vec3 unity_LightColor0;
uniform mediump vec3 unity_LightColor1;
uniform highp mat4 unity_World2Shadow[4];
uniform sampler2D unity_SplashScreenShadowTex0;
uniform sampler2D unity_SplashScreenShadowTex1;
uniform sampler2D unity_SplashScreenShadowTex2;
uniform sampler2D unity_SplashScreenShadowTex3;
uniform sampler2D unity_SplashScreenShadowTex4;
uniform sampler2D unity_SplashScreenShadowTex5;
uniform sampler2D unity_SplashScreenShadowTex6;
uniform sampler2D unity_SplashScreenShadowTex7;
uniform sampler2D unity_SplashScreenShadowTex8;
uniform highp vec3 unity_LightPosition0;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp float shadowedIntensity_3;
  highp float biasedDepth_5;
  highp int equationIndex_6;
  highp int equationMatrixIndex_7;
  lowp vec4 weightedShadowSample_8;
  highp vec4 planeShadows3_9;
  highp vec4 planeShadows2_10;
  highp vec4 planeShadows1_11;
  lowp vec4 shadowSample8_12;
  lowp vec4 shadowSample7_13;
  lowp vec4 shadowSample6_14;
  lowp vec4 shadowSample5_15;
  lowp vec4 shadowSample4_16;
  lowp vec4 shadowSample3_17;
  lowp vec4 shadowSample2_18;
  lowp vec4 shadowSample1_19;
  lowp vec4 shadowSample0_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_World2Shadow[0] * xlv_TEXCOORD1);
  highp vec2 tmpvar_22;
  tmpvar_22 = (((tmpvar_21.xy / tmpvar_21.w) * 0.5) + 0.5);
  shadowSample0_20 = texture2D (unity_SplashScreenShadowTex0, tmpvar_22);
  shadowSample1_19 = texture2D (unity_SplashScreenShadowTex1, tmpvar_22);
  shadowSample2_18 = texture2D (unity_SplashScreenShadowTex2, tmpvar_22);
  shadowSample3_17 = texture2D (unity_SplashScreenShadowTex3, tmpvar_22);
  shadowSample4_16 = texture2D (unity_SplashScreenShadowTex4, tmpvar_22);
  shadowSample5_15 = texture2D (unity_SplashScreenShadowTex5, tmpvar_22);
  shadowSample6_14 = texture2D (unity_SplashScreenShadowTex6, tmpvar_22);
  shadowSample7_13 = texture2D (unity_SplashScreenShadowTex7, tmpvar_22);
  shadowSample8_12 = texture2D (unity_SplashScreenShadowTex8, tmpvar_22);
  planeShadows1_11 = vec4(0.0, 0.0, 0.0, 0.0);
  planeShadows2_10 = vec4(0.0, 0.0, 0.0, 0.0);
  planeShadows3_9 = vec4(0.0, 0.0, 0.0, 0.0);
  equationMatrixIndex_7 = 1;
  equationIndex_6 = 0;
  for (highp int planeIndex_4 = 0; planeIndex_4 < 12; planeIndex_4++) {
    equationIndex_6 = planeIndex_4;
    if ((planeIndex_4 >= 8)) {
      equationMatrixIndex_7 = 3;
      equationIndex_6 = (planeIndex_4 - 8);
    } else {
      if ((planeIndex_4 >= 4)) {
        equationMatrixIndex_7 = 2;
        equationIndex_6 = (equationIndex_6 - 4);
      };
    };
    highp mat4 m_23;
    m_23 = unity_World2Shadow[equationMatrixIndex_7];
    highp vec4 v_24;
    v_24.x = m_23[0][equationIndex_6];
    v_24.y = m_23[1][equationIndex_6];
    v_24.z = m_23[2][equationIndex_6];
    v_24.w = m_23[3][equationIndex_6];
    biasedDepth_5 = (dot (v_24, tmpvar_2) - 1.0);
    if ((biasedDepth_5 > 0.0)) {
      highp float tmpvar_25;
      tmpvar_25 = clamp ((biasedDepth_5 * 0.5), 0.0, 1.0);
      highp float tmpvar_26;
      tmpvar_26 = clamp (((biasedDepth_5 - 2.0) / 48.0), 0.0, 1.0);
      highp float tmpvar_27;
      tmpvar_27 = (biasedDepth_5 * 0.25);
      highp float tmpvar_28;
      tmpvar_28 = clamp ((1.0 - tmpvar_27), 0.0, 1.0);
      highp float tmpvar_29;
      tmpvar_29 = clamp ((tmpvar_27 - 1.0), 0.0, 1.0);
      highp float tmpvar_30;
      tmpvar_30 = (1.0 - (tmpvar_28 + tmpvar_29));
      if ((equationMatrixIndex_7 == 1)) {
        weightedShadowSample_8 = (((shadowSample0_20 * tmpvar_28) + (shadowSample1_19 * tmpvar_30)) + (shadowSample2_18 * tmpvar_29));
        planeShadows1_11[equationIndex_6] = (((
          weightedShadowSample_8[equationIndex_6]
         * tmpvar_25) - tmpvar_26) * (1.0 + tmpvar_26));
      } else {
        if ((equationMatrixIndex_7 == 2)) {
          weightedShadowSample_8 = (((shadowSample3_17 * tmpvar_28) + (shadowSample4_16 * tmpvar_30)) + (shadowSample5_15 * tmpvar_29));
          planeShadows2_10[equationIndex_6] = (((
            weightedShadowSample_8[equationIndex_6]
           * tmpvar_25) - tmpvar_26) * (1.0 + tmpvar_26));
        } else {
          weightedShadowSample_8 = (((shadowSample6_14 * tmpvar_28) + (shadowSample7_13 * tmpvar_30)) + (shadowSample8_12 * tmpvar_29));
          planeShadows3_9[equationIndex_6] = (((
            weightedShadowSample_8[equationIndex_6]
           * tmpvar_25) - tmpvar_26) * (1.0 + tmpvar_26));
        };
      };
    };
  };
  highp float tmpvar_31;
  tmpvar_31 = (pow (clamp (
    dot (xlv_TEXCOORD0, normalize((unity_LightPosition0 - xlv_TEXCOORD1.xyz)))
  , 0.0, 1.0), 3.0) * (1.0 - clamp (
    max (max (max (max (planeShadows1_11.x, planeShadows1_11.y), max (planeShadows1_11.z, planeShadows1_11.w)), max (max (planeShadows2_10.x, planeShadows2_10.y), max (planeShadows2_10.z, planeShadows2_10.w))), max (max (planeShadows3_9.x, planeShadows3_9.y), max (planeShadows3_9.z, planeShadows3_9.w)))
  , 0.0, 1.0)));
  shadowedIntensity_3 = tmpvar_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = mix (unity_LightColor1, unity_LightColor0, vec3(shadowedIntensity_3));
  tmpvar_1 = (tmpvar_32 * xlv_COLOR);
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
in lowp vec4 in_COLOR0;
out highp vec3 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out lowp vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform lowp sampler2D unity_SplashScreenShadowTex2;
uniform lowp sampler2D unity_SplashScreenShadowTex3;
uniform lowp sampler2D unity_SplashScreenShadowTex4;
uniform lowp sampler2D unity_SplashScreenShadowTex5;
uniform lowp sampler2D unity_SplashScreenShadowTex6;
uniform lowp sampler2D unity_SplashScreenShadowTex7;
uniform lowp sampler2D unity_SplashScreenShadowTex8;
in highp vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in lowp vec4 vs_COLOR0;
layout(location = 0) out lowp vec4 SV_Target0;
highp vec4 t0;
highp vec4 t1;
highp vec3 t2;
lowp vec4 t10_2;
lowp vec4 t10_3;
lowp vec4 t10_4;
lowp vec4 t10_5;
mediump vec3 t16_6;
highp vec3 t7;
highp float t8;
highp float t14;
highp float t15;
bool tb15;
highp float t16;
highp float t21;
bool tb21;
highp float t22;
void main()
{
    t0.x = unity_World2Shadow[1][0].x;
    t0.y = unity_World2Shadow[1][1].x;
    t0.z = unity_World2Shadow[1][2].x;
    t0.w = unity_World2Shadow[1][3].x;
    t0.x = dot(t0, vs_TEXCOORD1);
    t0.xyz = t0.xxx + vec3(-1.0, -3.0, -1.0);
    tb21 = 0.0<t0.z;
    t0.xy = t0.xy * vec2(0.5, 0.020833334);
    t0.xy = t0.xy;
    t0.xy = clamp(t0.xy, 0.0, 1.0);
    t1.x = t0.y + 1.0;
    t8 = t0.z * 0.25 + -1.0;
    t8 = clamp(t8, 0.0, 1.0);
    t14 = (-t0.z) * 0.25 + 1.0;
    t14 = clamp(t14, 0.0, 1.0);
    t15 = t8 + t14;
    t15 = (-t15) + 1.0;
    t2.xyz = vs_TEXCOORD1.yyy * unity_World2Shadow[0][1].xyw;
    t2.xyz = unity_World2Shadow[0][0].xyw * vs_TEXCOORD1.xxx + t2.xyz;
    t2.xyz = unity_World2Shadow[0][2].xyw * vs_TEXCOORD1.zzz + t2.xyz;
    t2.xyz = unity_World2Shadow[0][3].xyw * vs_TEXCOORD1.www + t2.xyz;
    t2.xy = t2.xy / t2.zz;
    t2.xy = t2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    t10_3 = texture(unity_SplashScreenShadowTex1, t2.xy);
    t15 = t15 * t10_3.x;
    t10_4 = texture(unity_SplashScreenShadowTex0, t2.xy);
    t14 = t10_4.x * t14 + t15;
    t10_5 = texture(unity_SplashScreenShadowTex2, t2.xy);
    t14 = t10_5.x * t8 + t14;
    t0.x = t14 * t0.x + (-t0.y);
    t0.x = t1.x * t0.x;
    t0.x = tb21 ? t0.x : float(0.0);
    t1.x = unity_World2Shadow[1][0].y;
    t1.y = unity_World2Shadow[1][1].y;
    t1.z = unity_World2Shadow[1][2].y;
    t1.w = unity_World2Shadow[1][3].y;
    t7.x = dot(t1, vs_TEXCOORD1);
    t7.xyz = t7.xxx + vec3(-1.0, -3.0, -1.0);
    t1.x = (-t7.z) * 0.25 + 1.0;
    t1.x = clamp(t1.x, 0.0, 1.0);
    t8 = t7.z * 0.25 + -1.0;
    t8 = clamp(t8, 0.0, 1.0);
    t15 = t8 + t1.x;
    t15 = (-t15) + 1.0;
    t15 = t15 * t10_3.y;
    t1.x = t10_4.y * t1.x + t15;
    t1.x = t10_5.y * t8 + t1.x;
    t7.xy = t7.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t7.z;
    t7.xy = t7.xy;
    t7.xy = clamp(t7.xy, 0.0, 1.0);
    t7.x = t1.x * t7.x + (-t7.y);
    t14 = t7.y + 1.0;
    t7.x = t14 * t7.x;
    t7.x = tb21 ? t7.x : float(0.0);
    t0.x = max(t7.x, t0.x);
    t1.x = unity_World2Shadow[1][0].z;
    t1.y = unity_World2Shadow[1][1].z;
    t1.z = unity_World2Shadow[1][2].z;
    t1.w = unity_World2Shadow[1][3].z;
    t7.x = dot(t1, vs_TEXCOORD1);
    t7.xyz = t7.xxx + vec3(-1.0, -3.0, -1.0);
    t1.x = (-t7.z) * 0.25 + 1.0;
    t1.x = clamp(t1.x, 0.0, 1.0);
    t8 = t7.z * 0.25 + -1.0;
    t8 = clamp(t8, 0.0, 1.0);
    t15 = t8 + t1.x;
    t15 = (-t15) + 1.0;
    t15 = t15 * t10_3.z;
    t1.x = t10_4.z * t1.x + t15;
    t1.x = t10_5.z * t8 + t1.x;
    t7.xy = t7.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t7.z;
    t7.xy = t7.xy;
    t7.xy = clamp(t7.xy, 0.0, 1.0);
    t7.x = t1.x * t7.x + (-t7.y);
    t14 = t7.y + 1.0;
    t7.x = t14 * t7.x;
    t7.x = tb21 ? t7.x : float(0.0);
    t1.x = unity_World2Shadow[1][0].w;
    t1.y = unity_World2Shadow[1][1].w;
    t1.z = unity_World2Shadow[1][2].w;
    t1.w = unity_World2Shadow[1][3].w;
    t14 = dot(t1, vs_TEXCOORD1);
    t1.xyz = vec3(t14) + vec3(-1.0, -3.0, -1.0);
    t14 = (-t1.z) * 0.25 + 1.0;
    t14 = clamp(t14, 0.0, 1.0);
    t21 = t1.z * 0.25 + -1.0;
    t21 = clamp(t21, 0.0, 1.0);
    t22 = t21 + t14;
    t22 = (-t22) + 1.0;
    t22 = t22 * t10_3.w;
    t14 = t10_4.w * t14 + t22;
    t14 = t10_5.w * t21 + t14;
    t1.xy = t1.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t1.z;
    t1.xy = t1.xy;
    t1.xy = clamp(t1.xy, 0.0, 1.0);
    t14 = t14 * t1.x + (-t1.y);
    t1.x = t1.y + 1.0;
    t14 = t14 * t1.x;
    t14 = tb21 ? t14 : float(0.0);
    t7.x = max(t14, t7.x);
    t0.x = max(t7.x, t0.x);
    t1.x = unity_World2Shadow[2][0].x;
    t1.y = unity_World2Shadow[2][1].x;
    t1.z = unity_World2Shadow[2][2].x;
    t1.w = unity_World2Shadow[2][3].x;
    t7.x = dot(t1, vs_TEXCOORD1);
    t7.xyz = t7.xxx + vec3(-1.0, -3.0, -1.0);
    t1.x = (-t7.z) * 0.25 + 1.0;
    t1.x = clamp(t1.x, 0.0, 1.0);
    t8 = t7.z * 0.25 + -1.0;
    t8 = clamp(t8, 0.0, 1.0);
    t15 = t8 + t1.x;
    t15 = (-t15) + 1.0;
    t10_3 = texture(unity_SplashScreenShadowTex4, t2.xy);
    t15 = t15 * t10_3.x;
    t10_4 = texture(unity_SplashScreenShadowTex3, t2.xy);
    t1.x = t10_4.x * t1.x + t15;
    t10_5 = texture(unity_SplashScreenShadowTex5, t2.xy);
    t1.x = t10_5.x * t8 + t1.x;
    t7.xy = t7.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t7.z;
    t7.xy = t7.xy;
    t7.xy = clamp(t7.xy, 0.0, 1.0);
    t7.x = t1.x * t7.x + (-t7.y);
    t14 = t7.y + 1.0;
    t7.x = t14 * t7.x;
    t7.x = tb21 ? t7.x : float(0.0);
    t1.x = unity_World2Shadow[2][0].y;
    t1.y = unity_World2Shadow[2][1].y;
    t1.z = unity_World2Shadow[2][2].y;
    t1.w = unity_World2Shadow[2][3].y;
    t14 = dot(t1, vs_TEXCOORD1);
    t1.xyz = vec3(t14) + vec3(-1.0, -3.0, -1.0);
    t14 = (-t1.z) * 0.25 + 1.0;
    t14 = clamp(t14, 0.0, 1.0);
    t21 = t1.z * 0.25 + -1.0;
    t21 = clamp(t21, 0.0, 1.0);
    t22 = t21 + t14;
    t22 = (-t22) + 1.0;
    t22 = t22 * t10_3.y;
    t14 = t10_4.y * t14 + t22;
    t14 = t10_5.y * t21 + t14;
    t1.xy = t1.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t1.z;
    t1.xy = t1.xy;
    t1.xy = clamp(t1.xy, 0.0, 1.0);
    t14 = t14 * t1.x + (-t1.y);
    t1.x = t1.y + 1.0;
    t14 = t14 * t1.x;
    t14 = tb21 ? t14 : float(0.0);
    t7.x = max(t14, t7.x);
    t1.x = unity_World2Shadow[2][0].z;
    t1.y = unity_World2Shadow[2][1].z;
    t1.z = unity_World2Shadow[2][2].z;
    t1.w = unity_World2Shadow[2][3].z;
    t14 = dot(t1, vs_TEXCOORD1);
    t1.xyz = vec3(t14) + vec3(-1.0, -3.0, -1.0);
    t14 = (-t1.z) * 0.25 + 1.0;
    t14 = clamp(t14, 0.0, 1.0);
    t21 = t1.z * 0.25 + -1.0;
    t21 = clamp(t21, 0.0, 1.0);
    t22 = t21 + t14;
    t22 = (-t22) + 1.0;
    t22 = t22 * t10_3.z;
    t14 = t10_4.z * t14 + t22;
    t14 = t10_5.z * t21 + t14;
    t1.xy = t1.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t1.z;
    t1.xy = t1.xy;
    t1.xy = clamp(t1.xy, 0.0, 1.0);
    t14 = t14 * t1.x + (-t1.y);
    t1.x = t1.y + 1.0;
    t14 = t14 * t1.x;
    t14 = tb21 ? t14 : float(0.0);
    t1.x = unity_World2Shadow[2][0].w;
    t1.y = unity_World2Shadow[2][1].w;
    t1.z = unity_World2Shadow[2][2].w;
    t1.w = unity_World2Shadow[2][3].w;
    t21 = dot(t1, vs_TEXCOORD1);
    t1.xyz = vec3(t21) + vec3(-1.0, -3.0, -1.0);
    t21 = (-t1.z) * 0.25 + 1.0;
    t21 = clamp(t21, 0.0, 1.0);
    t22 = t1.z * 0.25 + -1.0;
    t22 = clamp(t22, 0.0, 1.0);
    t16 = t21 + t22;
    t16 = (-t16) + 1.0;
    t16 = t16 * t10_3.w;
    t21 = t10_4.w * t21 + t16;
    t21 = t10_5.w * t22 + t21;
    t1.xy = t1.xy * vec2(0.5, 0.020833334);
    tb15 = 0.0<t1.z;
    t1.xy = t1.xy;
    t1.xy = clamp(t1.xy, 0.0, 1.0);
    t21 = t21 * t1.x + (-t1.y);
    t1.x = t1.y + 1.0;
    t21 = t21 * t1.x;
    t21 = tb15 ? t21 : float(0.0);
    t14 = max(t21, t14);
    t7.x = max(t14, t7.x);
    t0.x = max(t7.x, t0.x);
    t1.x = unity_World2Shadow[3][0].x;
    t1.y = unity_World2Shadow[3][1].x;
    t1.z = unity_World2Shadow[3][2].x;
    t1.w = unity_World2Shadow[3][3].x;
    t7.x = dot(t1, vs_TEXCOORD1);
    t7.xyz = t7.xxx + vec3(-1.0, -3.0, -1.0);
    t1.x = (-t7.z) * 0.25 + 1.0;
    t1.x = clamp(t1.x, 0.0, 1.0);
    t8 = t7.z * 0.25 + -1.0;
    t8 = clamp(t8, 0.0, 1.0);
    t15 = t8 + t1.x;
    t15 = (-t15) + 1.0;
    t10_3 = texture(unity_SplashScreenShadowTex7, t2.xy);
    t15 = t15 * t10_3.x;
    t10_4 = texture(unity_SplashScreenShadowTex6, t2.xy);
    t10_2 = texture(unity_SplashScreenShadowTex8, t2.xy);
    t1.x = t10_4.x * t1.x + t15;
    t1.x = t10_2.x * t8 + t1.x;
    t7.xy = t7.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t7.z;
    t7.xy = t7.xy;
    t7.xy = clamp(t7.xy, 0.0, 1.0);
    t7.x = t1.x * t7.x + (-t7.y);
    t14 = t7.y + 1.0;
    t7.x = t14 * t7.x;
    t7.x = tb21 ? t7.x : float(0.0);
    t1.x = unity_World2Shadow[3][0].y;
    t1.y = unity_World2Shadow[3][1].y;
    t1.z = unity_World2Shadow[3][2].y;
    t1.w = unity_World2Shadow[3][3].y;
    t14 = dot(t1, vs_TEXCOORD1);
    t1.xyz = vec3(t14) + vec3(-1.0, -3.0, -1.0);
    t14 = (-t1.z) * 0.25 + 1.0;
    t14 = clamp(t14, 0.0, 1.0);
    t21 = t1.z * 0.25 + -1.0;
    t21 = clamp(t21, 0.0, 1.0);
    t22 = t21 + t14;
    t22 = (-t22) + 1.0;
    t22 = t22 * t10_3.y;
    t14 = t10_4.y * t14 + t22;
    t14 = t10_2.y * t21 + t14;
    t1.xy = t1.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t1.z;
    t1.xy = t1.xy;
    t1.xy = clamp(t1.xy, 0.0, 1.0);
    t14 = t14 * t1.x + (-t1.y);
    t1.x = t1.y + 1.0;
    t14 = t14 * t1.x;
    t14 = tb21 ? t14 : float(0.0);
    t7.x = max(t14, t7.x);
    t1.x = unity_World2Shadow[3][0].z;
    t1.y = unity_World2Shadow[3][1].z;
    t1.z = unity_World2Shadow[3][2].z;
    t1.w = unity_World2Shadow[3][3].z;
    t14 = dot(t1, vs_TEXCOORD1);
    t1.xyz = vec3(t14) + vec3(-1.0, -3.0, -1.0);
    t14 = (-t1.z) * 0.25 + 1.0;
    t14 = clamp(t14, 0.0, 1.0);
    t21 = t1.z * 0.25 + -1.0;
    t21 = clamp(t21, 0.0, 1.0);
    t22 = t21 + t14;
    t22 = (-t22) + 1.0;
    t22 = t22 * t10_3.z;
    t14 = t10_4.z * t14 + t22;
    t14 = t10_2.z * t21 + t14;
    t1.xy = t1.xy * vec2(0.5, 0.020833334);
    tb21 = 0.0<t1.z;
    t1.xy = t1.xy;
    t1.xy = clamp(t1.xy, 0.0, 1.0);
    t14 = t14 * t1.x + (-t1.y);
    t1.x = t1.y + 1.0;
    t14 = t14 * t1.x;
    t14 = tb21 ? t14 : float(0.0);
    t1.x = unity_World2Shadow[3][0].w;
    t1.y = unity_World2Shadow[3][1].w;
    t1.z = unity_World2Shadow[3][2].w;
    t1.w = unity_World2Shadow[3][3].w;
    t21 = dot(t1, vs_TEXCOORD1);
    t1.xyz = vec3(t21) + vec3(-1.0, -3.0, -1.0);
    t21 = (-t1.z) * 0.25 + 1.0;
    t21 = clamp(t21, 0.0, 1.0);
    t22 = t1.z * 0.25 + -1.0;
    t22 = clamp(t22, 0.0, 1.0);
    t2.x = t21 + t22;
    t2.x = (-t2.x) + 1.0;
    t2.x = t2.x * t10_3.w;
    t21 = t10_4.w * t21 + t2.x;
    t21 = t10_2.w * t22 + t21;
    t1.xy = t1.xy * vec2(0.5, 0.020833334);
    tb15 = 0.0<t1.z;
    t1.xy = t1.xy;
    t1.xy = clamp(t1.xy, 0.0, 1.0);
    t21 = t21 * t1.x + (-t1.y);
    t1.x = t1.y + 1.0;
    t21 = t21 * t1.x;
    t21 = tb15 ? t21 : float(0.0);
    t14 = max(t21, t14);
    t7.x = max(t14, t7.x);
    t0.x = max(t7.x, t0.x);
    t0.x = clamp(t0.x, 0.0, 1.0);
    t0.x = (-t0.x) + 1.0;
    t7.xyz = (-vs_TEXCOORD1.xyz) + unity_LightPosition0.xyzx.xyz;
    t1.x = dot(t7.xyz, t7.xyz);
    t1.x = inversesqrt(t1.x);
    t7.xyz = t7.xyz * t1.xxx;
    t7.x = dot(vs_TEXCOORD0.xyz, t7.xyz);
    t7.x = clamp(t7.x, 0.0, 1.0);
    t14 = t7.x * t7.x;
    t7.x = t14 * t7.x;
    t0.x = t0.x * t7.x;
    t16_6.xyz = unity_LightColor0.xyzx.xyz + (-unity_LightColor1.xyzx.xyz);
    t16_6.xyz = t0.xxx * t16_6.xyz + unity_LightColor1.xyzx.xyz;
    SV_Target0.xyz = t16_6.xyz * vs_COLOR0.xyz;
    SV_Target0.w = vs_COLOR0.w;
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