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

            float4x4 _Model;
            float4x4 _View;
            float4x4 _Projection;
           
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

                // [Model Coordinates]      -> v.vertex
                    //mul (Model Matrix)   
                // [World Position]          -> worldPos
                    //mul (View Matrix)
                // [Camera Coordinates]      -> viewPos
                    //mul (Projection Matrix)
                // [Clip coordinates] (Homogeneous Coordinates)

                float4 worldPos = mul(_Model, v.vertex);
                float4 viewPos = mul(_View,worldPos);
                float4 clipPos = mul(_Projection, viewPos);

                //float4 worldPos = mul(_Model, v.vertex);
                //float4 viewPos = mul(_View,worldPos);
                //float4 clipPos = mul(_Projection, viewPos);
                
                //float4 worldPos = mul(unity_ObjectToWorld, v.vertex);
                //float4 viewPos = mul(UNITY_MATRIX_V,worldPos);
                //float4 clipPos = mul(UNITY_MATRIX_P, viewPos);

                //float4 clipPos = UnityObjectToClipPos(v.vertex); // -> float4 clipPos = mul(UNITY_MATRIX_MVP, v.vertex)

                //o.vertex = v.vertex;
                o.vertex = clipPos;
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
