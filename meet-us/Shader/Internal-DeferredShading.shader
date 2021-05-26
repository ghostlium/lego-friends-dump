//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DeferredShading" {
Properties {
 _LightTexture0 ("", any) = "" { }
 _LightTextureB0 ("", 2D) = "" { }
 _ShadowMapTexture ("", any) = "" { }
 _SrcBlend ("", Float) = 1
 _DstBlend ("", Float) = 1
}
SubShader { 
 Pass {
  Tags { "SHADOWSUPPORT"="true" }
  ZWrite Off
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 36028
Program "vp" {
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _LightTextureB0;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - _LightPos.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(normalize(tmpvar_11));
  lightDir_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13)).w;
  atten_6 = tmpvar_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_17;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_18;
  tmpvar_18 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_20;
  viewDir_20 = -(tmpvar_19);
  mediump vec3 tmpvar_21;
  mediump vec3 inVec_22;
  inVec_22 = (lightDir_7 + viewDir_20);
  tmpvar_21 = (inVec_22 * inversesqrt(max (0.001, 
    dot (inVec_22, inVec_22)
  )));
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (lightDir_7, tmpvar_21));
  mediump float tmpvar_24;
  tmpvar_24 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max ((10.0 / log2(
    (((1.0 - tmpvar_24) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_25 = (tmpvar_26 * tmpvar_26);
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_25 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_18, tmpvar_21)), tmpvar_25)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_23 * tmpvar_23)
       * gbuffer1_3.w) + (tmpvar_24 * tmpvar_24))) * tmpvar_23)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_18, lightDir_7)));
  mediump vec4 tmpvar_28;
  tmpvar_28 = exp2(-(tmpvar_27));
  tmpvar_1 = tmpvar_28;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = -(_LightDir.xyz);
  lightDir_6 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_4 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_3 = tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_2 = tmpvar_12;
  tmpvar_5 = _LightColor.xyz;
  mediump vec3 tmpvar_13;
  tmpvar_13 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize(((_CameraToWorld * tmpvar_8).xyz - _WorldSpaceCameraPos));
  mediump vec3 viewDir_15;
  viewDir_15 = -(tmpvar_14);
  mediump vec3 tmpvar_16;
  mediump vec3 inVec_17;
  inVec_17 = (lightDir_6 + viewDir_15);
  tmpvar_16 = (inVec_17 * inversesqrt(max (0.001, 
    dot (inVec_17, inVec_17)
  )));
  mediump float tmpvar_18;
  tmpvar_18 = max (0.0, dot (lightDir_6, tmpvar_16));
  mediump float tmpvar_19;
  tmpvar_19 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_20;
  mediump float tmpvar_21;
  tmpvar_21 = max ((10.0 / log2(
    (((1.0 - tmpvar_19) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_20 = (tmpvar_21 * tmpvar_21);
  mediump vec4 tmpvar_22;
  tmpvar_22.w = 1.0;
  tmpvar_22.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_20 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_13, tmpvar_16)), tmpvar_20)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_18 * tmpvar_18)
       * gbuffer1_3.w) + (tmpvar_19 * tmpvar_19))) * tmpvar_18)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_13, lightDir_6)));
  mediump vec4 tmpvar_23;
  tmpvar_23 = exp2(-(tmpvar_22));
  tmpvar_1 = tmpvar_23;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (_LightPos.xyz - tmpvar_10);
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_11);
  lightDir_7 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_10;
  highp vec4 tmpvar_14;
  tmpvar_14 = (_LightMatrix0 * tmpvar_13);
  lowp float tmpvar_15;
  tmpvar_15 = texture2DProj (_LightTexture0, tmpvar_14).w;
  atten_6 = tmpvar_15;
  atten_6 = (atten_6 * float((tmpvar_14.w < 0.0)));
  highp float tmpvar_16;
  tmpvar_16 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_LightTextureB0, vec2(tmpvar_16));
  atten_6 = (atten_6 * tmpvar_17.w);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_20;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_23;
  viewDir_23 = -(tmpvar_22);
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (lightDir_7 + viewDir_23);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, dot (lightDir_7, tmpvar_24));
  mediump float tmpvar_27;
  tmpvar_27 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = max ((10.0 / log2(
    (((1.0 - tmpvar_27) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_28 = (tmpvar_29 * tmpvar_29);
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_28 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_21, tmpvar_24)), tmpvar_28)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_26 * tmpvar_26)
       * gbuffer1_3.w) + (tmpvar_27 * tmpvar_27))) * tmpvar_26)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_21, lightDir_7)));
  mediump vec4 tmpvar_31;
  tmpvar_31 = exp2(-(tmpvar_30));
  tmpvar_1 = tmpvar_31;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - _LightPos.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(normalize(tmpvar_11));
  lightDir_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13)).w;
  atten_6 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_10;
  lowp vec4 tmpvar_16;
  highp vec3 P_17;
  P_17 = (_LightMatrix0 * tmpvar_15).xyz;
  tmpvar_16 = textureCube (_LightTexture0, P_17);
  atten_6 = (atten_6 * tmpvar_16.w);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_20;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_23;
  viewDir_23 = -(tmpvar_22);
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (lightDir_7 + viewDir_23);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, dot (lightDir_7, tmpvar_24));
  mediump float tmpvar_27;
  tmpvar_27 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = max ((10.0 / log2(
    (((1.0 - tmpvar_27) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_28 = (tmpvar_29 * tmpvar_29);
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_28 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_21, tmpvar_24)), tmpvar_28)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_26 * tmpvar_26)
       * gbuffer1_3.w) + (tmpvar_27 * tmpvar_27))) * tmpvar_26)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_21, lightDir_7)));
  mediump vec4 tmpvar_31;
  tmpvar_31 = exp2(-(tmpvar_30));
  tmpvar_1 = tmpvar_31;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTexture0;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = -(_LightDir.xyz);
  lightDir_7 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_10;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = (_LightMatrix0 * tmpvar_12).xy;
  tmpvar_13 = texture2D (_LightTexture0, P_14);
  atten_6 = tmpvar_13.w;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_17;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_18;
  tmpvar_18 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_20;
  viewDir_20 = -(tmpvar_19);
  mediump vec3 tmpvar_21;
  mediump vec3 inVec_22;
  inVec_22 = (lightDir_7 + viewDir_20);
  tmpvar_21 = (inVec_22 * inversesqrt(max (0.001, 
    dot (inVec_22, inVec_22)
  )));
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (lightDir_7, tmpvar_21));
  mediump float tmpvar_24;
  tmpvar_24 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max ((10.0 / log2(
    (((1.0 - tmpvar_24) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_25 = (tmpvar_26 * tmpvar_26);
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_25 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_18, tmpvar_21)), tmpvar_25)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_23 * tmpvar_23)
       * gbuffer1_3.w) + (tmpvar_24 * tmpvar_24))) * tmpvar_23)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_18, lightDir_7)));
  mediump vec4 tmpvar_28;
  tmpvar_28 = exp2(-(tmpvar_27));
  tmpvar_1 = tmpvar_28;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NONATIVE" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform highp sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = (_LightPos.xyz - tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(tmpvar_12);
  lightDir_7 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_10;
  highp vec4 tmpvar_15;
  tmpvar_15 = (_LightMatrix0 * tmpvar_14);
  lowp float tmpvar_16;
  tmpvar_16 = texture2DProj (_LightTexture0, tmpvar_15).w;
  atten_6 = tmpvar_16;
  atten_6 = (atten_6 * float((tmpvar_15.w < 0.0)));
  highp float tmpvar_17;
  tmpvar_17 = (dot (tmpvar_12, tmpvar_12) * _LightPos.w);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_LightTextureB0, vec2(tmpvar_17));
  atten_6 = (atten_6 * tmpvar_18.w);
  mediump float tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (((
    mix (tmpvar_9.z, sqrt(dot (tmpvar_11, tmpvar_11)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_10;
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_World2Shadow[0] * tmpvar_21);
  lowp float tmpvar_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_ShadowMapTexture, tmpvar_22);
  mediump float tmpvar_25;
  if ((tmpvar_24.x < (tmpvar_22.z / tmpvar_22.w))) {
    tmpvar_25 = _LightShadowData.x;
  } else {
    tmpvar_25 = 1.0;
  };
  tmpvar_23 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = clamp ((tmpvar_23 + tmpvar_20), 0.0, 1.0);
  tmpvar_19 = tmpvar_26;
  atten_6 = (atten_6 * tmpvar_19);
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_29;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_30;
  tmpvar_30 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_31;
  tmpvar_31 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_32;
  viewDir_32 = -(tmpvar_31);
  mediump vec3 tmpvar_33;
  mediump vec3 inVec_34;
  inVec_34 = (lightDir_7 + viewDir_32);
  tmpvar_33 = (inVec_34 * inversesqrt(max (0.001, 
    dot (inVec_34, inVec_34)
  )));
  mediump float tmpvar_35;
  tmpvar_35 = max (0.0, dot (lightDir_7, tmpvar_33));
  mediump float tmpvar_36;
  tmpvar_36 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_37;
  mediump float tmpvar_38;
  tmpvar_38 = max ((10.0 / log2(
    (((1.0 - tmpvar_36) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_37 = (tmpvar_38 * tmpvar_38);
  mediump vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_37 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_30, tmpvar_33)), tmpvar_37)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_35 * tmpvar_35)
       * gbuffer1_3.w) + (tmpvar_36 * tmpvar_36))) * tmpvar_35)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_30, lightDir_7)));
  mediump vec4 tmpvar_40;
  tmpvar_40 = exp2(-(tmpvar_39));
  tmpvar_1 = tmpvar_40;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
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
#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = (_LightPos.xyz - tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(tmpvar_12);
  lightDir_7 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_10;
  highp vec4 tmpvar_15;
  tmpvar_15 = (_LightMatrix0 * tmpvar_14);
  lowp float tmpvar_16;
  tmpvar_16 = texture2DProj (_LightTexture0, tmpvar_15).w;
  atten_6 = tmpvar_16;
  atten_6 = (atten_6 * float((tmpvar_15.w < 0.0)));
  highp float tmpvar_17;
  tmpvar_17 = (dot (tmpvar_12, tmpvar_12) * _LightPos.w);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_LightTextureB0, vec2(tmpvar_17));
  atten_6 = (atten_6 * tmpvar_18.w);
  mediump float tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_10;
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_World2Shadow[0] * tmpvar_20);
  lowp float tmpvar_22;
  mediump float shadow_23;
  lowp float tmpvar_24;
  tmpvar_24 = shadow2DProjEXT (_ShadowMapTexture, tmpvar_21);
  mediump float tmpvar_25;
  tmpvar_25 = tmpvar_24;
  shadow_23 = (_LightShadowData.x + (tmpvar_25 * (1.0 - _LightShadowData.x)));
  tmpvar_22 = shadow_23;
  highp float tmpvar_26;
  tmpvar_26 = clamp ((tmpvar_22 + clamp (
    ((mix (tmpvar_9.z, sqrt(
      dot (tmpvar_11, tmpvar_11)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_19 = tmpvar_26;
  atten_6 = (atten_6 * tmpvar_19);
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_29;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_30;
  tmpvar_30 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_31;
  tmpvar_31 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_32;
  viewDir_32 = -(tmpvar_31);
  mediump vec3 tmpvar_33;
  mediump vec3 inVec_34;
  inVec_34 = (lightDir_7 + viewDir_32);
  tmpvar_33 = (inVec_34 * inversesqrt(max (0.001, 
    dot (inVec_34, inVec_34)
  )));
  mediump float tmpvar_35;
  tmpvar_35 = max (0.0, dot (lightDir_7, tmpvar_33));
  mediump float tmpvar_36;
  tmpvar_36 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_37;
  mediump float tmpvar_38;
  tmpvar_38 = max ((10.0 / log2(
    (((1.0 - tmpvar_36) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_37 = (tmpvar_38 * tmpvar_38);
  mediump vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_37 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_30, tmpvar_33)), tmpvar_37)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_35 * tmpvar_35)
       * gbuffer1_3.w) + (tmpvar_36 * tmpvar_36))) * tmpvar_35)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_30, lightDir_7)));
  mediump vec4 tmpvar_40;
  tmpvar_40 = exp2(-(tmpvar_39));
  tmpvar_1 = tmpvar_40;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(_LightDir.xyz);
  lightDir_7 = tmpvar_12;
  mediump float tmpvar_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_8);
  highp float tmpvar_15;
  tmpvar_15 = clamp ((tmpvar_14.x + clamp (
    ((mix (tmpvar_9.z, sqrt(
      dot (tmpvar_11, tmpvar_11)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_13 = tmpvar_15;
  atten_6 = tmpvar_13;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_18;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_19;
  tmpvar_19 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_21;
  viewDir_21 = -(tmpvar_20);
  mediump vec3 tmpvar_22;
  mediump vec3 inVec_23;
  inVec_23 = (lightDir_7 + viewDir_21);
  tmpvar_22 = (inVec_23 * inversesqrt(max (0.001, 
    dot (inVec_23, inVec_23)
  )));
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (lightDir_7, tmpvar_22));
  mediump float tmpvar_25;
  tmpvar_25 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = max ((10.0 / log2(
    (((1.0 - tmpvar_25) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_26 = (tmpvar_27 * tmpvar_27);
  mediump vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_26 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_19, tmpvar_22)), tmpvar_26)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_24 * tmpvar_24)
       * gbuffer1_3.w) + (tmpvar_25 * tmpvar_25))) * tmpvar_24)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_19, lightDir_7)));
  mediump vec4 tmpvar_29;
  tmpvar_29 = exp2(-(tmpvar_28));
  tmpvar_1 = tmpvar_29;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTexture0;
