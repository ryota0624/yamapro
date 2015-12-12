////////////////////////////////////////////////////////////////////////////////////////////////
//
//  SpotLight_Object.fx Shadow Edition ver2.0
//  �쐬: ���ڂ�
//  ����: ���͉��P�E�f�[�^P
//
////////////////////////////////////////////////////////////////////////////////////////////////
// ���[�U�[�p�����[�^

//���C�g�F
float3 LightColor = float3( 1, 0, 0.4392157 );
float LightPower1 = 2; //���C�g�������x
float ShadowColor1 = 1; //PMD���f���̉e�F
float ShadowColor2 = 0.5; //�A�N�Z�T���̉e�F

//���������X�C�b�`�i0�Ŗ����A1�Ŕ����A2��2�攽���j
#define DISTANCE_ATTENUATE 1
//�\�t�g�V���h�E�X�C�b�`�i0�Ŗ����A1�ŗL���j
#define SOFTSHADOW      1
//�Ǝ��Z���t�V���h�EZ�o�b�t�@�̃T�C�Y
#define SHADOWBUFSIZE   1024
//�~�b�v�}�b�v�g�p�\��
#define MIPMAP_ENABLE  1
//�ٕ����t�B���^�����O�X�C�b�`
#define FILTER_ENABLE  0
#define MIPTEXSIZE 512

#include "CommonSystem.fx"

////////////////////////////////////////////////////////////////////////////////////////////
//�X�|�b�g�P�x���z�p�̃e�N�X�`��

texture2D SpotDist < string ResourceName = "SpotDist.bmp"; >;
sampler SpotDistSampler = sampler_state {
    texture = <SpotDist>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
    AddressU  = CLAMP;
    AddressV  = CLAMP;
};

// �Ǝ��V���h�E�}�b�v�T���v���[
shared texture SpotLightShadowDraw1: OFFSCREENRENDERTARGET;
sampler ShadowMapSampler = sampler_state {
    texture = <SpotLightShadowDraw1>;
    MinFilter = LINEAR;
    MagFilter = LINEAR;
    MipFilter = LINEAR;
    AddressU  = CLAMP;
    AddressV = CLAMP;
};

////////////////////////////////////////////////////////////////////////////////////////////////
// �p�����[�^�錾

float Script : STANDARDSGLOBAL <
    string ScriptOutput = "color";
    string ScriptClass = "sceneorobject";
    string ScriptOrder = "standard";
> = 0.8;

// �}�e���A���F
float4   MaterialDiffuse   : DIFFUSE  < string Object = "Geometry"; >;
float3   MaterialAmbient   : AMBIENT  < string Object = "Geometry"; >;
float3   MaterialEmmisive  : EMISSIVE < string Object = "Geometry"; >;
float3   MaterialSpecular  : SPECULAR < string Object = "Geometry"; >;
float    SpecularPower     : SPECULARPOWER < string Object = "Geometry"; >;
float3   MaterialToon      : TOONCOLOR;
float4   EdgeColor         : EDGECOLOR;
// ���C�g�F
float3   LightDiffuse      : DIFFUSE   < string Object = "Light"; >;
float3   LightAmbient      : AMBIENT   < string Object = "Light"; >;
float3   LightSpecular     : SPECULAR  < string Object = "Light"; >;

//�����x��MMD����̐���
float Alpha1 : CONTROLOBJECT < string name = "(OffscreenOwner)"; string item = "Tr"; >;

//�����̌����ESpotLightMasterControl.fx�Ƃ̘A�g
float AmbientReduce : CONTROLOBJECT < string name = "SpotLightMasterControl.x"; string item = "Tr"; >;
float MPower : CONTROLOBJECT < string name = "SpotLightMasterControl.x"; string item = "Si"; >;
bool SLMCE : CONTROLOBJECT < string name = "SpotLightMasterControl.x"; >;
bool use_toon;

//���C�g�p���[
static const float lpower = Alpha1 * LightPower1 * lerp(1, MPower * 0.1, SLMCE);
//�e�F
static const float shadowcolor = lerp(ShadowColor2, ShadowColor1, use_toon);

//����F����
static const float4 DiffuseColor  = MaterialDiffuse  * float4(LightDiffuse, 1.0f);
static const float3 AmbientColor = saturate(MaterialAmbient * LightColor * lerp(0.7, 1.0, use_toon) + MaterialEmmisive * AmbientReduce);
static const float3 SpecularColor = MaterialSpecular * LightColor;

