xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 174;
 -0.28001;0.41771;0.09756;,
 0.28001;0.41771;0.09756;,
 0.28001;0.19857;-0.20405;,
 -0.28001;0.19857;-0.20405;,
 0.28001;0.41455;0.11751;,
 0.28001;0.41771;0.09756;,
 -0.28001;0.41771;0.09756;,
 -0.28001;0.41455;0.11751;,
 0.29429;0.18702;-0.19565;,
 0.28001;0.19857;-0.20405;,
 0.29429;0.40615;0.10596;,
 -0.28001;0.17862;-0.20721;,
 -0.28001;0.19857;-0.20405;,
 0.28001;0.17862;-0.20721;,
 -0.29429;0.40615;0.10596;,
 -0.29429;0.18702;-0.19565;,
 0.29429;0.25338;0.21695;,
 0.29429;0.03424;-0.08466;,
 0.28001;0.26178;0.22851;,
 0.29429;0.02473;-0.06213;,
 0.29429;0.22887;0.21933;,
 0.28001;0.02585;-0.09621;,
 0.28001;0.23727;0.23088;,
 0.28001;0.01633;-0.07368;,
 -0.29429;0.25338;0.21695;,
 -0.29429;0.03424;-0.08466;,
 -0.28001;0.26178;0.22851;,
 -0.28001;0.02585;-0.09621;,
 -0.29429;0.22887;0.21933;,
 -0.29429;0.02473;-0.06213;,
 -0.28001;0.23727;0.23088;,
 -0.28001;0.01633;-0.07368;,
 -0.28001;0.01409;0.15133;,
 0.28001;0.01409;0.15133;,
 -0.29429;0.02704;0.15735;,
 0.29429;0.02704;0.15735;,
 -0.28001;0.02909;0.17149;,
 0.28001;0.02909;0.17149;,
 0.22854;0.02233;-0.06076;,
 0.23963;0.02225;-0.05617;,
 0.23963;0.00252;-0.05651;,
 0.22854;0.00260;-0.06111;,
 0.24423;0.02206;-0.04507;,
 0.24423;0.00232;-0.04542;,
 0.23963;0.02186;-0.03398;,
 0.23963;0.00213;-0.03432;,
 0.22854;0.02178;-0.02938;,
 0.22854;0.00205;-0.02973;,
 0.21744;0.02186;-0.03398;,
 0.21744;0.00213;-0.03432;,
 0.21284;0.02206;-0.04507;,
 0.21284;0.00232;-0.04542;,
 0.21744;0.02225;-0.05617;,
 0.21744;0.00252;-0.05651;,
 0.22854;0.02233;-0.06076;,
 0.22854;0.00260;-0.06111;,
 0.22854;0.02206;-0.04507;,
 0.22854;0.02206;-0.04507;,
 0.22854;0.02206;-0.04507;,
 0.22854;0.02206;-0.04507;,
 0.22854;0.02206;-0.04507;,
 0.22854;0.02206;-0.04507;,
 0.22854;0.02206;-0.04507;,
 0.22854;0.02206;-0.04507;,
 0.22854;0.00232;-0.04542;,
 0.22854;0.00232;-0.04542;,
 0.22854;0.00232;-0.04542;,
 0.22854;0.00232;-0.04542;,
 0.22854;0.00232;-0.04542;,
 0.22854;0.00232;-0.04542;,
 0.22854;0.00232;-0.04542;,
 0.22854;0.00232;-0.04542;,
 -0.23280;0.02233;-0.06076;,
 -0.22170;0.02225;-0.05617;,
 -0.22170;0.00252;-0.05651;,
 -0.23280;0.00260;-0.06111;,
 -0.21711;0.02206;-0.04507;,
 -0.21711;0.00232;-0.04542;,
 -0.22170;0.02186;-0.03398;,
 -0.22170;0.00213;-0.03432;,
 -0.23280;0.02178;-0.02938;,
 -0.23280;0.00205;-0.02973;,
 -0.24389;0.02186;-0.03398;,
 -0.24389;0.00213;-0.03432;,
 -0.24849;0.02206;-0.04507;,
 -0.24849;0.00232;-0.04542;,
 -0.24389;0.02225;-0.05617;,
 -0.24389;0.00252;-0.05651;,
 -0.23280;0.02233;-0.06076;,
 -0.23280;0.00260;-0.06111;,
 -0.23280;0.02206;-0.04507;,
 -0.23280;0.02206;-0.04507;,
 -0.23280;0.02206;-0.04507;,
 -0.23280;0.02206;-0.04507;,
 -0.23280;0.02206;-0.04507;,
 -0.23280;0.02206;-0.04507;,
 -0.23280;0.02206;-0.04507;,
 -0.23280;0.02206;-0.04507;,
 -0.23280;0.00232;-0.04542;,
 -0.23280;0.00232;-0.04542;,
 -0.23280;0.00232;-0.04542;,
 -0.23280;0.00232;-0.04542;,
 -0.23280;0.00232;-0.04542;,
 -0.23280;0.00232;-0.04542;,
 -0.23280;0.00232;-0.04542;,
 -0.23280;0.00232;-0.04542;,
 0.22854;0.02046;0.10851;,
 0.23963;0.02054;0.11310;,
 0.23963;0.00081;0.11345;,
 0.22854;0.00073;0.10885;,
 0.24423;0.02074;0.12420;,
 0.24423;0.00100;0.12454;,
 0.23963;0.02093;0.13529;,
 0.23963;0.00120;0.13564;,
 0.22854;0.02101;0.13989;,
 0.22854;0.00128;0.14023;,
 0.21744;0.02093;0.13529;,
 0.21744;0.00120;0.13564;,
 0.21284;0.02074;0.12420;,
 0.21284;0.00100;0.12454;,
 0.21744;0.02054;0.11310;,
 0.21744;0.00081;0.11345;,
 0.22854;0.02046;0.10851;,
 0.22854;0.00073;0.10885;,
 0.22854;0.02074;0.12420;,
 0.22854;0.02074;0.12420;,
 0.22854;0.02074;0.12420;,
 0.22854;0.02074;0.12420;,
 0.22854;0.02074;0.12420;,
 0.22854;0.02074;0.12420;,
 0.22854;0.02074;0.12420;,
 0.22854;0.02074;0.12420;,
 0.22854;0.00100;0.12454;,
 0.22854;0.00100;0.12454;,
 0.22854;0.00100;0.12454;,
 0.22854;0.00100;0.12454;,
 0.22854;0.00100;0.12454;,
 0.22854;0.00100;0.12454;,
 0.22854;0.00100;0.12454;,
 0.22854;0.00100;0.12454;,
 -0.23280;0.02046;0.10851;,
 -0.22170;0.02054;0.11310;,
 -0.22170;0.00081;0.11345;,
 -0.23280;0.00073;0.10885;,
 -0.21711;0.02074;0.12420;,
 -0.21711;0.00100;0.12454;,
 -0.22170;0.02093;0.13529;,
 -0.22170;0.00120;0.13564;,
 -0.23280;0.02101;0.13989;,
 -0.23280;0.00128;0.14023;,
 -0.24389;0.02093;0.13529;,
 -0.24389;0.00120;0.13564;,
 -0.24849;0.02074;0.12420;,
 -0.24849;0.00100;0.12454;,
 -0.24389;0.02054;0.11310;,
 -0.24389;0.00081;0.11345;,
 -0.23280;0.02046;0.10851;,
 -0.23280;0.00073;0.10885;,
 -0.23280;0.02074;0.12420;,
 -0.23280;0.02074;0.12420;,
 -0.23280;0.02074;0.12420;,
 -0.23280;0.02074;0.12420;,
 -0.23280;0.02074;0.12420;,
 -0.23280;0.02074;0.12420;,
 -0.23280;0.02074;0.12420;,
 -0.23280;0.02074;0.12420;,
 -0.23280;0.00100;0.12454;,
 -0.23280;0.00100;0.12454;,
 -0.23280;0.00100;0.12454;,
 -0.23280;0.00100;0.12454;,
 -0.23280;0.00100;0.12454;,
 -0.23280;0.00100;0.12454;,
 -0.23280;0.00100;0.12454;,
 -0.23280;0.00100;0.12454;;
 
 132;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,5,10;,
 4;11,12,9,13;,
 4;14,6,12,15;,
 3;14,7,6;,
 3;4,10,5;,
 3;8,13,9;,
 3;11,15,12;,
 4;10,16,17,8;,
 4;18,16,10,4;,
 4;19,17,16,20;,
 4;13,8,17,21;,
 4;18,22,20,16;,
 4;19,23,21,17;,
 4;24,14,15,25;,
 4;7,14,24,26;,
 4;27,25,15,11;,
 4;28,24,25,29;,
 4;28,30,26,24;,
 4;27,31,29,25;,
 4;26,18,4,7;,
 4;22,18,26,30;,
 4;11,13,21,27;,
 4;31,27,21,23;,
 4;32,31,23,33;,
 4;29,31,32,34;,
 4;35,33,23,19;,
 4;36,32,33,37;,
 3;36,34,32;,
 3;35,37,33;,
 4;36,37,22,30;,
 4;20,22,37,35;,
 4;34,36,30,28;,
 3;29,34,28;,
 3;20,35,19;,
 4;38,39,40,41;,
 4;39,42,43,40;,
 4;42,44,45,43;,
 4;44,46,47,45;,
 4;46,48,49,47;,
 4;48,50,51,49;,
 4;50,52,53,51;,
 4;52,54,55,53;,
 3;56,39,38;,
 3;57,42,39;,
 3;58,44,42;,
 3;59,46,44;,
 3;60,48,46;,
 3;61,50,48;,
 3;62,52,50;,
 3;63,54,52;,
 3;64,41,40;,
 3;65,40,43;,
 3;66,43,45;,
 3;67,45,47;,
 3;68,47,49;,
 3;69,49,51;,
 3;70,51,53;,
 3;71,53,55;,
 4;72,73,74,75;,
 4;73,76,77,74;,
 4;76,78,79,77;,
 4;78,80,81,79;,
 4;80,82,83,81;,
 4;82,84,85,83;,
 4;84,86,87,85;,
 4;86,88,89,87;,
 3;90,73,72;,
 3;91,76,73;,
 3;92,78,76;,
 3;93,80,78;,
 3;94,82,80;,
 3;95,84,82;,
 3;96,86,84;,
 3;97,88,86;,
 3;98,75,74;,
 3;99,74,77;,
 3;100,77,79;,
 3;101,79,81;,
 3;102,81,83;,
 3;103,83,85;,
 3;104,85,87;,
 3;105,87,89;,
 4;106,107,108,109;,
 4;107,110,111,108;,
 4;110,112,113,111;,
 4;112,114,115,113;,
 4;114,116,117,115;,
 4;116,118,119,117;,
 4;118,120,121,119;,
 4;120,122,123,121;,
 3;124,107,106;,
 3;125,110,107;,
 3;126,112,110;,
 3;127,114,112;,
 3;128,116,114;,
 3;129,118,116;,
 3;130,120,118;,
 3;131,122,120;,
 3;132,109,108;,
 3;133,108,111;,
 3;134,111,113;,
 3;135,113,115;,
 3;136,115,117;,
 3;137,117,119;,
 3;138,119,121;,
 3;139,121,123;,
 4;140,141,142,143;,
 4;141,144,145,142;,
 4;144,146,147,145;,
 4;146,148,149,147;,
 4;148,150,151,149;,
 4;150,152,153,151;,
 4;152,154,155,153;,
 4;154,156,157,155;,
 3;158,141,140;,
 3;159,144,141;,
 3;160,146,144;,
 3;161,148,146;,
 3;162,150,148;,
 3;163,152,150;,
 3;164,154,152;,
 3;165,156,154;,
 3;166,143,142;,
 3;167,142,145;,
 3;168,145,147;,
 3;169,147,149;,
 3;170,149,151;,
 3;171,151,153;,
 3;172,153,155;,
 3;173,155,157;;
 
 MeshMaterialList {
  2;
  132;
  1,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\tex\\br12m_black_co.tga";
   }
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data\\tex\\br12m_body_co.tga";
   }
  }
 }
 MeshNormals {
  129;
  -0.367000;0.907229;-0.205537;,
  0.367000;0.907229;-0.205537;,
  0.366991;0.475813;-0.799324;,
  -0.366991;0.475813;-0.799324;,
  0.854767;0.512624;0.081174;,
  0.921789;0.134036;0.363785;,
  0.921695;-0.306205;-0.238154;,
  0.854759;0.081201;-0.512634;,
  -0.921789;0.134036;0.363785;,
  -0.854767;0.512624;0.081174;,
  -0.854759;0.081201;-0.512634;,
  -0.921695;-0.306205;-0.238154;,
  -0.376840;0.324938;0.867414;,
  0.376840;0.324938;0.867414;,
  0.367014;0.799339;0.475771;,
  -0.367014;0.799339;0.475771;,
  -0.366994;-0.205492;-0.907242;,
  0.366994;-0.205492;-0.907242;,
  0.376542;-0.727974;-0.572949;,
  -0.376542;-0.727974;-0.572949;,
  -0.279429;-0.909692;0.307214;,
  -0.335327;-0.923302;-0.187267;,
  0.335327;-0.923302;-0.187267;,
  0.279429;-0.909692;0.307214;,
  -0.281604;-0.554492;0.783095;,
  0.281604;-0.554492;0.783095;,
  0.337624;-0.089355;0.937030;,
  -0.337624;-0.089355;0.937030;,
  -0.904108;-0.419274;-0.082446;,
  -0.767998;-0.513966;0.382123;,
  -0.905052;-0.042738;0.423147;,
  0.905052;-0.042738;0.423147;,
  0.767998;-0.513966;0.382123;,
  0.904108;-0.419274;-0.082446;,
  0.000000;0.999848;0.017441;,
  0.000002;0.017474;-0.999847;,
  0.707112;0.012345;-0.706994;,
  1.000000;0.000011;-0.000016;,
  0.707096;-0.012308;0.707011;,
  0.000002;-0.017421;0.999848;,
  -0.707097;-0.012308;0.707009;,
  -1.000000;0.000011;-0.000016;,
  -0.707113;0.012345;-0.706992;,
  0.000000;-0.999848;-0.017447;,
  0.000000;0.999848;0.017441;,
  0.000031;0.017474;-0.999847;,
  0.707133;0.012345;-0.706973;,
  0.707117;-0.012307;0.706989;,
  0.000031;-0.017421;0.999848;,
  -0.707098;-0.012308;0.707008;,
  -1.000000;0.000011;-0.000016;,
  -0.707114;0.012345;-0.706992;,
  0.000000;-0.999848;-0.017447;,
  -0.000000;0.999848;-0.017453;,
  0.000002;-0.017471;-0.999847;,
  0.707123;-0.012353;-0.706982;,
  1.000000;0.000000;0.000001;,
  0.707124;0.012356;0.706982;,
  0.000002;0.017475;0.999847;,
  -0.707126;0.012356;0.706980;,
  -1.000000;0.000000;0.000001;,
  -0.707125;-0.012353;-0.706981;,
  0.000000;-0.999848;0.017445;,
  -0.000000;0.999848;-0.017453;,
  0.000031;-0.017471;-0.999847;,
  0.707145;-0.012353;-0.706961;,
  0.707146;0.012355;0.706960;,
  0.000031;0.017475;0.999847;,
  -0.707127;0.012356;0.706979;,
  -1.000000;0.000000;0.000001;,
  -0.707126;-0.012353;-0.706980;,
  0.000000;-0.999848;0.017445;,
  0.000069;0.999849;0.017362;,
  0.000000;0.999848;0.017431;,
  0.000000;0.999849;0.017389;,
  -0.000033;0.999847;0.017520;,
  -0.000000;0.999846;0.017553;,
  0.000033;0.999847;0.017520;,
  0.000000;0.999849;0.017389;,
  -0.000069;0.999849;0.017362;,
  0.000000;-0.999848;-0.017421;,
  0.000029;-0.999848;-0.017451;,
  0.000000;-0.999847;-0.017474;,
  -0.000024;-0.999848;-0.017443;,
  -0.000000;-0.999848;-0.017419;,
  0.000024;-0.999848;-0.017443;,
  0.000000;-0.999847;-0.017474;,
  -0.000029;-0.999848;-0.017451;,
  0.000069;0.999849;0.017362;,
  0.000000;0.999848;0.017431;,
  0.000000;0.999849;0.017389;,
  -0.000033;0.999847;0.017520;,
  -0.000000;0.999846;0.017553;,
  0.000033;0.999847;0.017520;,
  -0.000069;0.999849;0.017362;,
  0.000000;-0.999848;-0.017421;,
  0.000029;-0.999848;-0.017451;,
  0.000000;-0.999847;-0.017474;,
  -0.000024;-0.999848;-0.017443;,
  -0.000000;-0.999848;-0.017419;,
  0.000024;-0.999848;-0.017443;,
  -0.000029;-0.999848;-0.017451;,
  0.000027;0.999848;-0.017444;,
  0.000000;0.999848;-0.017418;,
  0.000000;0.999847;-0.017480;,
  -0.000028;0.999848;-0.017461;,
  -0.000000;0.999848;-0.017433;,
  0.000028;0.999848;-0.017461;,
  -0.000027;0.999848;-0.017445;,
  -0.000000;-0.999848;0.017415;,
  -0.000018;-0.999848;0.017434;,
  0.000000;-0.999847;0.017468;,
  0.000029;-0.999848;0.017456;,
  0.000000;-0.999848;0.017426;,
  -0.000029;-0.999848;0.017456;,
  0.000018;-0.999848;0.017434;,
  0.000027;0.999848;-0.017445;,
  0.000000;0.999848;-0.017418;,
  -0.000028;0.999848;-0.017461;,
  -0.000000;0.999848;-0.017433;,
  0.000028;0.999848;-0.017461;,
  0.000000;0.999847;-0.017480;,
  -0.000027;0.999848;-0.017445;,
  -0.000000;-0.999848;0.017415;,
  -0.000018;-0.999848;0.017434;,
  0.000029;-0.999848;0.017456;,
  0.000000;-0.999848;0.017426;,
  -0.000029;-0.999848;0.017456;,
  0.000018;-0.999848;0.017434;;
  132;
  4;0,1,2,3;,
  4;14,1,0,15;,
  4;7,2,1,4;,
  4;16,3,2,17;,
  4;9,0,3,10;,
  3;9,15,0;,
  3;14,4,1;,
  3;7,17,2;,
  3;16,10,3;,
  4;4,5,6,7;,
  4;13,5,4,14;,
  4;33,6,5,31;,
  4;17,7,6,18;,
  4;13,26,31,5;,
  4;33,22,18,6;,
  4;8,9,10,11;,
  4;15,9,8,12;,
  4;19,11,10,16;,
  4;30,8,11,28;,
  4;30,27,12,8;,
  4;19,21,28,11;,
  4;12,13,14,15;,
  4;26,13,12,27;,
  4;16,17,18,19;,
  4;21,19,18,22;,
  4;20,21,22,23;,
  4;28,21,20,29;,
  4;32,23,22,33;,
  4;24,20,23,25;,
  3;24,29,20;,
  3;32,25,23;,
  4;24,25,26,27;,
  4;31,26,25,32;,
  4;29,24,27,30;,
  3;28,29,30;,
  3;31,32,33;,
  4;35,36,36,35;,
  4;36,37,37,36;,
  4;37,38,38,37;,
  4;38,39,39,38;,
  4;39,40,40,39;,
  4;40,41,41,40;,
  4;41,42,42,41;,
  4;42,35,35,42;,
  3;34,72,73;,
  3;34,74,72;,
  3;34,75,74;,
  3;34,76,75;,
  3;34,77,76;,
  3;34,78,77;,
  3;34,79,78;,
  3;34,73,79;,
  3;43,80,81;,
  3;43,81,82;,
  3;43,82,83;,
  3;43,83,84;,
  3;43,84,85;,
  3;43,85,86;,
  3;43,86,87;,
  3;43,87,80;,
  4;45,46,46,45;,
  4;46,37,37,46;,
  4;37,47,47,37;,
  4;47,48,48,47;,
  4;48,49,49,48;,
  4;49,50,50,49;,
  4;50,51,51,50;,
  4;51,45,45,51;,
  3;44,88,89;,
  3;44,90,88;,
  3;44,91,90;,
  3;44,92,91;,
  3;44,93,92;,
  3;44,78,93;,
  3;44,94,78;,
  3;44,89,94;,
  3;52,95,96;,
  3;52,96,97;,
  3;52,97,98;,
  3;52,98,99;,
  3;52,99,100;,
  3;52,100,97;,
  3;52,97,101;,
  3;52,101,95;,
  4;54,55,55,54;,
  4;55,56,56,55;,
  4;56,57,57,56;,
  4;57,58,58,57;,
  4;58,59,59,58;,
  4;59,60,60,59;,
  4;60,61,61,60;,
  4;61,54,54,61;,
  3;53,102,103;,
  3;53,104,102;,
  3;53,105,104;,
  3;53,106,105;,
  3;53,107,106;,
  3;53,104,107;,
  3;53,108,104;,
  3;53,103,108;,
  3;62,109,110;,
  3;62,110,111;,
  3;62,111,112;,
  3;62,112,113;,
  3;62,113,114;,
  3;62,114,111;,
  3;62,111,115;,
  3;62,115,109;,
  4;64,65,65,64;,
  4;65,56,56,65;,
  4;56,66,66,56;,
  4;66,67,67,66;,
  4;67,68,68,67;,
  4;68,69,69,68;,
  4;69,70,70,69;,
  4;70,64,64,70;,
  3;63,116,117;,
  3;63,104,116;,
  3;63,118,104;,
  3;63,119,118;,
  3;63,120,119;,
  3;63,121,120;,
  3;63,122,121;,
  3;63,117,122;,
  3;71,123,124;,
  3;71,124,111;,
  3;71,111,125;,
  3;71,125,126;,
  3;71,126,127;,
  3;71,127,111;,
  3;71,111,128;,
  3;71,128,123;;
 }
 MeshTextureCoords {
  174;
  0.205440;0.308620;,
  0.746600;0.308620;,
  0.746600;0.693790;,
  0.205440;0.693790;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.062500;0.000000;,
  0.187500;0.000000;,
  0.312500;0.000000;,
  0.437500;0.000000;,
  0.562500;0.000000;,
  0.687500;0.000000;,
  0.812500;0.000000;,
  0.937500;0.000000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.062500;0.000000;,
  0.187500;0.000000;,
  0.312500;0.000000;,
  0.437500;0.000000;,
  0.562500;0.000000;,
  0.687500;0.000000;,
  0.812500;0.000000;,
  0.937500;0.000000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.062500;0.000000;,
  0.187500;0.000000;,
  0.312500;0.000000;,
  0.437500;0.000000;,
  0.562500;0.000000;,
  0.687500;0.000000;,
  0.812500;0.000000;,
  0.937500;0.000000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;,
  0.000000;0.000000;,
  0.125000;0.000000;,
  0.125000;1.000000;,
  0.000000;1.000000;,
  0.250000;0.000000;,
  0.250000;1.000000;,
  0.375000;0.000000;,
  0.375000;1.000000;,
  0.500000;0.000000;,
  0.500000;1.000000;,
  0.625000;0.000000;,
  0.625000;1.000000;,
  0.750000;0.000000;,
  0.750000;1.000000;,
  0.875000;0.000000;,
  0.875000;1.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.062500;0.000000;,
  0.187500;0.000000;,
  0.312500;0.000000;,
  0.437500;0.000000;,
  0.562500;0.000000;,
  0.687500;0.000000;,
  0.812500;0.000000;,
  0.937500;0.000000;,
  0.062500;1.000000;,
  0.187500;1.000000;,
  0.312500;1.000000;,
  0.437500;1.000000;,
  0.562500;1.000000;,
  0.687500;1.000000;,
  0.812500;1.000000;,
  0.937500;1.000000;;
 }
}