uniform sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(_LightDir.xyz);
  lightDir_7 = tmpvar_12;
  mediump float tmpvar_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_8);
  highp float tmpvar_15;
  tmpvar_15 = clamp ((tmpvar_14.x + clamp (
    ((mix (tmpvar_9.z, sqrt(
      dot (tmpvar_11, tmpvar_11)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_13 = tmpvar_15;
  atten_6 = tmpvar_13;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_10;
  lowp vec4 tmpvar_17;
  highp vec2 P_18;
  P_18 = (_LightMatrix0 * tmpvar_16).xy;
  tmpvar_17 = texture2D (_LightTexture0, P_18);
  atten_6 = (atten_6 * tmpvar_17.w);
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_21;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_24;
  viewDir_24 = -(tmpvar_23);
  mediump vec3 tmpvar_25;
  mediump vec3 inVec_26;
  inVec_26 = (lightDir_7 + viewDir_24);
  tmpvar_25 = (inVec_26 * inversesqrt(max (0.001, 
    dot (inVec_26, inVec_26)
  )));
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, dot (lightDir_7, tmpvar_25));
  mediump float tmpvar_28;
  tmpvar_28 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = max ((10.0 / log2(
    (((1.0 - tmpvar_28) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_29 = (tmpvar_30 * tmpvar_30);
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_29 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_22, tmpvar_25)), tmpvar_29)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_27 * tmpvar_27)
       * gbuffer1_3.w) + (tmpvar_28 * tmpvar_28))) * tmpvar_27)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_22, lightDir_7)));
  mediump vec4 tmpvar_32;
  tmpvar_32 = exp2(-(tmpvar_31));
  tmpvar_1 = tmpvar_32;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _LightTextureB0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - _LightPos.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(normalize(tmpvar_11));
  lightDir_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13)).w;
  atten_6 = tmpvar_14;
  highp float mydist_15;
  mydist_15 = ((sqrt(
    dot (tmpvar_11, tmpvar_11)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_16;
  tmpvar_16 = dot (textureCube (_ShadowMapTexture, tmpvar_11), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_17;
  if ((tmpvar_16 < mydist_15)) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  atten_6 = (atten_6 * tmpvar_17);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_20;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_23;
  viewDir_23 = -(tmpvar_22);
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (lightDir_7 + viewDir_23);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, dot (lightDir_7, tmpvar_24));
  mediump float tmpvar_27;
  tmpvar_27 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = max ((10.0 / log2(
    (((1.0 - tmpvar_27) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_28 = (tmpvar_29 * tmpvar_29);
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_28 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_21, tmpvar_24)), tmpvar_28)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_26 * tmpvar_26)
       * gbuffer1_3.w) + (tmpvar_27 * tmpvar_27))) * tmpvar_26)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_21, lightDir_7)));
  mediump vec4 tmpvar_31;
  tmpvar_31 = exp2(-(tmpvar_30));
  tmpvar_1 = tmpvar_31;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - _LightPos.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(normalize(tmpvar_11));
  lightDir_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13)).w;
  atten_6 = tmpvar_14;
  highp float mydist_15;
  mydist_15 = ((sqrt(
    dot (tmpvar_11, tmpvar_11)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_16;
  tmpvar_16 = dot (textureCube (_ShadowMapTexture, tmpvar_11), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_17;
  if ((tmpvar_16 < mydist_15)) {
    tmpvar_17 = _LightShadowData.x;
  } else {
    tmpvar_17 = 1.0;
  };
  atten_6 = (atten_6 * tmpvar_17);
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = tmpvar_10;
  lowp vec4 tmpvar_19;
  highp vec3 P_20;
  P_20 = (_LightMatrix0 * tmpvar_18).xyz;
  tmpvar_19 = textureCube (_LightTexture0, P_20);
  atten_6 = (atten_6 * tmpvar_19.w);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_22;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_23;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_26;
  viewDir_26 = -(tmpvar_25);
  mediump vec3 tmpvar_27;
  mediump vec3 inVec_28;
  inVec_28 = (lightDir_7 + viewDir_26);
  tmpvar_27 = (inVec_28 * inversesqrt(max (0.001, 
    dot (inVec_28, inVec_28)
  )));
  mediump float tmpvar_29;
  tmpvar_29 = max (0.0, dot (lightDir_7, tmpvar_27));
  mediump float tmpvar_30;
  tmpvar_30 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_31;
  mediump float tmpvar_32;
  tmpvar_32 = max ((10.0 / log2(
    (((1.0 - tmpvar_30) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_31 = (tmpvar_32 * tmpvar_32);
  mediump vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_31 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_24, tmpvar_27)), tmpvar_31)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_29 * tmpvar_29)
       * gbuffer1_3.w) + (tmpvar_30 * tmpvar_30))) * tmpvar_29)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_24, lightDir_7)));
  mediump vec4 tmpvar_34;
  tmpvar_34 = exp2(-(tmpvar_33));
  tmpvar_1 = tmpvar_34;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NONATIVE" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = (_LightPos.xyz - tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(tmpvar_12);
  lightDir_7 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_10;
  highp vec4 tmpvar_15;
  tmpvar_15 = (_LightMatrix0 * tmpvar_14);
  lowp float tmpvar_16;
  tmpvar_16 = texture2DProj (_LightTexture0, tmpvar_15).w;
  atten_6 = tmpvar_16;
  atten_6 = (atten_6 * float((tmpvar_15.w < 0.0)));
  highp float tmpvar_17;
  tmpvar_17 = (dot (tmpvar_12, tmpvar_12) * _LightPos.w);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_LightTextureB0, vec2(tmpvar_17));
  atten_6 = (atten_6 * tmpvar_18.w);
  mediump float tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = clamp (((
    mix (tmpvar_9.z, sqrt(dot (tmpvar_11, tmpvar_11)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_10;
  highp vec4 tmpvar_22;
  tmpvar_22 = (unity_World2Shadow[0] * tmpvar_21);
  lowp float tmpvar_23;
  highp vec4 shadowVals_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (tmpvar_22.xyz / tmpvar_22.w);
  shadowVals_24.x = texture2D (_ShadowMapTexture, (tmpvar_25.xy + _ShadowOffsets[0].xy)).x;
  shadowVals_24.y = texture2D (_ShadowMapTexture, (tmpvar_25.xy + _ShadowOffsets[1].xy)).x;
  shadowVals_24.z = texture2D (_ShadowMapTexture, (tmpvar_25.xy + _ShadowOffsets[2].xy)).x;
  shadowVals_24.w = texture2D (_ShadowMapTexture, (tmpvar_25.xy + _ShadowOffsets[3].xy)).x;
  bvec4 tmpvar_26;
  tmpvar_26 = lessThan (shadowVals_24, tmpvar_25.zzzz);
  mediump vec4 tmpvar_27;
  tmpvar_27 = _LightShadowData.xxxx;
  mediump float tmpvar_28;
  if (tmpvar_26.x) {
    tmpvar_28 = tmpvar_27.x;
  } else {
    tmpvar_28 = 1.0;
  };
  mediump float tmpvar_29;
  if (tmpvar_26.y) {
    tmpvar_29 = tmpvar_27.y;
  } else {
    tmpvar_29 = 1.0;
  };
  mediump float tmpvar_30;
  if (tmpvar_26.z) {
    tmpvar_30 = tmpvar_27.z;
  } else {
    tmpvar_30 = 1.0;
  };
  mediump float tmpvar_31;
  if (tmpvar_26.w) {
    tmpvar_31 = tmpvar_27.w;
  } else {
    tmpvar_31 = 1.0;
  };
  mediump vec4 tmpvar_32;
  tmpvar_32.x = tmpvar_28;
  tmpvar_32.y = tmpvar_29;
  tmpvar_32.z = tmpvar_30;
  tmpvar_32.w = tmpvar_31;
  mediump float tmpvar_33;
  tmpvar_33 = dot (tmpvar_32, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_23 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = clamp ((tmpvar_23 + tmpvar_20), 0.0, 1.0);
  tmpvar_19 = tmpvar_34;
  atten_6 = (atten_6 * tmpvar_19);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_36;
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_37;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_38;
  tmpvar_38 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_40;
  viewDir_40 = -(tmpvar_39);
  mediump vec3 tmpvar_41;
  mediump vec3 inVec_42;
  inVec_42 = (lightDir_7 + viewDir_40);
  tmpvar_41 = (inVec_42 * inversesqrt(max (0.001, 
    dot (inVec_42, inVec_42)
  )));
  mediump float tmpvar_43;
  tmpvar_43 = max (0.0, dot (lightDir_7, tmpvar_41));
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_45;
  mediump float tmpvar_46;
  tmpvar_46 = max ((10.0 / log2(
    (((1.0 - tmpvar_44) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_45 = (tmpvar_46 * tmpvar_46);
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_45 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_38, tmpvar_41)), tmpvar_45)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_43 * tmpvar_43)
       * gbuffer1_3.w) + (tmpvar_44 * tmpvar_44))) * tmpvar_43)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_38, lightDir_7)));
  mediump vec4 tmpvar_48;
  tmpvar_48 = exp2(-(tmpvar_47));
  tmpvar_1 = tmpvar_48;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
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
#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = (_LightPos.xyz - tmpvar_10);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(tmpvar_12);
  lightDir_7 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_10;
  highp vec4 tmpvar_15;
  tmpvar_15 = (_LightMatrix0 * tmpvar_14);
  lowp float tmpvar_16;
  tmpvar_16 = texture2DProj (_LightTexture0, tmpvar_15).w;
  atten_6 = tmpvar_16;
  atten_6 = (atten_6 * float((tmpvar_15.w < 0.0)));
  highp float tmpvar_17;
  tmpvar_17 = (dot (tmpvar_12, tmpvar_12) * _LightPos.w);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_LightTextureB0, vec2(tmpvar_17));
  atten_6 = (atten_6 * tmpvar_18.w);
  mediump float tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_10;
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_World2Shadow[0] * tmpvar_20);
  lowp float tmpvar_22;
  mediump vec4 shadows_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (tmpvar_21.xyz / tmpvar_21.w);
  highp vec3 coord_25;
  coord_25 = (tmpvar_24 + _ShadowOffsets[0].xyz);
  lowp float tmpvar_26;
  tmpvar_26 = shadow2DEXT (_ShadowMapTexture, coord_25);
  shadows_23.x = tmpvar_26;
  highp vec3 coord_27;
  coord_27 = (tmpvar_24 + _ShadowOffsets[1].xyz);
  lowp float tmpvar_28;
  tmpvar_28 = shadow2DEXT (_ShadowMapTexture, coord_27);
  shadows_23.y = tmpvar_28;
  highp vec3 coord_29;
  coord_29 = (tmpvar_24 + _ShadowOffsets[2].xyz);
  lowp float tmpvar_30;
  tmpvar_30 = shadow2DEXT (_ShadowMapTexture, coord_29);
  shadows_23.z = tmpvar_30;
  highp vec3 coord_31;
  coord_31 = (tmpvar_24 + _ShadowOffsets[3].xyz);
  lowp float tmpvar_32;
  tmpvar_32 = shadow2DEXT (_ShadowMapTexture, coord_31);
  shadows_23.w = tmpvar_32;
  shadows_23 = (_LightShadowData.xxxx + (shadows_23 * (1.0 - _LightShadowData.xxxx)));
  mediump float tmpvar_33;
  tmpvar_33 = dot (shadows_23, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_22 = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = clamp ((tmpvar_22 + clamp (
    ((mix (tmpvar_9.z, sqrt(
      dot (tmpvar_11, tmpvar_11)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_19 = tmpvar_34;
  atten_6 = (atten_6 * tmpvar_19);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_36;
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_37;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_38;
  tmpvar_38 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_40;
  viewDir_40 = -(tmpvar_39);
  mediump vec3 tmpvar_41;
  mediump vec3 inVec_42;
  inVec_42 = (lightDir_7 + viewDir_40);
  tmpvar_41 = (inVec_42 * inversesqrt(max (0.001, 
    dot (inVec_42, inVec_42)
  )));
  mediump float tmpvar_43;
  tmpvar_43 = max (0.0, dot (lightDir_7, tmpvar_41));
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_45;
  mediump float tmpvar_46;
  tmpvar_46 = max ((10.0 / log2(
    (((1.0 - tmpvar_44) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_45 = (tmpvar_46 * tmpvar_46);
  mediump vec4 tmpvar_47;
  tmpvar_47.w = 1.0;
  tmpvar_47.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_45 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_38, tmpvar_41)), tmpvar_45)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_43 * tmpvar_43)
       * gbuffer1_3.w) + (tmpvar_44 * tmpvar_44))) * tmpvar_43)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_38, lightDir_7)));
  mediump vec4 tmpvar_48;
  tmpvar_48 = exp2(-(tmpvar_47));
  tmpvar_1 = tmpvar_48;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _LightTextureB0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - _LightPos.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(normalize(tmpvar_11));
  lightDir_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13)).w;
  atten_6 = tmpvar_14;
  highp vec4 shadowVals_15;
  highp float mydist_16;
  mydist_16 = ((sqrt(
    dot (tmpvar_11, tmpvar_11)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_15.x = dot (textureCube (_ShadowMapTexture, (tmpvar_11 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_15.y = dot (textureCube (_ShadowMapTexture, (tmpvar_11 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_15.z = dot (textureCube (_ShadowMapTexture, (tmpvar_11 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_15.w = dot (textureCube (_ShadowMapTexture, (tmpvar_11 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_17;
  tmpvar_17 = lessThan (shadowVals_15, vec4(mydist_16));
  mediump vec4 tmpvar_18;
  tmpvar_18 = _LightShadowData.xxxx;
  mediump float tmpvar_19;
  if (tmpvar_17.x) {
    tmpvar_19 = tmpvar_18.x;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  if (tmpvar_17.y) {
    tmpvar_20 = tmpvar_18.y;
  } else {
    tmpvar_20 = 1.0;
  };
  mediump float tmpvar_21;
  if (tmpvar_17.z) {
    tmpvar_21 = tmpvar_18.z;
  } else {
    tmpvar_21 = 1.0;
  };
  mediump float tmpvar_22;
  if (tmpvar_17.w) {
    tmpvar_22 = tmpvar_18.w;
  } else {
    tmpvar_22 = 1.0;
  };
  mediump vec4 tmpvar_23;
  tmpvar_23.x = tmpvar_19;
  tmpvar_23.y = tmpvar_20;
  tmpvar_23.z = tmpvar_21;
  tmpvar_23.w = tmpvar_22;
  mediump float tmpvar_24;
  tmpvar_24 = dot (tmpvar_23, vec4(0.25, 0.25, 0.25, 0.25));
  atten_6 = (atten_6 * tmpvar_24);
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_27;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_28;
  tmpvar_28 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_29;
  tmpvar_29 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_30;
  viewDir_30 = -(tmpvar_29);
  mediump vec3 tmpvar_31;
  mediump vec3 inVec_32;
  inVec_32 = (lightDir_7 + viewDir_30);
  tmpvar_31 = (inVec_32 * inversesqrt(max (0.001, 
    dot (inVec_32, inVec_32)
  )));
  mediump float tmpvar_33;
  tmpvar_33 = max (0.0, dot (lightDir_7, tmpvar_31));
  mediump float tmpvar_34;
  tmpvar_34 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_35;
  mediump float tmpvar_36;
  tmpvar_36 = max ((10.0 / log2(
    (((1.0 - tmpvar_34) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_35 = (tmpvar_36 * tmpvar_36);
  mediump vec4 tmpvar_37;
  tmpvar_37.w = 1.0;
  tmpvar_37.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_35 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_28, tmpvar_31)), tmpvar_35)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_33 * tmpvar_33)
       * gbuffer1_3.w) + (tmpvar_34 * tmpvar_34))) * tmpvar_33)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_28, lightDir_7)));
  mediump vec4 tmpvar_38;
  tmpvar_38 = exp2(-(tmpvar_37));
  tmpvar_1 = tmpvar_38;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - _LightPos.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(normalize(tmpvar_11));
  lightDir_7 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp float tmpvar_14;
  tmpvar_14 = texture2D (_LightTextureB0, vec2(tmpvar_13)).w;
  atten_6 = tmpvar_14;
  highp vec4 shadowVals_15;
  highp float mydist_16;
  mydist_16 = ((sqrt(
    dot (tmpvar_11, tmpvar_11)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_15.x = dot (textureCube (_ShadowMapTexture, (tmpvar_11 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_15.y = dot (textureCube (_ShadowMapTexture, (tmpvar_11 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_15.z = dot (textureCube (_ShadowMapTexture, (tmpvar_11 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_15.w = dot (textureCube (_ShadowMapTexture, (tmpvar_11 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_17;
  tmpvar_17 = lessThan (shadowVals_15, vec4(mydist_16));
  mediump vec4 tmpvar_18;
  tmpvar_18 = _LightShadowData.xxxx;
  mediump float tmpvar_19;
  if (tmpvar_17.x) {
    tmpvar_19 = tmpvar_18.x;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  if (tmpvar_17.y) {
    tmpvar_20 = tmpvar_18.y;
  } else {
    tmpvar_20 = 1.0;
  };
  mediump float tmpvar_21;
  if (tmpvar_17.z) {
    tmpvar_21 = tmpvar_18.z;
  } else {
    tmpvar_21 = 1.0;
  };
  mediump float tmpvar_22;
  if (tmpvar_17.w) {
    tmpvar_22 = tmpvar_18.w;
  } else {
    tmpvar_22 = 1.0;
  };
  mediump vec4 tmpvar_23;
  tmpvar_23.x = tmpvar_19;
  tmpvar_23.y = tmpvar_20;
  tmpvar_23.z = tmpvar_21;
  tmpvar_23.w = tmpvar_22;
  mediump float tmpvar_24;
  tmpvar_24 = dot (tmpvar_23, vec4(0.25, 0.25, 0.25, 0.25));
  atten_6 = (atten_6 * tmpvar_24);
  highp vec4 tmpvar_25;
  tmpvar_25.w = 1.0;
  tmpvar_25.xyz = tmpvar_10;
  lowp vec4 tmpvar_26;
  highp vec3 P_27;
  P_27 = (_LightMatrix0 * tmpvar_25).xyz;
  tmpvar_26 = textureCube (_LightTexture0, P_27);
  atten_6 = (atten_6 * tmpvar_26.w);
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_29;
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_30;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_31;
  tmpvar_31 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_32;
  tmpvar_32 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_33;
  viewDir_33 = -(tmpvar_32);
  mediump vec3 tmpvar_34;
  mediump vec3 inVec_35;
  inVec_35 = (lightDir_7 + viewDir_33);
  tmpvar_34 = (inVec_35 * inversesqrt(max (0.001, 
    dot (inVec_35, inVec_35)
  )));
  mediump float tmpvar_36;
  tmpvar_36 = max (0.0, dot (lightDir_7, tmpvar_34));
  mediump float tmpvar_37;
  tmpvar_37 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_38;
  mediump float tmpvar_39;
  tmpvar_39 = max ((10.0 / log2(
    (((1.0 - tmpvar_37) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_38 = (tmpvar_39 * tmpvar_39);
  mediump vec4 tmpvar_40;
  tmpvar_40.w = 1.0;
  tmpvar_40.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_38 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_31, tmpvar_34)), tmpvar_38)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_36 * tmpvar_36)
       * gbuffer1_3.w) + (tmpvar_37 * tmpvar_37))) * tmpvar_36)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_31, lightDir_7)));
  mediump vec4 tmpvar_41;
  tmpvar_41 = exp2(-(tmpvar_40));
  tmpvar_1 = tmpvar_41;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(_LightDir.xyz);
  lightDir_7 = tmpvar_12;
  mediump float tmpvar_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_8);
  highp float tmpvar_15;
  tmpvar_15 = clamp ((tmpvar_14.x + clamp (
    ((mix (tmpvar_9.z, sqrt(
      dot (tmpvar_11, tmpvar_11)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_13 = tmpvar_15;
  atten_6 = tmpvar_13;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_18;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_19;
  tmpvar_19 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_20;
  tmpvar_20 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_21;
  viewDir_21 = -(tmpvar_20);
  mediump vec3 tmpvar_22;
  mediump vec3 inVec_23;
  inVec_23 = (lightDir_7 + viewDir_21);
  tmpvar_22 = (inVec_23 * inversesqrt(max (0.001, 
    dot (inVec_23, inVec_23)
  )));
  mediump float tmpvar_24;
  tmpvar_24 = max (0.0, dot (lightDir_7, tmpvar_22));
  mediump float tmpvar_25;
  tmpvar_25 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = max ((10.0 / log2(
    (((1.0 - tmpvar_25) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_26 = (tmpvar_27 * tmpvar_27);
  mediump vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_26 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_19, tmpvar_22)), tmpvar_26)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_24 * tmpvar_24)
       * gbuffer1_3.w) + (tmpvar_25 * tmpvar_25))) * tmpvar_24)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_19, lightDir_7)));
  mediump vec4 tmpvar_29;
  tmpvar_29 = exp2(-(tmpvar_28));
  tmpvar_1 = tmpvar_29;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "SHADOWS_NATIVE" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTexture0;
uniform sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 gbuffer2_2;
  mediump vec4 gbuffer1_3;
  mediump vec4 gbuffer0_4;
  mediump vec3 tmpvar_5;
  highp float atten_6;
  mediump vec3 lightDir_7;
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_8).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_10;
  tmpvar_10 = (_CameraToWorld * tmpvar_9).xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_12;
  tmpvar_12 = -(_LightDir.xyz);
  lightDir_7 = tmpvar_12;
  mediump float tmpvar_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_ShadowMapTexture, tmpvar_8);
  highp float tmpvar_15;
  tmpvar_15 = clamp ((tmpvar_14.x + clamp (
    ((mix (tmpvar_9.z, sqrt(
      dot (tmpvar_11, tmpvar_11)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_13 = tmpvar_15;
  atten_6 = tmpvar_13;
  highp vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = tmpvar_10;
  lowp vec4 tmpvar_17;
  highp vec2 P_18;
  P_18 = (_LightMatrix0 * tmpvar_16).xy;
  tmpvar_17 = texture2D (_LightTexture0, P_18);
  atten_6 = (atten_6 * tmpvar_17.w);
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture0, tmpvar_8);
  gbuffer0_4 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_CameraGBufferTexture1, tmpvar_8);
  gbuffer1_3 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_CameraGBufferTexture2, tmpvar_8);
  gbuffer2_2 = tmpvar_21;
  tmpvar_5 = (_LightColor.xyz * atten_6);
  mediump vec3 tmpvar_22;
  tmpvar_22 = normalize(((gbuffer2_2.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_10 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_24;
  viewDir_24 = -(tmpvar_23);
  mediump vec3 tmpvar_25;
  mediump vec3 inVec_26;
  inVec_26 = (lightDir_7 + viewDir_24);
  tmpvar_25 = (inVec_26 * inversesqrt(max (0.001, 
    dot (inVec_26, inVec_26)
  )));
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, dot (lightDir_7, tmpvar_25));
  mediump float tmpvar_28;
  tmpvar_28 = (1.0 - gbuffer1_3.w);
  mediump float tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = max ((10.0 / log2(
    (((1.0 - tmpvar_28) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_29 = (tmpvar_30 * tmpvar_30);
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((gbuffer0_4.xyz + 
    (clamp (((
      (tmpvar_29 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_22, tmpvar_25)), tmpvar_29)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_27 * tmpvar_27)
       * gbuffer1_3.w) + (tmpvar_28 * tmpvar_28))) * tmpvar_27)
     + 0.0001)), 0.0, 100.0) * gbuffer1_3.xyz)
  ) * tmpvar_5) * max (0.0, dot (tmpvar_22, lightDir_7)));
  mediump vec4 tmpvar_32;
  tmpvar_32 = exp2(-(tmpvar_31));
  tmpvar_1 = tmpvar_32;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _LightTextureB0;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - _LightPos.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(normalize(tmpvar_10));
  lightDir_6 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (dot (tmpvar_10, tmpvar_10) * _LightPos.w);
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12)).w;
  atten_5 = tmpvar_13;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_16;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_19;
  viewDir_19 = -(tmpvar_18);
  mediump vec3 tmpvar_20;
  mediump vec3 inVec_21;
  inVec_21 = (lightDir_6 + viewDir_19);
  tmpvar_20 = (inVec_21 * inversesqrt(max (0.001, 
    dot (inVec_21, inVec_21)
  )));
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (lightDir_6, tmpvar_20));
  mediump float tmpvar_23;
  tmpvar_23 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = max ((10.0 / log2(
    (((1.0 - tmpvar_23) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_24 = (tmpvar_25 * tmpvar_25);
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_24 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_17, tmpvar_20)), tmpvar_24)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_22 * tmpvar_22)
       * gbuffer1_2.w) + (tmpvar_23 * tmpvar_23))) * tmpvar_22)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_17, lightDir_6)));
  gl_FragData[0] = tmpvar_26;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  mediump vec3 lightDir_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_6).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_8;
  tmpvar_8 = -(_LightDir.xyz);
  lightDir_5 = tmpvar_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_CameraGBufferTexture0, tmpvar_6);
  gbuffer0_3 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_CameraGBufferTexture1, tmpvar_6);
  gbuffer1_2 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_CameraGBufferTexture2, tmpvar_6);
  gbuffer2_1 = tmpvar_11;
  tmpvar_4 = _LightColor.xyz;
  mediump vec3 tmpvar_12;
  tmpvar_12 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize(((_CameraToWorld * tmpvar_7).xyz - _WorldSpaceCameraPos));
  mediump vec3 viewDir_14;
  viewDir_14 = -(tmpvar_13);
  mediump vec3 tmpvar_15;
  mediump vec3 inVec_16;
  inVec_16 = (lightDir_5 + viewDir_14);
  tmpvar_15 = (inVec_16 * inversesqrt(max (0.001, 
    dot (inVec_16, inVec_16)
  )));
  mediump float tmpvar_17;
  tmpvar_17 = max (0.0, dot (lightDir_5, tmpvar_15));
  mediump float tmpvar_18;
  tmpvar_18 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_19;
  mediump float tmpvar_20;
  tmpvar_20 = max ((10.0 / log2(
    (((1.0 - tmpvar_18) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_19 = (tmpvar_20 * tmpvar_20);
  mediump vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_19 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_12, tmpvar_15)), tmpvar_19)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_17 * tmpvar_17)
       * gbuffer1_2.w) + (tmpvar_18 * tmpvar_18))) * tmpvar_17)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_12, lightDir_5)));
  gl_FragData[0] = tmpvar_21;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (_LightPos.xyz - tmpvar_9);
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(tmpvar_10);
  lightDir_6 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_9;
  highp vec4 tmpvar_13;
  tmpvar_13 = (_LightMatrix0 * tmpvar_12);
  lowp float tmpvar_14;
  tmpvar_14 = texture2DProj (_LightTexture0, tmpvar_13).w;
  atten_5 = tmpvar_14;
  atten_5 = (atten_5 * float((tmpvar_13.w < 0.0)));
  highp float tmpvar_15;
  tmpvar_15 = (dot (tmpvar_10, tmpvar_10) * _LightPos.w);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_LightTextureB0, vec2(tmpvar_15));
  atten_5 = (atten_5 * tmpvar_16.w);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_19;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_21);
  mediump vec3 tmpvar_23;
  mediump vec3 inVec_24;
  inVec_24 = (lightDir_6 + viewDir_22);
  tmpvar_23 = (inVec_24 * inversesqrt(max (0.001, 
    dot (inVec_24, inVec_24)
  )));
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (lightDir_6, tmpvar_23));
  mediump float tmpvar_26;
  tmpvar_26 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = max ((10.0 / log2(
    (((1.0 - tmpvar_26) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_27 = (tmpvar_28 * tmpvar_28);
  mediump vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_27 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_20, tmpvar_23)), tmpvar_27)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_25 * tmpvar_25)
       * gbuffer1_2.w) + (tmpvar_26 * tmpvar_26))) * tmpvar_25)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_20, lightDir_6)));
  gl_FragData[0] = tmpvar_29;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - _LightPos.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(normalize(tmpvar_10));
  lightDir_6 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (dot (tmpvar_10, tmpvar_10) * _LightPos.w);
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12)).w;
  atten_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  lowp vec4 tmpvar_15;
  highp vec3 P_16;
  P_16 = (_LightMatrix0 * tmpvar_14).xyz;
  tmpvar_15 = textureCube (_LightTexture0, P_16);
  atten_5 = (atten_5 * tmpvar_15.w);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_19;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_21);
  mediump vec3 tmpvar_23;
  mediump vec3 inVec_24;
  inVec_24 = (lightDir_6 + viewDir_22);
  tmpvar_23 = (inVec_24 * inversesqrt(max (0.001, 
    dot (inVec_24, inVec_24)
  )));
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (lightDir_6, tmpvar_23));
  mediump float tmpvar_26;
  tmpvar_26 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = max ((10.0 / log2(
    (((1.0 - tmpvar_26) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_27 = (tmpvar_28 * tmpvar_28);
  mediump vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_27 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_20, tmpvar_23)), tmpvar_27)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_25 * tmpvar_25)
       * gbuffer1_2.w) + (tmpvar_26 * tmpvar_26))) * tmpvar_25)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_20, lightDir_6)));
  gl_FragData[0] = tmpvar_29;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTexture0;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = -(_LightDir.xyz);
  lightDir_6 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_9;
  lowp vec4 tmpvar_12;
  highp vec2 P_13;
  P_13 = (_LightMatrix0 * tmpvar_11).xy;
  tmpvar_12 = texture2D (_LightTexture0, P_13);
  atten_5 = tmpvar_12.w;
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_16;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_17;
  tmpvar_17 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_19;
  viewDir_19 = -(tmpvar_18);
  mediump vec3 tmpvar_20;
  mediump vec3 inVec_21;
  inVec_21 = (lightDir_6 + viewDir_19);
  tmpvar_20 = (inVec_21 * inversesqrt(max (0.001, 
    dot (inVec_21, inVec_21)
  )));
  mediump float tmpvar_22;
  tmpvar_22 = max (0.0, dot (lightDir_6, tmpvar_20));
  mediump float tmpvar_23;
  tmpvar_23 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_24;
  mediump float tmpvar_25;
  tmpvar_25 = max ((10.0 / log2(
    (((1.0 - tmpvar_23) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_24 = (tmpvar_25 * tmpvar_25);
  mediump vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_24 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_17, tmpvar_20)), tmpvar_24)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_22 * tmpvar_22)
       * gbuffer1_2.w) + (tmpvar_23 * tmpvar_23))) * tmpvar_22)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_17, lightDir_6)));
  gl_FragData[0] = tmpvar_26;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_HDR_ON" "SHADOWS_NONATIVE" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform highp sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = (_LightPos.xyz - tmpvar_9);
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_11);
  lightDir_6 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_9;
  highp vec4 tmpvar_14;
  tmpvar_14 = (_LightMatrix0 * tmpvar_13);
  lowp float tmpvar_15;
  tmpvar_15 = texture2DProj (_LightTexture0, tmpvar_14).w;
  atten_5 = tmpvar_15;
  atten_5 = (atten_5 * float((tmpvar_14.w < 0.0)));
  highp float tmpvar_16;
  tmpvar_16 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_LightTextureB0, vec2(tmpvar_16));
  atten_5 = (atten_5 * tmpvar_17.w);
  mediump float tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = clamp (((
    mix (tmpvar_8.z, sqrt(dot (tmpvar_10, tmpvar_10)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_9;
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_World2Shadow[0] * tmpvar_20);
  lowp float tmpvar_22;
  highp vec4 tmpvar_23;
  tmpvar_23 = texture2DProj (_ShadowMapTexture, tmpvar_21);
  mediump float tmpvar_24;
  if ((tmpvar_23.x < (tmpvar_21.z / tmpvar_21.w))) {
    tmpvar_24 = _LightShadowData.x;
  } else {
    tmpvar_24 = 1.0;
  };
  tmpvar_22 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = clamp ((tmpvar_22 + tmpvar_19), 0.0, 1.0);
  tmpvar_18 = tmpvar_25;
  atten_5 = (atten_5 * tmpvar_18);
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_28;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_29;
  tmpvar_29 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_30;
  tmpvar_30 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_31;
  viewDir_31 = -(tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump vec3 inVec_33;
  inVec_33 = (lightDir_6 + viewDir_31);
  tmpvar_32 = (inVec_33 * inversesqrt(max (0.001, 
    dot (inVec_33, inVec_33)
  )));
  mediump float tmpvar_34;
  tmpvar_34 = max (0.0, dot (lightDir_6, tmpvar_32));
  mediump float tmpvar_35;
  tmpvar_35 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_36;
  mediump float tmpvar_37;
  tmpvar_37 = max ((10.0 / log2(
    (((1.0 - tmpvar_35) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_36 = (tmpvar_37 * tmpvar_37);
  mediump vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_36 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_29, tmpvar_32)), tmpvar_36)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_34 * tmpvar_34)
       * gbuffer1_2.w) + (tmpvar_35 * tmpvar_35))) * tmpvar_34)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_29, lightDir_6)));
  gl_FragData[0] = tmpvar_38;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" "UNITY_HDR_ON" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
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
#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = (_LightPos.xyz - tmpvar_9);
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_11);
  lightDir_6 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_9;
  highp vec4 tmpvar_14;
  tmpvar_14 = (_LightMatrix0 * tmpvar_13);
  lowp float tmpvar_15;
  tmpvar_15 = texture2DProj (_LightTexture0, tmpvar_14).w;
  atten_5 = tmpvar_15;
  atten_5 = (atten_5 * float((tmpvar_14.w < 0.0)));
  highp float tmpvar_16;
  tmpvar_16 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_LightTextureB0, vec2(tmpvar_16));
  atten_5 = (atten_5 * tmpvar_17.w);
  mediump float tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_9;
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_World2Shadow[0] * tmpvar_19);
  lowp float tmpvar_21;
  mediump float shadow_22;
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DProjEXT (_ShadowMapTexture, tmpvar_20);
  mediump float tmpvar_24;
  tmpvar_24 = tmpvar_23;
  shadow_22 = (_LightShadowData.x + (tmpvar_24 * (1.0 - _LightShadowData.x)));
  tmpvar_21 = shadow_22;
  highp float tmpvar_25;
  tmpvar_25 = clamp ((tmpvar_21 + clamp (
    ((mix (tmpvar_8.z, sqrt(
      dot (tmpvar_10, tmpvar_10)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_18 = tmpvar_25;
  atten_5 = (atten_5 * tmpvar_18);
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_26;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_28;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_29;
  tmpvar_29 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_30;
  tmpvar_30 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_31;
  viewDir_31 = -(tmpvar_30);
  mediump vec3 tmpvar_32;
  mediump vec3 inVec_33;
  inVec_33 = (lightDir_6 + viewDir_31);
  tmpvar_32 = (inVec_33 * inversesqrt(max (0.001, 
    dot (inVec_33, inVec_33)
  )));
  mediump float tmpvar_34;
  tmpvar_34 = max (0.0, dot (lightDir_6, tmpvar_32));
  mediump float tmpvar_35;
  tmpvar_35 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_36;
  mediump float tmpvar_37;
  tmpvar_37 = max ((10.0 / log2(
    (((1.0 - tmpvar_35) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_36 = (tmpvar_37 * tmpvar_37);
  mediump vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_36 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_29, tmpvar_32)), tmpvar_36)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_34 * tmpvar_34)
       * gbuffer1_2.w) + (tmpvar_35 * tmpvar_35))) * tmpvar_34)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_29, lightDir_6)));
  gl_FragData[0] = tmpvar_38;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(_LightDir.xyz);
  lightDir_6 = tmpvar_11;
  mediump float tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_ShadowMapTexture, tmpvar_7);
  highp float tmpvar_14;
  tmpvar_14 = clamp ((tmpvar_13.x + clamp (
    ((mix (tmpvar_8.z, sqrt(
      dot (tmpvar_10, tmpvar_10)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_14;
  atten_5 = tmpvar_12;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_17;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_18;
  tmpvar_18 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_20;
  viewDir_20 = -(tmpvar_19);
  mediump vec3 tmpvar_21;
  mediump vec3 inVec_22;
  inVec_22 = (lightDir_6 + viewDir_20);
  tmpvar_21 = (inVec_22 * inversesqrt(max (0.001, 
    dot (inVec_22, inVec_22)
  )));
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (lightDir_6, tmpvar_21));
  mediump float tmpvar_24;
  tmpvar_24 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max ((10.0 / log2(
    (((1.0 - tmpvar_24) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_25 = (tmpvar_26 * tmpvar_26);
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_25 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_18, tmpvar_21)), tmpvar_25)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_23 * tmpvar_23)
       * gbuffer1_2.w) + (tmpvar_24 * tmpvar_24))) * tmpvar_23)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_18, lightDir_6)));
  gl_FragData[0] = tmpvar_27;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTexture0;