//���������̒����ʒu�ݒ�BPowerCenter���Ȃ����20
bool PowerCenterExist : CONTROLOBJECT < string name = "SpotLightPowerCenter.x"; >;
float3 PowerCenterPos : CONTROLOBJECT < string name = "SpotLightPowerCenter.x"; >;
static const float PowerCenterDistance = lerp(20, length(LightPosition - PowerCenterPos), PowerCenterExist);



bool     transp;   // �������t���O
bool     spadd;    // �X�t�B�A�}�b�v���Z�����t���O
#define SKII1    1500
#define SKII2    8000
#define Toon     3


// MMD�{����sampler���㏑�����Ȃ����߂̋L�q�ł��B�폜�s�B
sampler MMDSamp0 : register(s0);
sampler MMDSamp1 : register(s1);
sampler MMDSamp2 : register(s2);

// �X�t�B�A�}�b�v�̃e�N�X�`��
texture ObjectSphereMap: MATERIALSPHEREMAP;
sampler ObjSphareSampler = sampler_state {
    texture = <ObjectSphereMap>;
    MINFILTER = LINEAR;
    MAGFILTER = LINEAR;
};

// �I�u�W�F�N�g�̃e�N�X�`��
texture ObjectTexture: MATERIALTEXTURE;

#if FILTER_ENABLE==0
    //�W���̃T���v���[�����̂܂܎g�p
    sampler ObjTexSampler = sampler_state {
        texture = <ObjectTexture>;
        MINFILTER = LINEAR;
        MAGFILTER = LINEAR;
    };
    
#else
    //�ٕ����t�B���^�����O�\�ȃe�N�X�`���ɃR�s�[���A
    //������T���v�����O����悤�T���v���[��u������
    
    sampler DefObjTexSampler = sampler_state {
        texture = <ObjectTexture>;
        MINFILTER = LINEAR;
        MAGFILTER = LINEAR;
    };

    texture UseMipmapObjectTexture : RENDERCOLORTARGET <
        int Width = MIPTEXSIZE;
        int Height = MIPTEXSIZE;
        int MipLevels = 0;
        string Format = "A8R8G8B8" ;
    >;
    sampler ObjTexSampler = sampler_state {
        texture = <UseMipmapObjectTexture>;
        MINFILTER = ANISOTROPIC;
        MAGFILTER = ANISOTROPIC;
        MIPFILTER = LINEAR;
        MAXANISOTROPY = 16;
    };

    texture2D DepthBuffer : RenderDepthStencilTarget <
        int Width = MIPTEXSIZE;
        int Height = MIPTEXSIZE;
        string Format = "D24S8";
    >;
    
    static float2 ViewportOffset = (float2(0.5,0.5)/MIPTEXSIZE);
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // �~�b�v�}�b�v�쐬
    
    struct VS_OUTPUT_MIPMAPCREATER {
        float4 Pos : POSITION;
        float2 Tex : TEXCOORD0;
    };
    VS_OUTPUT_MIPMAPCREATER VS_MipMapCreater( float4 Pos : POSITION, float4 Tex : TEXCOORD0 ){
        VS_OUTPUT_MIPMAPCREATER Out;
        Out.Pos = Pos;
        Out.Tex = Tex;
        Out.Tex += ViewportOffset;
        return Out;
    }
    
    float4  PS_MipMapCreater(float2 Tex: TEXCOORD0) : COLOR0
    {
        return tex2D(DefObjTexSampler,Tex);
    }
    
#endif


////////////////////////////////////////////////////////////////////////////////////////////
// �֊s�`��

// ���_�V�F�[�_
float4 ColorRender_VS(float4 Pos : POSITION) : POSITION 
{
    // �J�������_�̃��[���h�r���[�ˉe�ϊ�
    return mul( Pos, WorldViewProjMatrix );
}

// �s�N�Z���V�F�[�_
float4 ColorRender_PS() : COLOR
{
    // ���œh��Ԃ�
    return float4(0,0,0,1);
}

