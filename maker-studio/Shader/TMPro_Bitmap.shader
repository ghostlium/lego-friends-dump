//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TMPro/Bitmap" {
Properties {
 _MainTex ("Font Atlas", 2D) = "white" { }
 _FaceTex ("Font Texture", 2D) = "white" { }
 _FaceColor ("Text Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _VertexOffsetX ("Vertex OffsetX", Float) = 0.000000
 _VertexOffsetY ("Vertex OffsetY", Float) = 0.000000
 _MaskSoftnessX ("Mask SoftnessX", Float) = 0.000000
 _MaskSoftnessY ("Mask SoftnessY", Float) = 0.000000
 _StencilComp ("Stencil Comparison", Float) = 8.000000
 _Stencil ("Stencil ID", Float) = 0.000000
 _StencilOp ("Stencil Operation", Float) = 0.000000
 _StencilWriteMask ("Stencil Write Mask", Float) = 255.000000
 _StencilReadMask ("Stencil Read Mask", Float) = 255.000000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZTest [_ZTestMode]
  ZWrite Off
  Cull [_CullMode]
  Stencil {
   Ref [_Stencil]
   ReadMask [_StencilReadMask]
   WriteMask [_StencilWriteMask]
   Comp [_StencilComp]
   Pass [_StencilOp]
  }
  Blend SrcAlpha OneMinusSrcAlpha
  GpuProgramID 19633
Program "vp" {
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 vert_1;
  vert_1.zw = _glesVertex.zw;
  vert_1.x = (_glesVertex.x + _VertexOffsetX);
  vert_1.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * vert_1);
  highp vec2 tmpvar_3;
  tmpvar_3 = (_ScreenParams.xy * 0.5);
  pos_2.xy = ((floor(
    (((pos_2.xy / pos_2.w) * tmpvar_3) + vec2(0.5, 0.5))
  ) / tmpvar_3) * pos_2.w);
  highp vec2 tmpvar_4;
  tmpvar_4.x = ((floor(_glesMultiTexCoord1.x) * 4.0) / 4096.0);
  tmpvar_4.y = (fract(_glesMultiTexCoord1.x) * 4.0);
  highp vec2 tmpvar_5;
  tmpvar_5.x = (_ScreenParams.x * glstate_matrix_projection[0].x);
  tmpvar_5.y = (_ScreenParams.y * glstate_matrix_projection[1].y);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = vert_1.xy;
  tmpvar_6.zw = (0.5 / (pos_2.ww / abs(tmpvar_5)));
  gl_Position = pos_2;
  xlv_COLOR = (_glesColor * _FaceColor);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform bool _UseClipRect;
uniform sampler2D _MainTex;
uniform sampler2D _FaceTex;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_FaceTex, xlv_TEXCOORD1) * xlv_COLOR);
  c_1.xyz = tmpvar_2.xyz;
  c_1.w = (tmpvar_2.w * texture2D (_MainTex, xlv_TEXCOORD0).w);
  if (_UseClipRect) {
    highp float tmpvar_3;
    highp vec2 tmpvar_4;
    tmpvar_4.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
    tmpvar_4.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
    highp vec2 tmpvar_5;
    tmpvar_5 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_4);
    tmpvar_3 = (tmpvar_5.x * tmpvar_5.y);
    c_1 = (c_1 * tmpvar_3);
  };
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 vert_1;
  vert_1.zw = _glesVertex.zw;
  vert_1.x = (_glesVertex.x + _VertexOffsetX);
  vert_1.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * vert_1);
  highp vec2 tmpvar_3;
  tmpvar_3 = (_ScreenParams.xy * 0.5);
  pos_2.xy = ((floor(
    (((pos_2.xy / pos_2.w) * tmpvar_3) + vec2(0.5, 0.5))
  ) / tmpvar_3) * pos_2.w);
  highp vec2 tmpvar_4;
  tmpvar_4.x = ((floor(_glesMultiTexCoord1.x) * 4.0) / 4096.0);
  tmpvar_4.y = (fract(_glesMultiTexCoord1.x) * 4.0);
  highp vec2 tmpvar_5;
  tmpvar_5.x = (_ScreenParams.x * glstate_matrix_projection[0].x);
  tmpvar_5.y = (_ScreenParams.y * glstate_matrix_projection[1].y);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = vert_1.xy;
  tmpvar_6.zw = (0.5 / (pos_2.ww / abs(tmpvar_5)));
  gl_Position = pos_2;
  xlv_COLOR = (_glesColor * _FaceColor);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform bool _UseClipRect;
