Shader "Unlit/MultiTexture"
{
    Properties
    {
        _Value("Value", Int) = 1
        _FirstTex("Texture", 2D) = "white" {}
        _SecondTex("Texture", 2D) = "white" {}
        _ThirdTex("Texture", 2D) = "white" {}
    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct vertInput
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct vertOutput
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 worldPos : TEXCOORD1;
            };

            sampler2D _FirstTex;
            sampler2D _SecondTex;
            sampler2D _ThirdTex;
            int _Value;
            float4 _MainTex_ST;

            vertOutput vert(vertInput v)
            {
                vertOutput o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.worldPos = mul(UNITY_MATRIX_M, v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag(vertOutput i) : SV_Target
            {
                float2 topDownProjection = i.worldPos.xz;
                fixed4 col = tex2D(_FirstTex, i.uv);
                if (_Value == 1) {
                    col = tex2D(_FirstTex, i.uv);
                }
                else if (_Value == 2) {
                    col = tex2D(_SecondTex, topDownProjection);
                } 
                else if (_Value == 3) {
                    col = tex2D(_ThirdTex, topDownProjection);
                }

                // blanding colors together
                //fixed4 color1 = tex2D(_FirstTex, i.uv);
                //fixed4 color2 = tex2D(_SecondTex, topDownProjection);
                //fixed4 color3 = tex2D(_ThirdTex, topDownProjection);
                //fixed4 color = color1 * 0.2 + color2 * 1 + color3 * 0.3;
                //return color;

                return col;
            }
            ENDCG
        }
    }
}
