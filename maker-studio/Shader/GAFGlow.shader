//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "GAF/GAFGlow" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" { }
 _BlurX ("Horizontal blur", Float) = 0.000000
 _BlurY ("Vertical blur", Float) = 0.000000
 _GlowColor ("Glow color", Color) = (1.000000,1.000000,1.000000,1.000000)
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 61332
Program "vp" {
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _BlurX;
uniform highp float _BlurY;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1.x = (_BlurX * _MainTex_TexelSize.x);
  tmpvar_1.y = (_BlurY * _MainTex_TexelSize.y);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 resultColor_1;
  highp vec2 P_2;
  highp vec2 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD1 * 4.0);
  P_2 = (xlv_TEXCOORD0 - tmpvar_3);
  resultColor_1 = vec4((texture2D (_MainTex, P_2).w * 0.05));
  highp vec2 P_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD1 * 3.0);
  P_4 = (xlv_TEXCOORD0 - tmpvar_5);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_4).w * 0.09));
  highp vec2 P_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD1 * 2.0);
  P_6 = (xlv_TEXCOORD0 - tmpvar_7);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_6).w * 0.12));
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 - xlv_TEXCOORD1);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_8).w * 0.15));
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, xlv_TEXCOORD0).w * 0.18));
  highp vec2 P_9;
  P_9 = (xlv_TEXCOORD0 + xlv_TEXCOORD1);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_9).w * 0.15));
  highp vec2 P_10;
  P_10 = (xlv_TEXCOORD0 + tmpvar_7);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_10).w * 0.12));
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 + tmpvar_5);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_11).w * 0.09));
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD0 + tmpvar_3);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_12).w * 0.05));
  lowp vec4 tmpvar_13;
  tmpvar_13 = (resultColor_1 * _GlowColor);
  gl_FragData[0] = tmpvar_13;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _BlurX;
uniform highp float _BlurY;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1.x = (_BlurX * _MainTex_TexelSize.x);
  tmpvar_1.y = (_BlurY * _MainTex_TexelSize.y);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 resultColor_1;
  highp vec2 P_2;
  highp vec2 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD1 * 4.0);
  P_2 = (xlv_TEXCOORD0 - tmpvar_3);
  resultColor_1 = vec4((texture2D (_MainTex, P_2).w * 0.05));
  highp vec2 P_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD1 * 3.0);
  P_4 = (xlv_TEXCOORD0 - tmpvar_5);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_4).w * 0.09));
  highp vec2 P_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD1 * 2.0);
  P_6 = (xlv_TEXCOORD0 - tmpvar_7);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_6).w * 0.12));
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 - xlv_TEXCOORD1);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_8).w * 0.15));
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, xlv_TEXCOORD0).w * 0.18));
  highp vec2 P_9;
  P_9 = (xlv_TEXCOORD0 + xlv_TEXCOORD1);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_9).w * 0.15));
  highp vec2 P_10;
  P_10 = (xlv_TEXCOORD0 + tmpvar_7);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_10).w * 0.12));
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 + tmpvar_5);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_11).w * 0.09));
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD0 + tmpvar_3);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_12).w * 0.05));
  lowp vec4 tmpvar_13;
  tmpvar_13 = (resultColor_1 * _GlowColor);
  gl_FragData[0] = tmpvar_13;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _MainTex_TexelSize;
uniform highp float _BlurX;
uniform highp float _BlurY;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1.x = (_BlurX * _MainTex_TexelSize.x);
  tmpvar_1.y = (_BlurY * _MainTex_TexelSize.y);
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _GlowColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 resultColor_1;
  highp vec2 P_2;
  highp vec2 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD1 * 4.0);
  P_2 = (xlv_TEXCOORD0 - tmpvar_3);
  resultColor_1 = vec4((texture2D (_MainTex, P_2).w * 0.05));
  highp vec2 P_4;
  highp vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD1 * 3.0);
  P_4 = (xlv_TEXCOORD0 - tmpvar_5);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_4).w * 0.09));
  highp vec2 P_6;
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD1 * 2.0);
  P_6 = (xlv_TEXCOORD0 - tmpvar_7);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_6).w * 0.12));
  highp vec2 P_8;
  P_8 = (xlv_TEXCOORD0 - xlv_TEXCOORD1);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_8).w * 0.15));
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, xlv_TEXCOORD0).w * 0.18));
  highp vec2 P_9;
  P_9 = (xlv_TEXCOORD0 + xlv_TEXCOORD1);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_9).w * 0.15));
  highp vec2 P_10;
  P_10 = (xlv_TEXCOORD0 + tmpvar_7);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_10).w * 0.12));
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD0 + tmpvar_5);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_11).w * 0.09));
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD0 + tmpvar_3);
  resultColor_1 = (resultColor_1 + (texture2D (_MainTex, P_12).w * 0.05));
  lowp vec4 tmpvar_13;
  tmpvar_13 = (resultColor_1 * _GlowColor);
  gl_FragData[0] = tmpvar_13;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurX;