uniform sampler2D _MainTex;
uniform sampler2D _FaceTex;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_FaceTex, xlv_TEXCOORD1) * xlv_COLOR);
  c_1.xyz = tmpvar_2.xyz;
  c_1.w = (tmpvar_2.w * texture2D (_MainTex, xlv_TEXCOORD0).w);
  if (_UseClipRect) {
    highp float tmpvar_3;
    highp vec2 tmpvar_4;
    tmpvar_4.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
    tmpvar_4.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
    highp vec2 tmpvar_5;
    tmpvar_5 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_4);
    tmpvar_3 = (tmpvar_5.x * tmpvar_5.y);
    c_1 = (c_1 * tmpvar_3);
  };
  gl_FragData[0] = c_1;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 vert_1;
  vert_1.zw = _glesVertex.zw;
  vert_1.x = (_glesVertex.x + _VertexOffsetX);
  vert_1.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * vert_1);
  highp vec2 tmpvar_3;
  tmpvar_3 = (_ScreenParams.xy * 0.5);
  pos_2.xy = ((floor(
    (((pos_2.xy / pos_2.w) * tmpvar_3) + vec2(0.5, 0.5))
  ) / tmpvar_3) * pos_2.w);
  highp vec2 tmpvar_4;
  tmpvar_4.x = ((floor(_glesMultiTexCoord1.x) * 4.0) / 4096.0);
  tmpvar_4.y = (fract(_glesMultiTexCoord1.x) * 4.0);
  highp vec2 tmpvar_5;
  tmpvar_5.x = (_ScreenParams.x * glstate_matrix_projection[0].x);
  tmpvar_5.y = (_ScreenParams.y * glstate_matrix_projection[1].y);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = vert_1.xy;
  tmpvar_6.zw = (0.5 / (pos_2.ww / abs(tmpvar_5)));
  gl_Position = pos_2;
  xlv_COLOR = (_glesColor * _FaceColor);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform bool _UseClipRect;
uniform sampler2D _MainTex;
uniform sampler2D _FaceTex;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_FaceTex, xlv_TEXCOORD1) * xlv_COLOR);
  c_1.xyz = tmpvar_2.xyz;
  c_1.w = (tmpvar_2.w * texture2D (_MainTex, xlv_TEXCOORD0).w);
  if (_UseClipRect) {
    highp float tmpvar_3;
    highp vec2 tmpvar_4;
    tmpvar_4.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
    tmpvar_4.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
    highp vec2 tmpvar_5;
    tmpvar_5 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_4);
    tmpvar_3 = (tmpvar_5.x * tmpvar_5.y);
    c_1 = (c_1 * tmpvar_3);
  };
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	lowp vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
in highp vec4 in_POSITION0;
in lowp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat0.x = floor(in_TEXCOORD1.x);
    vs_TEXCOORD1.x = u_xlat0.x * 0.0009765625;
    u_xlat0.x = fract(in_TEXCOORD1.x);
    vs_TEXCOORD1.y = u_xlat0.x * 4.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat5.x = _ScreenParams.x * hlslcc_mtx4glstate_matrix_projection[0].x;
    u_xlat5.y = _ScreenParams.y * hlslcc_mtx4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat5.xy);
    vs_TEXCOORD2.zw = vec2(0.5, 0.5) / u_xlat0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _MainTex;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
lowp float u_xlat10_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture(_FaceTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat1.w = u_xlat10_2 * u_xlat1.w;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    SV_Target0 = (_UseClipRect != 0) ? u_xlat0 : u_xlat1;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	lowp vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
in highp vec4 in_POSITION0;
in lowp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat0.x = floor(in_TEXCOORD1.x);
    vs_TEXCOORD1.x = u_xlat0.x * 0.0009765625;
    u_xlat0.x = fract(in_TEXCOORD1.x);
    vs_TEXCOORD1.y = u_xlat0.x * 4.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat5.x = _ScreenParams.x * hlslcc_mtx4glstate_matrix_projection[0].x;
    u_xlat5.y = _ScreenParams.y * hlslcc_mtx4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat5.xy);
    vs_TEXCOORD2.zw = vec2(0.5, 0.5) / u_xlat0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _MainTex;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
lowp float u_xlat10_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture(_FaceTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat1.w = u_xlat10_2 * u_xlat1.w;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    SV_Target0 = (_UseClipRect != 0) ? u_xlat0 : u_xlat1;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4glstate_matrix_projection[4];
uniform 	lowp vec4 _FaceColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
in highp vec4 in_POSITION0;
in lowp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out lowp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
void main()
{
    u_xlat0.xy = in_POSITION0.xy + vec2(_VertexOffsetX, _VertexOffsetY);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat1 = hlslcc_mtx4glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    vs_COLOR0 = in_COLOR0 * _FaceColor;
    u_xlat0.x = floor(in_TEXCOORD1.x);
    vs_TEXCOORD1.x = u_xlat0.x * 0.0009765625;
    u_xlat0.x = fract(in_TEXCOORD1.x);
    vs_TEXCOORD1.y = u_xlat0.x * 4.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat5.x = _ScreenParams.x * hlslcc_mtx4glstate_matrix_projection[0].x;
    u_xlat5.y = _ScreenParams.y * hlslcc_mtx4glstate_matrix_projection[1].y;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat5.xy);
    vs_TEXCOORD2.zw = vec2(0.5, 0.5) / u_xlat0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	int _UseClipRect;
uniform 	vec4 _ClipRect;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _MainTex;
in lowp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out lowp vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
lowp float u_xlat10_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD2.xxxy).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = vec2(u_xlat0.z * u_xlat0.x, u_xlat0.w * u_xlat0.y);
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture(_FaceTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat1.w = u_xlat10_2 * u_xlat1.w;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    SV_Target0 = (_UseClipRect != 0) ? u_xlat0 : u_xlat1;
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