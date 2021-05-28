//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "GAF/GAFFilteredObject" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" { }
 _StencilID ("Stencil ID", Float) = 0.000000
 _CustomColorMultiplier ("Color multiplier", Color) = (1.000000,1.000000,1.000000,1.000000)
 _CustomColorOffset ("Color offset", Vector) = (0.000000,0.000000,0.000000,0.000000)
 _TintColor ("Tint color multiplier", Color) = (1.000000,1.000000,1.000000,1.000000)
 _TintColorOffset ("Tint color offset", Vector) = (0.000000,0.000000,0.000000,0.000000)
 _Scale ("Post process scale", Vector) = (1.000000,1.000000,1.000000,1.000000)
 _Pivot ("Mesh pivot", Vector) = (0.000000,0.000000,0.000000,0.000000)
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
  GpuProgramID 55274
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _TintColor;
uniform highp vec4 _TintColorOffset;
uniform highp vec2 _Scale;
uniform highp vec2 _Pivot;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = _glesVertex.zw;
  lowp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_1.xy = (_glesVertex.xy - _Pivot);
  tmpvar_1.xy = (tmpvar_1.xy * _Scale);
  tmpvar_1.xy = (tmpvar_1.xy + _Pivot);
  tmpvar_2 = _TintColor;
  tmpvar_3 = _TintColorOffset;
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
uniform highp mat4 _ColorMtx;
uniform lowp vec4 _Offset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = ((_ColorMtx * (
    (((texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR) + xlv_TEXCOORD1) * _CustomColorMultiplier)
   + _CustomColorOffset)) + _Offset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _TintColor;
uniform highp vec4 _TintColorOffset;
uniform highp vec2 _Scale;
uniform highp vec2 _Pivot;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = _glesVertex.zw;
  lowp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_1.xy = (_glesVertex.xy - _Pivot);
  tmpvar_1.xy = (tmpvar_1.xy * _Scale);
  tmpvar_1.xy = (tmpvar_1.xy + _Pivot);
  tmpvar_2 = _TintColor;
  tmpvar_3 = _TintColorOffset;
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
uniform highp mat4 _ColorMtx;
uniform lowp vec4 _Offset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = ((_ColorMtx * (
    (((texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR) + xlv_TEXCOORD1) * _CustomColorMultiplier)
   + _CustomColorOffset)) + _Offset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _TintColor;
uniform highp vec4 _TintColorOffset;
uniform highp vec2 _Scale;
uniform highp vec2 _Pivot;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = _glesVertex.zw;
  lowp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_1.xy = (_glesVertex.xy - _Pivot);
  tmpvar_1.xy = (tmpvar_1.xy * _Scale);
  tmpvar_1.xy = (tmpvar_1.xy + _Pivot);
  tmpvar_2 = _TintColor;
  tmpvar_3 = _TintColorOffset;
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _CustomColorMultiplier;
uniform lowp vec4 _CustomColorOffset;
uniform highp mat4 _ColorMtx;
uniform lowp vec4 _Offset;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = ((_ColorMtx * (
    (((texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR) + xlv_TEXCOORD1) * _CustomColorMultiplier)
   + _CustomColorOffset)) + _Offset);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TintColor;
uniform 	vec4 _TintColorOffset;
uniform 	vec2 _Scale;
uniform 	vec2 _Pivot;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + (-float(_Pivot.x)), in_POSITION0.y + (-float(_Pivot.y)));
    u_xlat0.xy = u_xlat0.xy * _Scale.xy + vec2(_Pivot.x, _Pivot.y);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = _TintColor;
    vs_TEXCOORD1 = _TintColorOffset;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform 	vec4 hlslcc_mtx4_ColorMtx[4];
uniform 	lowp vec4 _Offset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    u_xlat1 = u_xlat16_0.yyyy * hlslcc_mtx4_ColorMtx[1];
    u_xlat1 = hlslcc_mtx4_ColorMtx[0] * u_xlat16_0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4_ColorMtx[2] * u_xlat16_0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4_ColorMtx[3] * u_xlat16_0.wwww + u_xlat1;
    u_xlat0 = u_xlat0 + _Offset;
    SV_Target0 = u_xlat0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TintColor;
uniform 	vec4 _TintColorOffset;
uniform 	vec2 _Scale;
uniform 	vec2 _Pivot;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + (-float(_Pivot.x)), in_POSITION0.y + (-float(_Pivot.y)));
    u_xlat0.xy = u_xlat0.xy * _Scale.xy + vec2(_Pivot.x, _Pivot.y);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = _TintColor;
    vs_TEXCOORD1 = _TintColorOffset;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform 	vec4 hlslcc_mtx4_ColorMtx[4];