// �֊s�`��p�e�N�j�b�N
technique EdgeTec < string MMDPass = "edge"; > {
    pass DrawEdge {
        AlphaBlendEnable = FALSE;
        AlphaTestEnable  = FALSE;
        VertexShader = compile vs_2_0 ColorRender_VS();
        PixelShader  = compile ps_2_0 ColorRender_PS();
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////
// �e�`��

// �n�ʉe�͕\�����Ȃ�
technique ShadowTec < string MMDPass = "shadow"; > { }
// MMD�W���̃Z���t�V���h�E�͕\�����Ȃ�
technique ZplotTec < string MMDPass = "zplot"; > { }


///////////////////////////////////////////////////////////////////////////////////////////////
// �I�u�W�F�N�g�`��i�Z���t�V���h�EOFF�j

struct VS_OUTPUT {
    float4 Pos      : POSITION;     // �ˉe�ϊ����W
    float4 ZCalcTex : TEXCOORD0;    // Z�l
    float2 Tex      : TEXCOORD1;    // �e�N�X�`��
    float3 Normal   : TEXCOORD2;    // �@��
    float3 Eye      : TEXCOORD3;    // �J�����Ƃ̑��Έʒu
    float2 SpTex    : TEXCOORD4;    // �X�t�B�A�}�b�v�e�N�X�`�����W
    float4 WorldPos : TEXCOORD5;    // ���[���h���W
    float4 Color    : COLOR0;       // �f�B�t���[�Y�F
    
};

// ���_�V�F�[�_
VS_OUTPUT Basic_VS(float4 Pos : POSITION, float3 Normal : NORMAL, float2 Tex : TEXCOORD0, uniform bool useTexture, uniform bool useSphereMap, uniform bool useToon)
{
    VS_OUTPUT Out = (VS_OUTPUT)0;
    
    ////���[���h���W�̎Z�o
    Out.WorldPos = mul( Pos, WorldMatrix );
    
    ////���C�g�����̎Z�o
    float3 LightDirection = normalize(Out.WorldPos.xyz - LightPosition);
    
    // �J�������_�̃��[���h�r���[�ˉe�ϊ�
    Out.Pos = mul( Pos, WorldViewProjMatrix );
    
    //// �J�����Ƃ̑��Έʒu
    Out.Eye = CameraPosition - Out.WorldPos;
    // ���_�@��
    Out.Normal = normalize( mul( Normal, (float3x3)WorldMatrix ) );
    // ���C�g���_�ɂ�郏�[���h�r���[�ˉe�ϊ�
    Out.ZCalcTex = mul( Pos, LightWorldViewProjMatrix );
    
    // �f�B�t���[�Y�F�{�A���r�G���g�F �v�Z
    Out.Color.rgb = AmbientColor;
    if ( !useToon ) {
        Out.Color.rgb += max(0,dot( Out.Normal, -LightDirection )) * DiffuseColor.rgb;
    }
    
    Out.Color.a = DiffuseColor.a;
    Out.Color = saturate( Out.Color );
    
    // �e�N�X�`�����W
    Out.Tex = Tex;
    
    if ( useSphereMap ) {
        // �X�t�B�A�}�b�v�e�N�X�`�����W
        float2 NormalWV = mul( Out.Normal, (float3x3)ViewMatrix );
        Out.SpTex.x = NormalWV.x * 0.5f + 0.5f;
        Out.SpTex.y = NormalWV.y * -0.5f + 0.5f;
    }
    
    return Out;
}

static const float sampstep = 1.0 / SHADOWBUFSIZE;




#if MIPMAP_ENABLE==0

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// �V���h�E�pZ�o�b�t�@�̂ڂ����ǂݎ��
// ���_�T���v�����O�łڂ���

//9�_�T���v�����O
/*float2 GetZBufSample(float2 texc){
    float2 Out;
    float step = sampstep;
    
    Out = tex2D(ShadowMapSampler,texc).rg * 2;
    
    Out += tex2D(ShadowMapSampler,texc + float2(0, step)).rg;
    Out += tex2D(ShadowMapSampler,texc + float2(0, -step)).rg;
    Out += tex2D(ShadowMapSampler,texc + float2(step, 0)).rg;
    Out += tex2D(ShadowMapSampler,texc + float2(-step, 0)).rg;
    Out += tex2D(ShadowMapSampler,texc + float2(step, step)).rg;
    Out += tex2D(ShadowMapSampler,texc + float2(-step, step)).rg;
    Out += tex2D(ShadowMapSampler,texc + float2(step, -step)).rg;
    Out += tex2D(ShadowMapSampler,texc + float2(-step, -step)).rg;
    
    Out /= 10;
    return Out;
}*/

//21�_�T���v�����O
float2 GetZBufSample(float2 texc){
    float2 Out;
    float step = sampstep;
    
    Out=tex2D(ShadowMapSampler,texc + float2(-step, step*-2)).rg * 0.018366;
    Out+=tex2D(ShadowMapSampler,texc + float2(0, step*-2)).rg * 0.027399;
    Out+=tex2D(ShadowMapSampler,texc + float2(step, step*-2)).rg * 0.018366;

    Out+=tex2D(ShadowMapSampler,texc + float2(step*-2, -step)).rg * 0.018366;
    Out+=tex2D(ShadowMapSampler,texc + float2(-step, -step)).rg * 0.060977;
    Out+=tex2D(ShadowMapSampler,texc + float2(0, -step)).rg * 0.090967;
    Out+=tex2D(ShadowMapSampler,texc + float2(step, -step)).rg * 0.060977;
    Out+=tex2D(ShadowMapSampler,texc + float2(step*2, -step)).rg * 0.018366;

    Out+=tex2D(ShadowMapSampler,texc + float2(step*-2, 0)).rg * 0.027399;
    Out+=tex2D(ShadowMapSampler,texc + float2(-step, 0)).rg * 0.090967;
    Out+=tex2D(ShadowMapSampler,texc + float2(0, 0)).rg * 0.135706;
    Out+=tex2D(ShadowMapSampler,texc + float2(step, 0)).rg * 0.090967;
    Out+=tex2D(ShadowMapSampler,texc + float2(step*2, 0)).rg * 0.027399;

    Out+=tex2D(ShadowMapSampler,texc + float2(step*-2, step)).rg * 0.018366;
    Out+=tex2D(ShadowMapSampler,texc + float2(-step, step)).rg * 0.060977;
    Out+=tex2D(ShadowMapSampler,texc + float2(0, step)).rg * 0.090967;
    Out+=tex2D(ShadowMapSampler,texc + float2(step, step)).rg * 0.060977;
    Out+=tex2D(ShadowMapSampler,texc + float2(step*2, step)).rg * 0.018366;

    Out+=tex2D(ShadowMapSampler,texc + float2(-step, step*2)).rg * 0.018366;
    Out+=tex2D(ShadowMapSampler,texc + float2(0, step*2)).rg * 0.027399;
    Out+=tex2D(ShadowMapSampler,texc + float2(step, step*2)).rg * 0.018366;
    
    return Out;
}

#else

////////////////////////////////////////////////////////////////////////////////////////////////////////////
// �V���h�E�pZ�o�b�t�@�̂ڂ����ǂݎ��
// �~�b�v�}�b�v�𗘗p���A���L�͈͂̂ڂ������s��

float2 GetZBufSampleMip(float2 texc, float steprate, float mip){
    float2 Out;
    float step = sampstep * steprate;
    
    Out = tex2Dlod(ShadowMapSampler, float4(texc, 0, mip)) * 2;
    
    Out += tex2Dlod(ShadowMapSampler, float4(texc + float2(0, step), 0, mip));
    Out += tex2Dlod(ShadowMapSampler, float4(texc + float2(0, -step), 0, mip));
    Out += tex2Dlod(ShadowMapSampler, float4(texc + float2(step, 0), 0, mip));
    Out += tex2Dlod(ShadowMapSampler, float4(texc + float2(-step, 0), 0, mip));
    Out += tex2Dlod(ShadowMapSampler, float4(texc + float2(step, step), 0, mip));
    Out += tex2Dlod(ShadowMapSampler, float4(texc + float2(-step, step), 0, mip));
    Out += tex2Dlod(ShadowMapSampler, float4(texc + float2(step, -step), 0, mip));
    Out += tex2Dlod(ShadowMapSampler, float4(texc + float2(-step, -step), 0, mip));
    
    Out /= 10;
    return Out;
}

float2 GetZBufSample(float2 texc){
    float2 Out;
    
    //���̂ւ�̒萔�͊��Œ���
    Out = GetZBufSampleMip(texc, 1, 0) * 0.6;
    Out += GetZBufSampleMip(texc, 1.8, 0.8) * 0.3;
    Out += GetZBufSampleMip(texc, 3.4, 1.6) * 0.10;
    
    return Out;
}

#endif

//�ڂ����Ȃ��T���v�����O
float2 GetZBufSampleN(float2 texc){
    float2 Out;
    Out = tex2D(ShadowMapSampler,texc).rg;
    
    return Out;
}

////////////////////////////////////////////////////////////////////////////////////
// �s�N�Z���V�F�[�_
float4 Basic_PS(VS_OUTPUT IN, uniform bool useTexture, uniform bool useSphereMap, uniform bool useToon) : COLOR0
{
    ////���C�g�����̎Z�o
    float3 LightVector = IN.WorldPos.xyz - LightPosition;
    float3 LightDirection = normalize(LightVector);
    ////��������̊p�x
    float SpotRate = acos(dot(LightDirection, LightAxisDirection)) / LightAngle;
    float Distance = length(LightVector); ////���C�g����̋���
    
    #if DISTANCE_ATTENUATE==0
        float DistanceRate = 1; ////���������Ȃ�
    #else
        float DistanceRate = (PowerCenterDistance + 10) / (Distance + 10); ////���������W��
    #endif
    #if DISTANCE_ATTENUATE==2
        DistanceRate *= DistanceRate;
    #endif
        
    
    // �X�y�L�����F�v�Z
    float3 HalfVector = normalize( normalize(IN.Eye) - LightDirection );
    float3 Specular = pow( max(0,dot( HalfVector, normalize(IN.Normal) )), SpecularPower ) * SpecularColor;
    
    float4 Color = IN.Color;
    float4 ShadowColor = float4(AmbientColor * shadowcolor, Color.a);  //// �e�̐F
    
    if ( useTexture ) {
        // �e�N�X�`���K�p
        float4 TexColor = tex2D( ObjTexSampler, IN.Tex );
        Color *= TexColor;
        ShadowColor *= TexColor;
    }
    if ( useSphereMap ) {
        // �X�t�B�A�}�b�v�K�p
        float4 TexColor = tex2D(ObjSphareSampler,IN.SpTex);
        if(spadd){
            Color.rgb += TexColor.rgb;
            ShadowColor.rgb += TexColor.rgb;
        }else{
            Color.rgb *= TexColor.rgb;
            ShadowColor.rgb *= TexColor.rgb;
        }
    }
    
    // �X�y�L�����K�p
    Color.rgb += Specular;
    
    // �e�N�X�`�����W�ɕϊ�
    IN.ZCalcTex /= IN.ZCalcTex.w;
    float2 TransTexCoord;
    TransTexCoord.x = (1.0f + IN.ZCalcTex.x)*0.5f;
    TransTexCoord.y = (1.0f - IN.ZCalcTex.y)*0.5f;
    
    //�Z���t�V���h�E�K�p
    if( !any( saturate(TransTexCoord) != TransTexCoord ) ) { // �V���h�E�o�b�t�@��
        
        float comp;
        
        #if SOFTSHADOW==1
            
            ////VSM�@�̎���
            float2 depth = GetZBufSample(TransTexCoord);
            depth.y += 0.0005;
            float sigma2 = depth.y - depth.x * depth.x;
            comp = sigma2 / (sigma2 + IN.ZCalcTex.z - depth.x);
            comp = saturate(comp) + (comp < 0);
            
        #else
            // �Z���t�V���h�E mode1
            comp = 1 - saturate(max(IN.ZCalcTex.z - GetZBufSampleN(TransTexCoord).r, 0.0f) * SKII1 - 0.3f);
            
        #endif
        
        if ( useToon ) {
            // �g�D�[���K�p
            comp = min(saturate(dot(IN.Normal,-LightDirection)*Toon),comp);
            ShadowColor.rgb *= MaterialToon;
        }
        
        Color = lerp(ShadowColor, Color, comp);
    }
    
    ////�X�|�b�g�a�E���������K�p
    Color.rgb *= tex2D(SpotDistSampler, float2(0.5, SpotRate)).r * lpower * DistanceRate;
    
    
    return Color;
    
}


///////////////////////////////////////////////////////////////////////////////////////////////
//�e�N�j�b�N���X�g�̓ǂݍ���

#if FILTER_ENABLE==0
    #include "CommonTechniques.fx"
#else
    #include "CommonTechniquesAF.fx"
#endif

///////////////////////////////////////////////////////////////////////////////////////////////