uniform sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(_LightDir.xyz);
  lightDir_6 = tmpvar_11;
  mediump float tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_ShadowMapTexture, tmpvar_7);
  highp float tmpvar_14;
  tmpvar_14 = clamp ((tmpvar_13.x + clamp (
    ((mix (tmpvar_8.z, sqrt(
      dot (tmpvar_10, tmpvar_10)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_14;
  atten_5 = tmpvar_12;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_9;
  lowp vec4 tmpvar_16;
  highp vec2 P_17;
  P_17 = (_LightMatrix0 * tmpvar_15).xy;
  tmpvar_16 = texture2D (_LightTexture0, P_17);
  atten_5 = (atten_5 * tmpvar_16.w);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_20;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_23;
  viewDir_23 = -(tmpvar_22);
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (lightDir_6 + viewDir_23);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, dot (lightDir_6, tmpvar_24));
  mediump float tmpvar_27;
  tmpvar_27 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = max ((10.0 / log2(
    (((1.0 - tmpvar_27) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_28 = (tmpvar_29 * tmpvar_29);
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_28 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_21, tmpvar_24)), tmpvar_28)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_26 * tmpvar_26)
       * gbuffer1_2.w) + (tmpvar_27 * tmpvar_27))) * tmpvar_26)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_21, lightDir_6)));
  gl_FragData[0] = tmpvar_30;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _LightTextureB0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - _LightPos.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(normalize(tmpvar_10));
  lightDir_6 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (dot (tmpvar_10, tmpvar_10) * _LightPos.w);
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12)).w;
  atten_5 = tmpvar_13;
  highp float mydist_14;
  mydist_14 = ((sqrt(
    dot (tmpvar_10, tmpvar_10)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_15;
  tmpvar_15 = dot (textureCube (_ShadowMapTexture, tmpvar_10), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_16;
  if ((tmpvar_15 < mydist_14)) {
    tmpvar_16 = _LightShadowData.x;
  } else {
    tmpvar_16 = 1.0;
  };
  atten_5 = (atten_5 * tmpvar_16);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_17;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_19;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_20;
  tmpvar_20 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_22;
  viewDir_22 = -(tmpvar_21);
  mediump vec3 tmpvar_23;
  mediump vec3 inVec_24;
  inVec_24 = (lightDir_6 + viewDir_22);
  tmpvar_23 = (inVec_24 * inversesqrt(max (0.001, 
    dot (inVec_24, inVec_24)
  )));
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, dot (lightDir_6, tmpvar_23));
  mediump float tmpvar_26;
  tmpvar_26 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = max ((10.0 / log2(
    (((1.0 - tmpvar_26) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_27 = (tmpvar_28 * tmpvar_28);
  mediump vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_27 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_20, tmpvar_23)), tmpvar_27)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_25 * tmpvar_25)
       * gbuffer1_2.w) + (tmpvar_26 * tmpvar_26))) * tmpvar_25)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_20, lightDir_6)));
  gl_FragData[0] = tmpvar_29;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - _LightPos.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(normalize(tmpvar_10));
  lightDir_6 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (dot (tmpvar_10, tmpvar_10) * _LightPos.w);
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12)).w;
  atten_5 = tmpvar_13;
  highp float mydist_14;
  mydist_14 = ((sqrt(
    dot (tmpvar_10, tmpvar_10)
  ) * _LightPositionRange.w) * 0.97);
  highp float tmpvar_15;
  tmpvar_15 = dot (textureCube (_ShadowMapTexture, tmpvar_10), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  mediump float tmpvar_16;
  if ((tmpvar_15 < mydist_14)) {
    tmpvar_16 = _LightShadowData.x;
  } else {
    tmpvar_16 = 1.0;
  };
  atten_5 = (atten_5 * tmpvar_16);
  highp vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = tmpvar_9;
  lowp vec4 tmpvar_18;
  highp vec3 P_19;
  P_19 = (_LightMatrix0 * tmpvar_17).xyz;
  tmpvar_18 = textureCube (_LightTexture0, P_19);
  atten_5 = (atten_5 * tmpvar_18.w);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_20;
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_21;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_22;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_23;
  tmpvar_23 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_25;
  viewDir_25 = -(tmpvar_24);
  mediump vec3 tmpvar_26;
  mediump vec3 inVec_27;
  inVec_27 = (lightDir_6 + viewDir_25);
  tmpvar_26 = (inVec_27 * inversesqrt(max (0.001, 
    dot (inVec_27, inVec_27)
  )));
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, dot (lightDir_6, tmpvar_26));
  mediump float tmpvar_29;
  tmpvar_29 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_30;
  mediump float tmpvar_31;
  tmpvar_31 = max ((10.0 / log2(
    (((1.0 - tmpvar_29) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_30 = (tmpvar_31 * tmpvar_31);
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_30 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_23, tmpvar_26)), tmpvar_30)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_28 * tmpvar_28)
       * gbuffer1_2.w) + (tmpvar_29 * tmpvar_29))) * tmpvar_28)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_23, lightDir_6)));
  gl_FragData[0] = tmpvar_32;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_HDR_ON" "SHADOWS_NONATIVE" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = (_LightPos.xyz - tmpvar_9);
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_11);
  lightDir_6 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_9;
  highp vec4 tmpvar_14;
  tmpvar_14 = (_LightMatrix0 * tmpvar_13);
  lowp float tmpvar_15;
  tmpvar_15 = texture2DProj (_LightTexture0, tmpvar_14).w;
  atten_5 = tmpvar_15;
  atten_5 = (atten_5 * float((tmpvar_14.w < 0.0)));
  highp float tmpvar_16;
  tmpvar_16 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_LightTextureB0, vec2(tmpvar_16));
  atten_5 = (atten_5 * tmpvar_17.w);
  mediump float tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = clamp (((
    mix (tmpvar_8.z, sqrt(dot (tmpvar_10, tmpvar_10)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_9;
  highp vec4 tmpvar_21;
  tmpvar_21 = (unity_World2Shadow[0] * tmpvar_20);
  lowp float tmpvar_22;
  highp vec4 shadowVals_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (tmpvar_21.xyz / tmpvar_21.w);
  shadowVals_23.x = texture2D (_ShadowMapTexture, (tmpvar_24.xy + _ShadowOffsets[0].xy)).x;
  shadowVals_23.y = texture2D (_ShadowMapTexture, (tmpvar_24.xy + _ShadowOffsets[1].xy)).x;
  shadowVals_23.z = texture2D (_ShadowMapTexture, (tmpvar_24.xy + _ShadowOffsets[2].xy)).x;
  shadowVals_23.w = texture2D (_ShadowMapTexture, (tmpvar_24.xy + _ShadowOffsets[3].xy)).x;
  bvec4 tmpvar_25;
  tmpvar_25 = lessThan (shadowVals_23, tmpvar_24.zzzz);
  mediump vec4 tmpvar_26;
  tmpvar_26 = _LightShadowData.xxxx;
  mediump float tmpvar_27;
  if (tmpvar_25.x) {
    tmpvar_27 = tmpvar_26.x;
  } else {
    tmpvar_27 = 1.0;
  };
  mediump float tmpvar_28;
  if (tmpvar_25.y) {
    tmpvar_28 = tmpvar_26.y;
  } else {
    tmpvar_28 = 1.0;
  };
  mediump float tmpvar_29;
  if (tmpvar_25.z) {
    tmpvar_29 = tmpvar_26.z;
  } else {
    tmpvar_29 = 1.0;
  };
  mediump float tmpvar_30;
  if (tmpvar_25.w) {
    tmpvar_30 = tmpvar_26.w;
  } else {
    tmpvar_30 = 1.0;
  };
  mediump vec4 tmpvar_31;
  tmpvar_31.x = tmpvar_27;
  tmpvar_31.y = tmpvar_28;
  tmpvar_31.z = tmpvar_29;
  tmpvar_31.w = tmpvar_30;
  mediump float tmpvar_32;
  tmpvar_32 = dot (tmpvar_31, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_22 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp ((tmpvar_22 + tmpvar_19), 0.0, 1.0);
  tmpvar_18 = tmpvar_33;
  atten_5 = (atten_5 * tmpvar_18);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_36;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_37;
  tmpvar_37 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_39;
  viewDir_39 = -(tmpvar_38);
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (lightDir_6 + viewDir_39);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = max (0.0, dot (lightDir_6, tmpvar_40));
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_44;
  mediump float tmpvar_45;
  tmpvar_45 = max ((10.0 / log2(
    (((1.0 - tmpvar_43) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_44 = (tmpvar_45 * tmpvar_45);
  mediump vec4 tmpvar_46;
  tmpvar_46.w = 1.0;
  tmpvar_46.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_44 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_37, tmpvar_40)), tmpvar_44)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_42 * tmpvar_42)
       * gbuffer1_2.w) + (tmpvar_43 * tmpvar_43))) * tmpvar_42)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_37, lightDir_6)));
  gl_FragData[0] = tmpvar_46;
}


