////////////////////////////////////////////////////////////////////////////////////////////////
//
//  SpotLight_ShadowZBuf.fx ver2.0
//  �Ǝ��Z���t�V���h�E�pZ�o�b�t�@�쐬�G�t�F�N�g
//  �쐬: ���ڂ�
//  ����: ���͉��P�E�f�[�^P
//
////////////////////////////////////////////////////////////////////////////////////////////////
// �p�����[�^�錾


#define TEXSHADOW 1
const float ShadowAlphaThreshold = 0.6;

#include "CommonSystem.fx"

// �}�e���A���F
float4   MaterialDiffuse   : DIFFUSE  < string Object = "Geometry"; >;
float3   MaterialAmbient   : AMBIENT  < string Object = "Geometry"; >;
float3   MaterialEmmisive  : EMISSIVE < string Object = "Geometry"; >;
float3   MaterialSpecular  : SPECULAR < string Object = "Geometry"; >;
float    SpecularPower     : SPECULARPOWER < string Object = "Geometry"; >;
float3   MaterialToon      : TOONCOLOR;
float4   EdgeColor         : EDGECOLOR;

// �I�u�W�F�N�g�̃e�N�X�`��
texture ObjectTexture: MATERIALTEXTURE;
sampler ObjTexSampler = sampler_state {
    texture = <ObjectTexture>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
};

// MMD�{����sampler���㏑�����Ȃ����߂̋L�q�ł��B�폜�s�B
sampler MMDSamp0 : register(s0);
sampler MMDSamp1 : register(s1);
sampler MMDSamp2 : register(s2);



///////////////////////////////////////////////////////////////////////////////////////////////
// �I�u�W�F�N�g�`��

struct VS_OUTPUT {
    float4 Pos : POSITION;              // �ˉe�ϊ����W
    float4 ShadowMapTex : TEXCOORD1;    // Z�o�b�t�@�e�N�X�`��
    float2 Tex : TEXCOORD0;
};

// ���_�V�F�[�_
VS_OUTPUT Basic_VS(float4 Pos : POSITION, float3 Normal : NORMAL, float2 Tex : TEXCOORD0, uniform bool useTexture)
{
    VS_OUTPUT Out = (VS_OUTPUT)0;
    
    // ���C�g�̖ڐ��ɂ�郏�[���h�r���[�ˉe�ϊ�������
    Out.Pos = mul( Pos, LightWorldViewProjMatrix );
    
    // �e�N�X�`�����W�𒸓_�ɍ��킹��
    Out.ShadowMapTex = Out.Pos;
    
    Out.Tex = Tex;
    
    return Out;
}

// �s�N�Z���V�F�[�_
float4 Basic_PS(VS_OUTPUT IN, uniform bool useTexture) : COLOR0
{
    float depth = IN.ShadowMapTex.z / IN.ShadowMapTex.w;
    float4 color;
    
    //r�l��z�Ag�l��z^2
    color = float4(depth, depth * depth, 0, 1);
    
    #if TEXSHADOW==1
        float alpha = MaterialDiffuse.a;
        if(useTexture) alpha *= tex2D(ObjTexSampler, IN.Tex).a;
        
        //color.g += 0.1 * (1 - alpha);
        color.a = (alpha > ShadowAlphaThreshold);
        
    #endif
    
    return color;
    
}


// �I�u�W�F�N�g�`��p�e�N�j�b�N
technique MainTec0 < string MMDPass = "object"; bool UseTexture = false; > {
    pass DrawObject {
        ALPHABLENDENABLE = false;
        CullMode = NONE;
        VertexShader = compile vs_2_0 Basic_VS(false);
        PixelShader  = compile ps_2_0 Basic_PS(false);
    }
}

technique MainTec1 < string MMDPass = "object"; bool UseTexture = true; > {
    pass DrawObject {
        ALPHABLENDENABLE = false;
        CullMode = NONE;
        VertexShader = compile vs_2_0 Basic_VS(true);
        PixelShader  = compile ps_2_0 Basic_PS(true);
    }
}

technique MainTec0SS < string MMDPass = "object_ss"; bool UseTexture = false; > {
    pass DrawObject {
        ALPHABLENDENABLE = false;
        CullMode = NONE;
        VertexShader = compile vs_2_0 Basic_VS(false);
        PixelShader  = compile ps_2_0 Basic_PS(false);
    }
}

technique MainTec1SS < string MMDPass = "object_ss"; bool UseTexture = true; > {
    pass DrawObject {
        ALPHABLENDENABLE = false;
        CullMode = NONE;
        VertexShader = compile vs_2_0 Basic_VS(true);
        PixelShader  = compile ps_2_0 Basic_PS(true);
    }
}


////////////////////////////////////////////////////////////////////////////////////////////

// �֊s�͕\�����Ȃ�
technique EdgeTec < string MMDPass = "edge"; > { }
// �n�ʉe�͕\�����Ȃ�
technique ShadowTec < string MMDPass = "shadow"; > { }
// MMD�W���̃Z���t�V���h�E�͕\�����Ȃ�
technique ZplotTec < string MMDPass = "zplot"; > { }


///////////////////////////////////////////////////////////////////////////////////////////////
