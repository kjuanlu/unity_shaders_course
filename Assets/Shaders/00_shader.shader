Shader "00_Custom/00_shader"
{
    Properties{ }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Cull Off

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
           
            struct appdata
            {
                float4 vertex : POSITION;
                float3 color : COLOR0; //  float3 color : TEXCOORD0;
            };
            struct v2f
            {
                float4 vertex : SV_POSITION;
                float3 color : COLOR0; //  float3 color : TEXCOORD0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = v.vertex;
                o.color = v.color;
                return o;
            }
           
            float4 frag (v2f i) : SV_Target
            {
                //return  fixed4(1,0,0,1);
                float4 outputColor =  float4(i.color.x, i.color.y, i.color.z, 1);
                return outputColor;

            }
            
            ENDCG
        }
    }
}
