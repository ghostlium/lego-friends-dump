//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Lego/LegoSky" {
Properties {
_SkyBase ("SkyBase", 2D) = "white" { }
_Speed ("Speed", Float) = 1
_Clouds ("Clouds", 2D) = "white" { }
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 38599
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
uniform lowp sampler2D _SkyBase;
uniform lowp sampler2D _Clouds;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat10_1 = texture2D(_Clouds, u_xlat0.xy);
    u_xlat10_0 = texture2D(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat10_1.xyz) + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz + u_xlat10_1.xyz;
    u_xlat6 = u_xlat10_1.w + u_xlat10_0.w;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat10_1.xyz = texture2D(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec4 _SkyBase_ST;
uniform 	float _Speed;
uniform 	vec4 _Clouds_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _SkyBase;
UNITY_LOCATION(1) uniform mediump sampler2D _Clouds;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat0.x = _Time.x * _Speed;
    u_xlat0 = u_xlat0.xxxx * vec4(0.460000008, 0.0, 1.0, 0.0) + vs_TEXCOORD1.xyxy;
    u_xlat0 = u_xlat0 * _Clouds_ST.xyxy + _Clouds_ST.zwzw;
    u_xlat16_1 = texture(_Clouds, u_xlat0.xy);
    u_xlat16_0 = texture(_Clouds, u_xlat0.zw);
    u_xlat0.xyz = (-u_xlat16_1.xyz) + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz + u_xlat16_1.xyz;
    u_xlat6 = u_xlat16_1.w + u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _SkyBase_ST.xy + _SkyBase_ST.zw;
    u_xlat16_1.xyz = texture(_SkyBase, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
}
}
}
Fallback "Diffuse"
CustomEditor "ShaderForgeMaterialInspector"
}