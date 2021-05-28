//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "GAF/GAFObjectsGroup" {
Properties {
 _MainTex ("Main Texture", 2D) = "white" { }
 _StencilID ("Stencil ID", Float) = 0.000000
 _CustomColorMultiplier ("Color multiplier", Color) = (1.000000,1.000000,1.000000,1.000000)
 _CustomColorOffset ("Color offset", Vector) = (0.000000,0.000000,0.000000,0.000000)
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Stencil {
   Ref [_StencilID]
   Comp Equal
  }
  Blend SrcAlpha OneMinusSrcAlpha
  GpuProgramID 9874
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord2;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesColor;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_3 = tmpvar_2;
  highp vec4 tmpvar_5;
  tmpvar_5.xy = _glesMultiTexCoord1.xy;
  tmpvar_5.z = tmpvar_1.x;
  tmpvar_5.w = tmpvar_1.y;
  tmpvar_4 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((
    (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR)
   + xlv_TEXCOORD1) * _CustomColorMultiplier) + _CustomColorOffset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord2;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesColor;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_3 = tmpvar_2;
  highp vec4 tmpvar_5;
  tmpvar_5.xy = _glesMultiTexCoord1.xy;
  tmpvar_5.z = tmpvar_1.x;
  tmpvar_5.w = tmpvar_1.y;
  tmpvar_4 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((
    (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR)
   + xlv_TEXCOORD1) * _CustomColorMultiplier) + _CustomColorOffset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord2;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesColor;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_3 = tmpvar_2;
  highp vec4 tmpvar_5;
  tmpvar_5.xy = _glesMultiTexCoord1.xy;
  tmpvar_5.z = tmpvar_1.x;
  tmpvar_5.w = tmpvar_1.y;
  tmpvar_4 = tmpvar_5;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((
    (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR)
   + xlv_TEXCOORD1) * _CustomColorMultiplier) + _CustomColorOffset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = in_TEXCOORD1.xy;
    u_xlat0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = in_TEXCOORD1.xy;
    u_xlat0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = in_TEXCOORD1.xy;
    u_xlat0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord2;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesColor;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_3.xzw = _glesVertex.xzw;
  tmpvar_3.y = -(_glesVertex.y);
  tmpvar_4 = tmpvar_2;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = _glesMultiTexCoord1.xy;
  tmpvar_6.z = tmpvar_1.x;
  tmpvar_6.w = tmpvar_1.y;
  tmpvar_5 = tmpvar_6;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((
    (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR)
   + xlv_TEXCOORD1) * _CustomColorMultiplier) + _CustomColorOffset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord2;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesColor;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_3.xzw = _glesVertex.xzw;
  tmpvar_3.y = -(_glesVertex.y);
  tmpvar_4 = tmpvar_2;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = _glesMultiTexCoord1.xy;
  tmpvar_6.z = tmpvar_1.x;
  tmpvar_6.w = tmpvar_1.y;
  tmpvar_5 = tmpvar_6;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((
    (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR)
   + xlv_TEXCOORD1) * _CustomColorMultiplier) + _CustomColorOffset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord2;
  highp vec4 tmpvar_2;
  tmpvar_2 = _glesColor;
  highp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_3.xzw = _glesVertex.xzw;
  tmpvar_3.y = -(_glesVertex.y);
  tmpvar_4 = tmpvar_2;
  highp vec4 tmpvar_6;
  tmpvar_6.xy = _glesMultiTexCoord1.xy;
  tmpvar_6.z = tmpvar_1.x;
  tmpvar_6.w = tmpvar_1.y;
  tmpvar_5 = tmpvar_6;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (((
    (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR)
   + xlv_TEXCOORD1) * _CustomColorMultiplier) + _CustomColorOffset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    gl_Position = in_POSITION0 * vec4(1.0, -1.0, 1.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = in_TEXCOORD1.xy;
    u_xlat0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    gl_Position = in_POSITION0 * vec4(1.0, -1.0, 1.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = in_TEXCOORD1.xy;
    u_xlat0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    gl_Position = in_POSITION0 * vec4(1.0, -1.0, 1.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = in_TEXCOORD1.xy;
    u_xlat0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    SV_Target0 = u_xlat16_0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "GAF_VERTICES_TRANSFORM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "GAF_VERTICES_TRANSFORM_OFF" }
""
}
}
 }
}
}