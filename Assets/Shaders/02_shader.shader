Shader "00_Custom/02_shader"
{
    Properties
    {
        _MainTex("Base texture", 2D) = "white" {}
        _Intesity("Intensity", float) = 1
    }
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

            sampler2D _MainTex; //uniform
            float _Intesity;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv: TEXCOORD0;
            };
            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv: TEXCOORD0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }
           
            float4 frag (v2f i) : SV_Target
            {

                float4 m_texture = tex2D(_MainTex,i.uv);

                //float4 outputColor =  float4(1,0,0, 1);
                return m_texture * _Intesity;

            }
            
            ENDCG
        }
    }
}