#endif
"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" "UNITY_HDR_ON" }
"!!GLES
#version 100

#ifdef VERTEX
#extension GL_EXT_shadow_samplers : enable
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
#extension GL_EXT_shadow_samplers : enable
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_World2Shadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform highp vec4 _ShadowOffsets[4];
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = (_LightPos.xyz - tmpvar_9);
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize(tmpvar_11);
  lightDir_6 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_9;
  highp vec4 tmpvar_14;
  tmpvar_14 = (_LightMatrix0 * tmpvar_13);
  lowp float tmpvar_15;
  tmpvar_15 = texture2DProj (_LightTexture0, tmpvar_14).w;
  atten_5 = tmpvar_15;
  atten_5 = (atten_5 * float((tmpvar_14.w < 0.0)));
  highp float tmpvar_16;
  tmpvar_16 = (dot (tmpvar_11, tmpvar_11) * _LightPos.w);
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_LightTextureB0, vec2(tmpvar_16));
  atten_5 = (atten_5 * tmpvar_17.w);
  mediump float tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_9;
  highp vec4 tmpvar_20;
  tmpvar_20 = (unity_World2Shadow[0] * tmpvar_19);
  lowp float tmpvar_21;
  mediump vec4 shadows_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_20.xyz / tmpvar_20.w);
  highp vec3 coord_24;
  coord_24 = (tmpvar_23 + _ShadowOffsets[0].xyz);
  lowp float tmpvar_25;
  tmpvar_25 = shadow2DEXT (_ShadowMapTexture, coord_24);
  shadows_22.x = tmpvar_25;
  highp vec3 coord_26;
  coord_26 = (tmpvar_23 + _ShadowOffsets[1].xyz);
  lowp float tmpvar_27;
  tmpvar_27 = shadow2DEXT (_ShadowMapTexture, coord_26);
  shadows_22.y = tmpvar_27;
  highp vec3 coord_28;
  coord_28 = (tmpvar_23 + _ShadowOffsets[2].xyz);
  lowp float tmpvar_29;
  tmpvar_29 = shadow2DEXT (_ShadowMapTexture, coord_28);
  shadows_22.z = tmpvar_29;
  highp vec3 coord_30;
  coord_30 = (tmpvar_23 + _ShadowOffsets[3].xyz);
  lowp float tmpvar_31;
  tmpvar_31 = shadow2DEXT (_ShadowMapTexture, coord_30);
  shadows_22.w = tmpvar_31;
  shadows_22 = (_LightShadowData.xxxx + (shadows_22 * (1.0 - _LightShadowData.xxxx)));
  mediump float tmpvar_32;
  tmpvar_32 = dot (shadows_22, vec4(0.25, 0.25, 0.25, 0.25));
  tmpvar_21 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp ((tmpvar_21 + clamp (
    ((mix (tmpvar_8.z, sqrt(
      dot (tmpvar_10, tmpvar_10)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_18 = tmpvar_33;
  atten_5 = (atten_5 * tmpvar_18);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_34;
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_35;
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_36;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_37;
  tmpvar_37 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_39;
  viewDir_39 = -(tmpvar_38);
  mediump vec3 tmpvar_40;
  mediump vec3 inVec_41;
  inVec_41 = (lightDir_6 + viewDir_39);
  tmpvar_40 = (inVec_41 * inversesqrt(max (0.001, 
    dot (inVec_41, inVec_41)
  )));
  mediump float tmpvar_42;
  tmpvar_42 = max (0.0, dot (lightDir_6, tmpvar_40));
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_44;
  mediump float tmpvar_45;
  tmpvar_45 = max ((10.0 / log2(
    (((1.0 - tmpvar_43) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_44 = (tmpvar_45 * tmpvar_45);
  mediump vec4 tmpvar_46;
  tmpvar_46.w = 1.0;
  tmpvar_46.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_44 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_37, tmpvar_40)), tmpvar_44)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_42 * tmpvar_42)
       * gbuffer1_2.w) + (tmpvar_43 * tmpvar_43))) * tmpvar_42)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_37, lightDir_6)));
  gl_FragData[0] = tmpvar_46;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _LightTextureB0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - _LightPos.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(normalize(tmpvar_10));
  lightDir_6 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (dot (tmpvar_10, tmpvar_10) * _LightPos.w);
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12)).w;
  atten_5 = tmpvar_13;
  highp vec4 shadowVals_14;
  highp float mydist_15;
  mydist_15 = ((sqrt(
    dot (tmpvar_10, tmpvar_10)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_14.x = dot (textureCube (_ShadowMapTexture, (tmpvar_10 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_14.y = dot (textureCube (_ShadowMapTexture, (tmpvar_10 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_14.z = dot (textureCube (_ShadowMapTexture, (tmpvar_10 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_14.w = dot (textureCube (_ShadowMapTexture, (tmpvar_10 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_16;
  tmpvar_16 = lessThan (shadowVals_14, vec4(mydist_15));
  mediump vec4 tmpvar_17;
  tmpvar_17 = _LightShadowData.xxxx;
  mediump float tmpvar_18;
  if (tmpvar_16.x) {
    tmpvar_18 = tmpvar_17.x;
  } else {
    tmpvar_18 = 1.0;
  };
  mediump float tmpvar_19;
  if (tmpvar_16.y) {
    tmpvar_19 = tmpvar_17.y;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  if (tmpvar_16.z) {
    tmpvar_20 = tmpvar_17.z;
  } else {
    tmpvar_20 = 1.0;
  };
  mediump float tmpvar_21;
  if (tmpvar_16.w) {
    tmpvar_21 = tmpvar_17.w;
  } else {
    tmpvar_21 = 1.0;
  };
  mediump vec4 tmpvar_22;
  tmpvar_22.x = tmpvar_18;
  tmpvar_22.y = tmpvar_19;
  tmpvar_22.z = tmpvar_20;
  tmpvar_22.w = tmpvar_21;
  mediump float tmpvar_23;
  tmpvar_23 = dot (tmpvar_22, vec4(0.25, 0.25, 0.25, 0.25));
  atten_5 = (atten_5 * tmpvar_23);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_26;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_27;
  tmpvar_27 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_29;
  viewDir_29 = -(tmpvar_28);
  mediump vec3 tmpvar_30;
  mediump vec3 inVec_31;
  inVec_31 = (lightDir_6 + viewDir_29);
  tmpvar_30 = (inVec_31 * inversesqrt(max (0.001, 
    dot (inVec_31, inVec_31)
  )));
  mediump float tmpvar_32;
  tmpvar_32 = max (0.0, dot (lightDir_6, tmpvar_30));
  mediump float tmpvar_33;
  tmpvar_33 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_34;
  mediump float tmpvar_35;
  tmpvar_35 = max ((10.0 / log2(
    (((1.0 - tmpvar_33) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_34 = (tmpvar_35 * tmpvar_35);
  mediump vec4 tmpvar_36;
  tmpvar_36.w = 1.0;
  tmpvar_36.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_34 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_27, tmpvar_30)), tmpvar_34)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_32 * tmpvar_32)
       * gbuffer1_2.w) + (tmpvar_33 * tmpvar_33))) * tmpvar_32)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_27, lightDir_6)));
  gl_FragData[0] = tmpvar_36;
}


#endif
"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp vec4 _LightPositionRange;
uniform mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightPos;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTextureB0;
uniform lowp samplerCube _LightTexture0;
uniform highp samplerCube _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - _LightPos.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(normalize(tmpvar_10));
  lightDir_6 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (dot (tmpvar_10, tmpvar_10) * _LightPos.w);
  lowp float tmpvar_13;
  tmpvar_13 = texture2D (_LightTextureB0, vec2(tmpvar_12)).w;
  atten_5 = tmpvar_13;
  highp vec4 shadowVals_14;
  highp float mydist_15;
  mydist_15 = ((sqrt(
    dot (tmpvar_10, tmpvar_10)
  ) * _LightPositionRange.w) * 0.97);
  shadowVals_14.x = dot (textureCube (_ShadowMapTexture, (tmpvar_10 + vec3(0.0078125, 0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_14.y = dot (textureCube (_ShadowMapTexture, (tmpvar_10 + vec3(-0.0078125, -0.0078125, 0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_14.z = dot (textureCube (_ShadowMapTexture, (tmpvar_10 + vec3(-0.0078125, 0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  shadowVals_14.w = dot (textureCube (_ShadowMapTexture, (tmpvar_10 + vec3(0.0078125, -0.0078125, -0.0078125))), vec4(1.0, 0.003921569, 1.53787e-05, 6.030863e-08));
  bvec4 tmpvar_16;
  tmpvar_16 = lessThan (shadowVals_14, vec4(mydist_15));
  mediump vec4 tmpvar_17;
  tmpvar_17 = _LightShadowData.xxxx;
  mediump float tmpvar_18;
  if (tmpvar_16.x) {
    tmpvar_18 = tmpvar_17.x;
  } else {
    tmpvar_18 = 1.0;
  };
  mediump float tmpvar_19;
  if (tmpvar_16.y) {
    tmpvar_19 = tmpvar_17.y;
  } else {
    tmpvar_19 = 1.0;
  };
  mediump float tmpvar_20;
  if (tmpvar_16.z) {
    tmpvar_20 = tmpvar_17.z;
  } else {
    tmpvar_20 = 1.0;
  };
  mediump float tmpvar_21;
  if (tmpvar_16.w) {
    tmpvar_21 = tmpvar_17.w;
  } else {
    tmpvar_21 = 1.0;
  };
  mediump vec4 tmpvar_22;
  tmpvar_22.x = tmpvar_18;
  tmpvar_22.y = tmpvar_19;
  tmpvar_22.z = tmpvar_20;
  tmpvar_22.w = tmpvar_21;
  mediump float tmpvar_23;
  tmpvar_23 = dot (tmpvar_22, vec4(0.25, 0.25, 0.25, 0.25));
  atten_5 = (atten_5 * tmpvar_23);
  highp vec4 tmpvar_24;
  tmpvar_24.w = 1.0;
  tmpvar_24.xyz = tmpvar_9;
  lowp vec4 tmpvar_25;
  highp vec3 P_26;
  P_26 = (_LightMatrix0 * tmpvar_24).xyz;
  tmpvar_25 = textureCube (_LightTexture0, P_26);
  atten_5 = (atten_5 * tmpvar_25.w);
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_28;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_29;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_30;
  tmpvar_30 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_31;
  tmpvar_31 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_32;
  viewDir_32 = -(tmpvar_31);
  mediump vec3 tmpvar_33;
  mediump vec3 inVec_34;
  inVec_34 = (lightDir_6 + viewDir_32);
  tmpvar_33 = (inVec_34 * inversesqrt(max (0.001, 
    dot (inVec_34, inVec_34)
  )));
  mediump float tmpvar_35;
  tmpvar_35 = max (0.0, dot (lightDir_6, tmpvar_33));
  mediump float tmpvar_36;
  tmpvar_36 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_37;
  mediump float tmpvar_38;
  tmpvar_38 = max ((10.0 / log2(
    (((1.0 - tmpvar_36) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_37 = (tmpvar_38 * tmpvar_38);
  mediump vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_37 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_30, tmpvar_33)), tmpvar_37)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_35 * tmpvar_35)
       * gbuffer1_2.w) + (tmpvar_36 * tmpvar_36))) * tmpvar_35)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_30, lightDir_6)));
  gl_FragData[0] = tmpvar_39;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(_LightDir.xyz);
  lightDir_6 = tmpvar_11;
  mediump float tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_ShadowMapTexture, tmpvar_7);
  highp float tmpvar_14;
  tmpvar_14 = clamp ((tmpvar_13.x + clamp (
    ((mix (tmpvar_8.z, sqrt(
      dot (tmpvar_10, tmpvar_10)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_14;
  atten_5 = tmpvar_12;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_16;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_17;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_18;
  tmpvar_18 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_19;
  tmpvar_19 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_20;
  viewDir_20 = -(tmpvar_19);
  mediump vec3 tmpvar_21;
  mediump vec3 inVec_22;
  inVec_22 = (lightDir_6 + viewDir_20);
  tmpvar_21 = (inVec_22 * inversesqrt(max (0.001, 
    dot (inVec_22, inVec_22)
  )));
  mediump float tmpvar_23;
  tmpvar_23 = max (0.0, dot (lightDir_6, tmpvar_21));
  mediump float tmpvar_24;
  tmpvar_24 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_25;
  mediump float tmpvar_26;
  tmpvar_26 = max ((10.0 / log2(
    (((1.0 - tmpvar_24) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_25 = (tmpvar_26 * tmpvar_26);
  mediump vec4 tmpvar_27;
  tmpvar_27.w = 1.0;
  tmpvar_27.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_25 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_18, tmpvar_21)), tmpvar_25)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_23 * tmpvar_23)
       * gbuffer1_2.w) + (tmpvar_24 * tmpvar_24))) * tmpvar_23)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_18, lightDir_6)));
  gl_FragData[0] = tmpvar_27;
}


#endif
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "UNITY_HDR_ON" }
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp sampler2D _CameraDepthTexture;
uniform highp vec4 _LightDir;
uniform highp vec4 _LightColor;
uniform highp mat4 _CameraToWorld;
uniform highp mat4 _LightMatrix0;
uniform sampler2D _LightTexture0;
uniform sampler2D _ShadowMapTexture;
uniform mediump vec4 unity_LightGammaCorrectionConsts;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 gbuffer2_1;
  mediump vec4 gbuffer1_2;
  mediump vec4 gbuffer0_3;
  mediump vec3 tmpvar_4;
  highp float atten_5;
  mediump vec3 lightDir_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_7).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_9;
  tmpvar_9 = (_CameraToWorld * tmpvar_8).xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  highp vec3 tmpvar_11;
  tmpvar_11 = -(_LightDir.xyz);
  lightDir_6 = tmpvar_11;
  mediump float tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_ShadowMapTexture, tmpvar_7);
  highp float tmpvar_14;
  tmpvar_14 = clamp ((tmpvar_13.x + clamp (
    ((mix (tmpvar_8.z, sqrt(
      dot (tmpvar_10, tmpvar_10)
    ), unity_ShadowFadeCenterAndType.w) * _LightShadowData.z) + _LightShadowData.w)
  , 0.0, 1.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_14;
  atten_5 = tmpvar_12;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_9;
  lowp vec4 tmpvar_16;
  highp vec2 P_17;
  P_17 = (_LightMatrix0 * tmpvar_15).xy;
  tmpvar_16 = texture2D (_LightTexture0, P_17);
  atten_5 = (atten_5 * tmpvar_16.w);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_CameraGBufferTexture0, tmpvar_7);
  gbuffer0_3 = tmpvar_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_CameraGBufferTexture1, tmpvar_7);
  gbuffer1_2 = tmpvar_19;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_CameraGBufferTexture2, tmpvar_7);
  gbuffer2_1 = tmpvar_20;
  tmpvar_4 = (_LightColor.xyz * atten_5);
  mediump vec3 tmpvar_21;
  tmpvar_21 = normalize(((gbuffer2_1.xyz * 2.0) - 1.0));
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_9 - _WorldSpaceCameraPos));
  mediump vec3 viewDir_23;
  viewDir_23 = -(tmpvar_22);
  mediump vec3 tmpvar_24;
  mediump vec3 inVec_25;
  inVec_25 = (lightDir_6 + viewDir_23);
  tmpvar_24 = (inVec_25 * inversesqrt(max (0.001, 
    dot (inVec_25, inVec_25)
  )));
  mediump float tmpvar_26;
  tmpvar_26 = max (0.0, dot (lightDir_6, tmpvar_24));
  mediump float tmpvar_27;
  tmpvar_27 = (1.0 - gbuffer1_2.w);
  mediump float tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = max ((10.0 / log2(
    (((1.0 - tmpvar_27) * 0.968) + 0.03)
  )), -255.937);
  tmpvar_28 = (tmpvar_29 * tmpvar_29);
  mediump vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = (((gbuffer0_3.xyz + 
    (clamp (((
      (tmpvar_28 + 1.0)
     * 
      pow (max (0.0, dot (tmpvar_21, tmpvar_24)), tmpvar_28)
    ) / (
      ((unity_LightGammaCorrectionConsts.z * ((
        (tmpvar_26 * tmpvar_26)
       * gbuffer1_2.w) + (tmpvar_27 * tmpvar_27))) * tmpvar_26)
     + 0.0001)), 0.0, 100.0) * gbuffer1_2.xyz)
  ) * tmpvar_4) * max (0.0, dot (tmpvar_21, lightDir_6)));
  gl_FragData[0] = tmpvar_30;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "SHADOWS_NATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_OFF" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_OFF" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_HDR_ON" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_HDR_ON" "SHADOWS_NONATIVE" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "UNITY_HDR_ON" }
"!!GLES"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "UNITY_HDR_ON" }
"!!GLES"
}
}
 }
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Stencil {
   Ref [_StencilNonBackground]
   ReadMask [_StencilNonBackground]
   CompFront Equal
   CompBack Equal
  }
  GpuProgramID 123303
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
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _LightBuffer;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = -(log2(texture2D (_LightBuffer, xlv_TEXCOORD0)));
  gl_FragData[0] = tmpvar_1;
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