//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Distortion_Aspiration" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" { }
 _TimeX ("Time", Range(0.000000,1.000000)) = 1.000000
 _ScreenResolution ("_ScreenResolution", Vector) = (0.000000,0.000000,0.000000,0.000000)
}
SubShader { 
 Pass {
  ZTest Always
  GpuProgramID 50095
Program "vp" {
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
varying mediump vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_3 = tmpvar_2;
  tmpvar_4 = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Value;
uniform highp float _Value2;
uniform highp float _Value3;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 uv_1;
  uv_1 = xlv_TEXCOORD0;
  highp vec2 tmpvar_2;
  tmpvar_2.x = _Value2;
  tmpvar_2.y = _Value3;
  highp vec2 tmpvar_3;
  tmpvar_3 = (uv_1 + (normalize(
    (uv_1 - tmpvar_2)
  ) * _Value));
  highp vec2 uv_4;
  uv_4 = tmpvar_3;
  highp vec4 c_5;
  highp float b_6;
  b_6 = 0.0;
  if ((tmpvar_3.x > 1.0)) {
    uv_4.x = (1.0 - (tmpvar_3.x - 1.0));
    b_6 = (uv_4.x - 1.0);
  };
  if ((uv_4.x < 0.0)) {
    uv_4.x = (1.0 - (uv_4.x + 1.0));
    b_6 = (b_6 + (1.0 - (uv_4.x + 1.0)));
  };
  if ((tmpvar_3.y > 1.0)) {
    uv_4.y = (1.0 - (tmpvar_3.y - 1.0));
    b_6 = (b_6 + (uv_4.y - 1.0));
  };
  if ((uv_4.y < 0.0)) {
    uv_4.y = (1.0 - (uv_4.y + 1.0));
    b_6 = (b_6 + (1.0 - (uv_4.y + 1.0)));
  };
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MainTex, uv_4).xyz;
  c_5 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = abs((b_6 * 2.0));
  b_6 = tmpvar_8;
  c_5.xyz = (c_5.xyz - vec3(tmpvar_8));
  gl_FragData[0] = c_5;
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
varying mediump vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_3 = tmpvar_2;
  tmpvar_4 = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Value;
uniform highp float _Value2;
uniform highp float _Value3;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 uv_1;
  uv_1 = xlv_TEXCOORD0;
  highp vec2 tmpvar_2;
  tmpvar_2.x = _Value2;
  tmpvar_2.y = _Value3;
  highp vec2 tmpvar_3;
  tmpvar_3 = (uv_1 + (normalize(
    (uv_1 - tmpvar_2)
  ) * _Value));
  highp vec2 uv_4;
  uv_4 = tmpvar_3;
  highp vec4 c_5;
  highp float b_6;
  b_6 = 0.0;
  if ((tmpvar_3.x > 1.0)) {
    uv_4.x = (1.0 - (tmpvar_3.x - 1.0));
    b_6 = (uv_4.x - 1.0);
  };
  if ((uv_4.x < 0.0)) {
    uv_4.x = (1.0 - (uv_4.x + 1.0));
    b_6 = (b_6 + (1.0 - (uv_4.x + 1.0)));
  };
  if ((tmpvar_3.y > 1.0)) {
    uv_4.y = (1.0 - (tmpvar_3.y - 1.0));
    b_6 = (b_6 + (uv_4.y - 1.0));
  };
  if ((uv_4.y < 0.0)) {
    uv_4.y = (1.0 - (uv_4.y + 1.0));
    b_6 = (b_6 + (1.0 - (uv_4.y + 1.0)));
  };
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MainTex, uv_4).xyz;
  c_5 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = abs((b_6 * 2.0));
  b_6 = tmpvar_8;
  c_5.xyz = (c_5.xyz - vec3(tmpvar_8));
  gl_FragData[0] = c_5;
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
varying mediump vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_3 = tmpvar_2;
  tmpvar_4 = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform highp float _Value;
uniform highp float _Value2;
uniform highp float _Value3;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 uv_1;
  uv_1 = xlv_TEXCOORD0;
  highp vec2 tmpvar_2;
  tmpvar_2.x = _Value2;
  tmpvar_2.y = _Value3;
  highp vec2 tmpvar_3;
  tmpvar_3 = (uv_1 + (normalize(
    (uv_1 - tmpvar_2)
  ) * _Value));
  highp vec2 uv_4;
  uv_4 = tmpvar_3;
  highp vec4 c_5;
  highp float b_6;
  b_6 = 0.0;
  if ((tmpvar_3.x > 1.0)) {
    uv_4.x = (1.0 - (tmpvar_3.x - 1.0));
    b_6 = (uv_4.x - 1.0);
  };
  if ((uv_4.x < 0.0)) {
    uv_4.x = (1.0 - (uv_4.x + 1.0));
    b_6 = (b_6 + (1.0 - (uv_4.x + 1.0)));
  };
  if ((tmpvar_3.y > 1.0)) {
    uv_4.y = (1.0 - (tmpvar_3.y - 1.0));
    b_6 = (b_6 + (uv_4.y - 1.0));
  };
  if ((uv_4.y < 0.0)) {
    uv_4.y = (1.0 - (uv_4.y + 1.0));
    b_6 = (b_6 + (1.0 - (uv_4.y + 1.0)));
  };
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = texture2D (_MainTex, uv_4).xyz;
  c_5 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = abs((b_6 * 2.0));
  b_6 = tmpvar_8;
  c_5.xyz = (c_5.xyz - vec3(tmpvar_8));
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
vec4 u_xlat0;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat7;
float u_xlat8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xy = vec2(vs_TEXCOORD0.x + (-float(_Value2)), vs_TEXCOORD0.y + (-float(_Value3)));
    u_xlat9.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat1.xy = u_xlat9.xx * u_xlat1.xy;
    u_xlat0.xy = u_xlat1.xy * vec2(vec2(_Value, _Value)) + vs_TEXCOORD0.xy;
    u_xlatb1.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat9.xy = u_xlat0.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = (-u_xlat9.xy);
    u_xlat2.z = u_xlat2.x + 1.0;
    u_xlat1.xz = (u_xlatb1.x) ? u_xlat2.zx : u_xlat0.xz;
    u_xlat13 = u_xlat1.x + 1.0;
    u_xlat3.xy = (-vec2(u_xlat13)) + vec2(1.0, 2.0);
    u_xlat13 = u_xlat1.z + (-u_xlat3.y);
    u_xlat3.z = u_xlat13 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat1.x<0.0);
