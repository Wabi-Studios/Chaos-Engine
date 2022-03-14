/**
 * Chaos Engine | Apple Metal Viewer
 *
 * Copyright (C) 2022 Wabi Animation. All Rights Reserved.
 */

#include <metal_stdlib>
using namespace metal;

/**
 * The vertex data. */
struct VertexIn
{
  float3 position;
  float4 color;
};

/**
 * The rasterizer data model. */
struct RasterizerData
{
  /** Add the position attribute which is not interpolated by the rasterizer. */
  float4 position [[ position ]];
  
  /** The color value will get interpolated, as the attribute tag is omitted. */
  float4 color;
};

/**
 * The vertex shader sends date off to the rasterizer to be interpolated. */
vertex RasterizerData basic_vertex_shader(const device VertexIn *vertices [[ buffer(0) ]],
                                          uint vertexID [[ vertex_id ]])
{
  RasterizerData rd;
    
  rd.position = float4(vertices[vertexID].position, 1);
  rd.color = vertices[vertexID].color;

  return rd;
}

/**
 * The fragment shader colors in each fragment (pixel)
 * to the color returned from the rasterizer. */
fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]])
{
  float4 color = rd.color;
                                                        
  return half4(color.r, color.g, color.b, color.a);
}
