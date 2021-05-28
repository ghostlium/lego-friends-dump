//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Easy Masking Transition/Unlit/Transparent Tint" {
Properties {
 _MainTex ("Image (RGB)", 2D) = "white" { }
 _Gradation ("Gradation (A8)", 2D) = "white" { }
 _Color ("Tint", Color) = (1.000000,1.000000,1.000000,1.000000)
 _Cutoff ("Alpha Cut Off", Range(0.000000,1.000000)) = 0.500000
[Toggle]  _Invert ("Inverted (Boolean)", Float) = 0.000000
}
SubShader { 
 Tags { "QUEUE"="AlphaTest" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" "PreviewType"="Plane" }
 Pass {
  Tags { "QUEUE"="AlphaTest" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" "PreviewType"="Plane" }
  ZWrite Off
  Cull Off
  Blend SrcAlpha OneMinusSrcAlpha
  GpuProgramID 18998
Program "vp" {
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = (_glesColor * _Color);
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Gradation;
uniform lowp float _Cutoff;
uniform lowp float _Invert;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_Gradation, xlv_TEXCOORD0) - 0.01);
  col_2 = tmpvar_3;
  if ((_Invert == 0.0)) {
    col_2 = (1.0 - tmpvar_3);
  };
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * xlv_COLOR);
  tex_1 = tmpvar_5;
  lowp float x_6;
  x_6 = (_Cutoff - col_2.w);
  if ((x_6 < 0.0)) {
    discard;
  };
  gl_FragData[0] = tex_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = (_glesColor * _Color);
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Gradation;
uniform lowp float _Cutoff;
uniform lowp float _Invert;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_Gradation, xlv_TEXCOORD0) - 0.01);
  col_2 = tmpvar_3;
  if ((_Invert == 0.0)) {
    col_2 = (1.0 - tmpvar_3);
  };
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * xlv_COLOR);
  tex_1 = tmpvar_5;
  lowp float x_6;
  x_6 = (_Cutoff - col_2.w);
  if ((x_6 < 0.0)) {
    discard;
  };
  gl_FragData[0] = tex_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = (_glesColor * _Color);
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Gradation;
uniform lowp float _Cutoff;
uniform lowp float _Invert;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_Gradation, xlv_TEXCOORD0) - 0.01);
  col_2 = tmpvar_3;
  if ((_Invert == 0.0)) {
    col_2 = (1.0 - tmpvar_3);
  };
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * xlv_COLOR);
  tex_1 = tmpvar_5;
  lowp float x_6;
  x_6 = (_Cutoff - col_2.w);
  if ((x_6 < 0.0)) {
    discard;
  };
  gl_FragData[0] = tex_1;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	lowp vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp float _Cutoff;
uniform 	lowp float _Invert;
uniform lowp sampler2D _Gradation;
uniform lowp sampler2D _MainTex;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
lowp float u_xlat10_1;
float u_xlat2;
lowp float u_xlat10_2;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Invert==0.0);
#else
    u_xlatb0 = _Invert==0.0;
#endif
    u_xlat10_2 = texture(_Gradation, vs_TEXCOORD0.xy).w;
    u_xlat2 = u_xlat10_2 + -0.00999999978;
    u_xlat10_1 = (-u_xlat2) + 1.0;
    u_xlat10_1 = (u_xlatb0) ? u_xlat10_1 : u_xlat2;
    u_xlat10_1 = (-u_xlat10_1) + _Cutoff;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat10_1<0.0);
#else
    u_xlatb0 = u_xlat10_1<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	lowp vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp float _Cutoff;
uniform 	lowp float _Invert;
uniform lowp sampler2D _Gradation;
uniform lowp sampler2D _MainTex;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
lowp float u_xlat10_1;
float u_xlat2;
lowp float u_xlat10_2;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Invert==0.0);
#else
    u_xlatb0 = _Invert==0.0;
#endif
    u_xlat10_2 = texture(_Gradation, vs_TEXCOORD0.xy).w;
    u_xlat2 = u_xlat10_2 + -0.00999999978;
    u_xlat10_1 = (-u_xlat2) + 1.0;
    u_xlat10_1 = (u_xlatb0) ? u_xlat10_1 : u_xlat2;
    u_xlat10_1 = (-u_xlat10_1) + _Cutoff;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat10_1<0.0);
#else
    u_xlatb0 = u_xlat10_1<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	lowp vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0 * _Color;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp float _Cutoff;
uniform 	lowp float _Invert;
uniform lowp sampler2D _Gradation;
uniform lowp sampler2D _MainTex;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
lowp float u_xlat10_1;
float u_xlat2;
lowp float u_xlat10_2;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Invert==0.0);
#else
    u_xlatb0 = _Invert==0.0;
#endif
    u_xlat10_2 = texture(_Gradation, vs_TEXCOORD0.xy).w;
    u_xlat2 = u_xlat10_2 + -0.00999999978;
    u_xlat10_1 = (-u_xlat2) + 1.0;
    u_xlat10_1 = (u_xlatb0) ? u_xlat10_1 : u_xlat2;
    u_xlat10_1 = (-u_xlat10_1) + _Cutoff;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat10_1<0.0);
#else
    u_xlatb0 = u_xlat10_1<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
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
}