#else
    u_xlatb13 = u_xlat1.x<0.0;
#endif
    u_xlat0.xw = (bool(u_xlatb13)) ? u_xlat3.xz : u_xlat1.xz;
    u_xlat7.y = u_xlat2.y + u_xlat0.w;
    u_xlat7.x = u_xlat2.y + 1.0;
    u_xlat1.xy = (u_xlatb1.y) ? u_xlat7.xy : u_xlat0.yw;
    u_xlat12 = u_xlat1.x + 1.0;
    u_xlat2.xy = (-vec2(u_xlat12)) + vec2(1.0, 2.0);
    u_xlat12 = u_xlat1.y + (-u_xlat2.y);
    u_xlat2.z = u_xlat12 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.x<0.0);
#else
    u_xlatb12 = u_xlat1.x<0.0;
#endif
    u_xlat0.yz = (bool(u_xlatb12)) ? u_xlat2.xz : u_xlat1.xy;
    u_xlat10_0.xyw = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat8 = u_xlat0.z + u_xlat0.z;
    SV_Target0.xyz = -abs(vec3(u_xlat8)) + u_xlat10_0.xyw;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
vec4 u_xlat0;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat7;
float u_xlat8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xy = vec2(vs_TEXCOORD0.x + (-float(_Value2)), vs_TEXCOORD0.y + (-float(_Value3)));
    u_xlat9.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat1.xy = u_xlat9.xx * u_xlat1.xy;
    u_xlat0.xy = u_xlat1.xy * vec2(vec2(_Value, _Value)) + vs_TEXCOORD0.xy;
    u_xlatb1.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat9.xy = u_xlat0.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = (-u_xlat9.xy);
    u_xlat2.z = u_xlat2.x + 1.0;
    u_xlat1.xz = (u_xlatb1.x) ? u_xlat2.zx : u_xlat0.xz;
    u_xlat13 = u_xlat1.x + 1.0;
    u_xlat3.xy = (-vec2(u_xlat13)) + vec2(1.0, 2.0);
    u_xlat13 = u_xlat1.z + (-u_xlat3.y);
    u_xlat3.z = u_xlat13 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat1.x<0.0);