uniform 	float _BlurY;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = _MainTex_TexelSize.xy * vec2(_BlurX, _BlurY);
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _GlowColor;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump float u_xlat16_2;
lowp float u_xlat10_2;
lowp float u_xlat10_4;
void main()
{
    u_xlat0 = (-vs_TEXCOORD1.xyxy) * vec4(4.0, 4.0, 3.0, 3.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture(_MainTex, u_xlat0.zw).w;
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy).w;
    u_xlat16_2 = u_xlat10_4 * 0.0900000036;
    u_xlat16_0 = u_xlat10_0 * 0.0500000007 + u_xlat16_2;
    u_xlat2.xy = (-vs_TEXCOORD1.xy) * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.119999997 + u_xlat16_0;
    u_xlat2.xy = vec2((-vs_TEXCOORD1.x) + vs_TEXCOORD0.x, (-vs_TEXCOORD1.y) + vs_TEXCOORD0.y);
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.150000006 + u_xlat16_0;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.180000007 + u_xlat16_0;
    u_xlat2.xy = vec2(vs_TEXCOORD1.x + vs_TEXCOORD0.x, vs_TEXCOORD1.y + vs_TEXCOORD0.y);
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.150000006 + u_xlat16_0;
    u_xlat2.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.119999997 + u_xlat16_0;
    u_xlat1 = vs_TEXCOORD1.xyxy * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_MainTex, u_xlat1.xy).w;
    u_xlat10_4 = texture(_MainTex, u_xlat1.zw).w;
    u_xlat16_0 = u_xlat10_2 * 0.0900000036 + u_xlat16_0;
    u_xlat16_0 = u_xlat10_4 * 0.0500000007 + u_xlat16_0;
    SV_Target0 = vec4(u_xlat16_0) * _GlowColor;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurX;
uniform 	float _BlurY;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = _MainTex_TexelSize.xy * vec2(_BlurX, _BlurY);
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _GlowColor;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump float u_xlat16_2;
lowp float u_xlat10_2;
lowp float u_xlat10_4;
void main()
{
    u_xlat0 = (-vs_TEXCOORD1.xyxy) * vec4(4.0, 4.0, 3.0, 3.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture(_MainTex, u_xlat0.zw).w;
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy).w;
    u_xlat16_2 = u_xlat10_4 * 0.0900000036;
    u_xlat16_0 = u_xlat10_0 * 0.0500000007 + u_xlat16_2;
    u_xlat2.xy = (-vs_TEXCOORD1.xy) * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.119999997 + u_xlat16_0;
    u_xlat2.xy = vec2((-vs_TEXCOORD1.x) + vs_TEXCOORD0.x, (-vs_TEXCOORD1.y) + vs_TEXCOORD0.y);
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.150000006 + u_xlat16_0;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.180000007 + u_xlat16_0;
    u_xlat2.xy = vec2(vs_TEXCOORD1.x + vs_TEXCOORD0.x, vs_TEXCOORD1.y + vs_TEXCOORD0.y);
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.150000006 + u_xlat16_0;
    u_xlat2.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.119999997 + u_xlat16_0;
    u_xlat1 = vs_TEXCOORD1.xyxy * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_MainTex, u_xlat1.xy).w;
    u_xlat10_4 = texture(_MainTex, u_xlat1.zw).w;
    u_xlat16_0 = u_xlat10_2 * 0.0900000036 + u_xlat16_0;
    u_xlat16_0 = u_xlat10_4 * 0.0500000007 + u_xlat16_0;
    SV_Target0 = vec4(u_xlat16_0) * _GlowColor;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurX;
uniform 	float _BlurY;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = _MainTex_TexelSize.xy * vec2(_BlurX, _BlurY);
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _GlowColor;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec2 u_xlat2;
mediump float u_xlat16_2;
lowp float u_xlat10_2;
lowp float u_xlat10_4;
void main()
{
    u_xlat0 = (-vs_TEXCOORD1.xyxy) * vec4(4.0, 4.0, 3.0, 3.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture(_MainTex, u_xlat0.zw).w;
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy).w;
    u_xlat16_2 = u_xlat10_4 * 0.0900000036;
    u_xlat16_0 = u_xlat10_0 * 0.0500000007 + u_xlat16_2;
    u_xlat2.xy = (-vs_TEXCOORD1.xy) * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.119999997 + u_xlat16_0;
    u_xlat2.xy = vec2((-vs_TEXCOORD1.x) + vs_TEXCOORD0.x, (-vs_TEXCOORD1.y) + vs_TEXCOORD0.y);
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.150000006 + u_xlat16_0;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.180000007 + u_xlat16_0;
    u_xlat2.xy = vec2(vs_TEXCOORD1.x + vs_TEXCOORD0.x, vs_TEXCOORD1.y + vs_TEXCOORD0.y);
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.150000006 + u_xlat16_0;
    u_xlat2.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy).w;
    u_xlat16_0 = u_xlat10_2 * 0.119999997 + u_xlat16_0;
    u_xlat1 = vs_TEXCOORD1.xyxy * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_MainTex, u_xlat1.xy).w;
    u_xlat10_4 = texture(_MainTex, u_xlat1.zw).w;
    u_xlat16_0 = u_xlat10_2 * 0.0900000036 + u_xlat16_0;
    u_xlat16_0 = u_xlat10_4 * 0.0500000007 + u_xlat16_0;
    SV_Target0 = vec4(u_xlat16_0) * _GlowColor;
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
Fallback Off
}