uniform 	lowp vec4 _Offset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    u_xlat1 = u_xlat16_0.yyyy * hlslcc_mtx4_ColorMtx[1];
    u_xlat1 = hlslcc_mtx4_ColorMtx[0] * u_xlat16_0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4_ColorMtx[2] * u_xlat16_0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4_ColorMtx[3] * u_xlat16_0.wwww + u_xlat1;
    u_xlat0 = u_xlat0 + _Offset;
    SV_Target0 = u_xlat0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TintColor;
uniform 	vec4 _TintColorOffset;
uniform 	vec2 _Scale;
uniform 	vec2 _Pivot;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + (-float(_Pivot.x)), in_POSITION0.y + (-float(_Pivot.y)));
    u_xlat0.xy = u_xlat0.xy * _Scale.xy + vec2(_Pivot.x, _Pivot.y);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = _TintColor;
    vs_TEXCOORD1 = _TintColorOffset;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	lowp vec4 _CustomColorMultiplier;
uniform 	lowp vec4 _CustomColorOffset;
uniform 	vec4 hlslcc_mtx4_ColorMtx[4];
uniform 	lowp vec4 _Offset;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in lowp vec4 vs_COLOR0;
in lowp vec4 vs_TEXCOORD1;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * vs_COLOR0 + vs_TEXCOORD1;
    u_xlat16_0 = u_xlat16_0 * _CustomColorMultiplier + _CustomColorOffset;
    u_xlat1 = u_xlat16_0.yyyy * hlslcc_mtx4_ColorMtx[1];
    u_xlat1 = hlslcc_mtx4_ColorMtx[0] * u_xlat16_0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4_ColorMtx[2] * u_xlat16_0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4_ColorMtx[3] * u_xlat16_0.wwww + u_xlat1;
    u_xlat0 = u_xlat0 + _Offset;
    SV_Target0 = u_xlat0;
    return;
}
#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _TintColor;
uniform highp vec4 _TintColorOffset;
uniform highp vec2 _Scale;
uniform highp vec2 _Pivot;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = _glesVertex.zw;
  lowp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_1.xy = (_glesVertex.xy - _Pivot);
  tmpvar_1.xy = (tmpvar_1.xy * _Scale);
  tmpvar_1.xy = (tmpvar_1.xy + _Pivot);
  tmpvar_2 = _TintColor;
  tmpvar_3 = _TintColorOffset;
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
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
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _TintColor;
uniform highp vec4 _TintColorOffset;
uniform highp vec2 _Scale;
uniform highp vec2 _Pivot;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = _glesVertex.zw;
  lowp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_1.xy = (_glesVertex.xy - _Pivot);
  tmpvar_1.xy = (tmpvar_1.xy * _Scale);
  tmpvar_1.xy = (tmpvar_1.xy + _Pivot);
  tmpvar_2 = _TintColor;
  tmpvar_3 = _TintColorOffset;
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
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
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _TintColor;
uniform highp vec4 _TintColorOffset;
uniform highp vec2 _Scale;
uniform highp vec2 _Pivot;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = _glesVertex.zw;
  lowp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  tmpvar_1.xy = (_glesVertex.xy - _Pivot);
  tmpvar_1.xy = (tmpvar_1.xy * _Scale);
  tmpvar_1.xy = (tmpvar_1.xy + _Pivot);
  tmpvar_2 = _TintColor;
  tmpvar_3 = _TintColorOffset;
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
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
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TintColor;
uniform 	vec4 _TintColorOffset;
uniform 	vec2 _Scale;
uniform 	vec2 _Pivot;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + (-float(_Pivot.x)), in_POSITION0.y + (-float(_Pivot.y)));
    u_xlat0.xy = u_xlat0.xy * _Scale.xy + vec2(_Pivot.x, _Pivot.y);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = _TintColor;
    vs_TEXCOORD1 = _TintColorOffset;
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
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TintColor;
uniform 	vec4 _TintColorOffset;
uniform 	vec2 _Scale;
uniform 	vec2 _Pivot;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + (-float(_Pivot.x)), in_POSITION0.y + (-float(_Pivot.y)));
    u_xlat0.xy = u_xlat0.xy * _Scale.xy + vec2(_Pivot.x, _Pivot.y);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = _TintColor;
    vs_TEXCOORD1 = _TintColorOffset;
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
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TintColor;
uniform 	vec4 _TintColorOffset;
uniform 	vec2 _Scale;
uniform 	vec2 _Pivot;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
out lowp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + (-float(_Pivot.x)), in_POSITION0.y + (-float(_Pivot.y)));
    u_xlat0.xy = u_xlat0.xy * _Scale.xy + vec2(_Pivot.x, _Pivot.y);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = _TintColor;
    vs_TEXCOORD1 = _TintColorOffset;
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
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "GAF_COLOR_MTX_FILTER_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
""
}
SubProgram "gles3 hw_tier03 " {
Keywords { "GAF_COLOR_MTX_FILTER_OFF" }
""
}
}
 }
}
}