#else
    u_xlatb13 = u_xlat1.x<0.0;
#endif
    u_xlat0.xw = (bool(u_xlatb13)) ? u_xlat3.xz : u_xlat1.xz;
    u_xlat7.y = u_xlat2.y + u_xlat0.w;
    u_xlat7.x = u_xlat2.y + 1.0;
    u_xlat1.xy = (u_xlatb1.y) ? u_xlat7.xy : u_xlat0.yw;
    u_xlat12 = u_xlat1.x + 1.0;
    u_xlat2.xy = (-vec2(u_xlat12)) + vec2(1.0, 2.0);
    u_xlat12 = u_xlat1.y + (-u_xlat2.y);
    u_xlat2.z = u_xlat12 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.x<0.0);
#else
    u_xlatb12 = u_xlat1.x<0.0;
#endif
    u_xlat0.yz = (bool(u_xlatb12)) ? u_xlat2.xz : u_xlat1.xy;
    u_xlat10_0.xyw = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat8 = u_xlat0.z + u_xlat0.z;
    SV_Target0.xyz = -abs(vec3(u_xlat8)) + u_xlat10_0.xyw;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "gles3 hw_tier03 " {
"#ifdef VERTEX
#version 300 es
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out lowp vec4 vs_COLOR0;
vec4 u_xlat0;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    return;
}
#endif
#ifdef FRAGMENT
#version 300 es
precision highp int;
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat7;
float u_xlat8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xy = vec2(vs_TEXCOORD0.x + (-float(_Value2)), vs_TEXCOORD0.y + (-float(_Value3)));
    u_xlat9.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat1.xy = u_xlat9.xx * u_xlat1.xy;
    u_xlat0.xy = u_xlat1.xy * vec2(vec2(_Value, _Value)) + vs_TEXCOORD0.xy;
    u_xlatb1.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlat9.xy = u_xlat0.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = (-u_xlat9.xy);
    u_xlat2.z = u_xlat2.x + 1.0;
    u_xlat1.xz = (u_xlatb1.x) ? u_xlat2.zx : u_xlat0.xz;
    u_xlat13 = u_xlat1.x + 1.0;
    u_xlat3.xy = (-vec2(u_xlat13)) + vec2(1.0, 2.0);
    u_xlat13 = u_xlat1.z + (-u_xlat3.y);
    u_xlat3.z = u_xlat13 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat1.x<0.0);
#else
    u_xlatb13 = u_xlat1.x<0.0;
#endif
    u_xlat0.xw = (bool(u_xlatb13)) ? u_xlat3.xz : u_xlat1.xz;
    u_xlat7.y = u_xlat2.y + u_xlat0.w;
    u_xlat7.x = u_xlat2.y + 1.0;
    u_xlat1.xy = (u_xlatb1.y) ? u_xlat7.xy : u_xlat0.yw;
    u_xlat12 = u_xlat1.x + 1.0;
    u_xlat2.xy = (-vec2(u_xlat12)) + vec2(1.0, 2.0);
    u_xlat12 = u_xlat1.y + (-u_xlat2.y);
    u_xlat2.z = u_xlat12 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.x<0.0);
#else
    u_xlatb12 = u_xlat1.x<0.0;
#endif
    u_xlat0.yz = (bool(u_xlatb12)) ? u_xlat2.xz : u_xlat1.xy;
    u_xlat10_0.xyw = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat8 = u_xlat0.z + u_xlat0.z;
    SV_Target0.xyz = -abs(vec3(u_xlat8)) + u_xlat10_0.xyw;
    SV_Target0.w = 1.0;
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