////////////////////////////////////////////////////////////////////////////////////////////////
//
// �e�G�t�F�N�g�̋��ʕ������W�߂��t�@�C��
// ���̃t�@�C�����X�V���Ă�MME�̎����X�V�̑ΏۂƂ͂Ȃ�܂���
//
////////////////////////////////////////////////////////////////////////////////////////////////
// ���[�U�[�p�����[�^


float DefaultLightAngle = 20;

#define PROJ_FAR  800
#define PROJ_NEAR 3


////////////////////////////////////////////////////////////////////////////////////////////////
// �v�Z�p�萔

// �A�N�Z�T���̔{���␳(�A�N�Z�T��/�R���g���[���́AWorldMatrix��10�{�ɂȂ��Ă���)
static const float4x4 div10 = { 0.1, 0, 0, 0,
                                0, 0.1, 0, 0,
                                0, 0, 0.1, 0,
                                0, 0, 0,   1};


#define PI 3.14159
#define DEG_TO_RAD (PI / 180)


////////////////////////////////////////////////////////////////////////////////////////////////
// �t�s�񉉎Z �A�N�Z�T���̃��[���h�ϊ��s��Ɍ���
// �ړ��̋t�s�� * ��]�̋t�s�� * �A�N�Z�T���̊g�嗦10�{�̋t�s��
float4x4 inverseDir(float4x4 mat){
    return float4x4(
        mat._11, mat._21, mat._31, 0,
        mat._12, mat._22, mat._32, 0,
        mat._13, mat._23, mat._33, 0,
        0,0,0,1
    );
}

float4x4 inverse(float4x4 mat){
    float4x4 mv={
        1,0,0,0,
        0,1,0,0,
        0,0,1,0,
        -mat._41, -mat._42, -mat._43, 1
    };

    return mul(mv,inverseDir(mat));
}

float4x4 inverseCtrl(float4x4 mat){
    return mul(inverse(mat),div10);
}


////////////////////////////////////////////////////////////////////////////////////////////
//
// ���@�ϊ��s��
float4x4 WorldViewProjMatrix      : WORLDVIEWPROJECTION;
float4x4 WorldMatrix              : WORLD;
float4x4 ViewMatrix               : VIEW;

float3   CameraPosition     : POSITION  < string Object = "Camera"; >;

////////////////////////////////////////////////////////////////////////////////////////////
//�Ɩ��n�x�N�g���E�s��̍쐬

float LightScale : CONTROLOBJECT < string name = "(OffscreenOwner)"; >;
float3 LightPosition : CONTROLOBJECT < string name = "(OffscreenOwner)"; >;
float4x4 LightObjectMatrix : CONTROLOBJECT < string name = "(OffscreenOwner)"; >;

static const float LightAngle = DefaultLightAngle * LightScale * 0.1 * DEG_TO_RAD;

//�Z���t�V���h�E�p�ɓƎ��̎ˉe�ϊ��s����쐬
float4x4 GetLightProjMatrix(){
    const float ProjFar = PROJ_FAR;
    const float ProjNear = PROJ_NEAR;
    const float Sz = ProjFar / (ProjFar - ProjNear);
    const float Sx = 1 / tan(LightAngle);
    
    float4x4 out1 = {
        Sx,0 ,0 ,0,
        0 ,Sx,0 ,0,
        0 ,0 ,Sz,1,
        0 ,0 ,-Sz * ProjNear, 0
    };
    
    return out1;
}

static const float4x4 LightViewMatrix = inverseCtrl(LightObjectMatrix);
static const float4x4 LightWorldViewMatrix = mul(WorldMatrix,LightViewMatrix);
static const float4x4 LightWorldViewProjMatrix = mul(LightWorldViewMatrix, GetLightProjMatrix());

//�����x�N�g��
static const float3 LightAxisDirection = normalize(mul(float3(0,0,1), LightObjectMatrix).xyz);

////////////////////////////////////////////////////////////////////////////////////////////

