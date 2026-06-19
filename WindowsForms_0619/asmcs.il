
//  Microsoft (R) .NET Framework IL Disassembler.  Version 4.8.3928.0
//  Copyright (c) Microsoft Corporation. All rights reserved.



// Metadata version: v4.0.30319
.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 4:0:0:0
}
.assembly extern UnityEngine.CoreModule
{
  .ver 0:0:0:0
}
.assembly extern UnityEngine.ParticleSystemModule
{
  .ver 0:0:0:0
}
.assembly extern Unity.TextMeshPro
{
  .ver 0:0:0:0
}
.assembly extern UnityEngine.UIModule
{
  .ver 0:0:0:0
}
.assembly extern UnityEngine.PhysicsModule
{
  .ver 0:0:0:0
}
.assembly extern System
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 4:0:0:0
}
.assembly extern UnityEngine.InputLegacyModule
{
  .ver 0:0:0:0
}
.assembly 'Assembly-CSharp'
{
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::.ctor(int32) = ( 01 00 08 00 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::.ctor() = ( 01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
                                                                                                             63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01 )       // ceptionThrows.

  // --- 다음 사용자 지정 특성이 자동으로 추가됩니다. 주석 처리를 제거하지 마십시오. -------
  //  .custom instance void [mscorlib]System.Diagnostics.DebuggableAttribute::.ctor(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) = ( 01 00 02 00 00 00 00 00 ) 

  .hash algorithm 0x00008004
  .ver 0:0:0:0
}
.module 'Assembly-CSharp.dll'
// MVID: {F12FCF93-06CC-4D1A-BE03-2E78D8338897}
.imagebase 0x10000000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00000001    //  ILONLY
// Image base: 0x05820000


// =============== CLASS MEMBERS DECLARATION ===================

.class public auto ansi beforefieldinit SpawnEffect
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public float32 spawnEffectTime
  .field public float32 pause
  .field public class [UnityEngine.CoreModule]UnityEngine.AnimationCurve fadeIn
  .field private class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem ps
  .field private float32 timer
  .field private class [UnityEngine.CoreModule]UnityEngine.Renderer _renderer
  .field private int32 shaderProperty
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       77 (0x4d)
    .maxstack  2
    .locals init (valuetype [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem/MainModule V_0)
    IL_0000:  ldarg.0
    IL_0001:  ldstr      "_cutoff"
    IL_0006:  call       int32 [UnityEngine.CoreModule]UnityEngine.Shader::PropertyToID(string)
    IL_000b:  stfld      int32 SpawnEffect::shaderProperty
    IL_0010:  ldarg.0
    IL_0011:  ldarg.0
    IL_0012:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.CoreModule]UnityEngine.Renderer>()
    IL_0017:  stfld      class [UnityEngine.CoreModule]UnityEngine.Renderer SpawnEffect::_renderer
    IL_001c:  ldarg.0
    IL_001d:  ldarg.0
    IL_001e:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponentInChildren<class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem>()
    IL_0023:  stfld      class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem SpawnEffect::ps
    IL_0028:  ldarg.0
    IL_0029:  ldfld      class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem SpawnEffect::ps
    IL_002e:  callvirt   instance valuetype [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem/MainModule [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem::get_main()
    IL_0033:  stloc.0
    IL_0034:  ldloca.s   V_0
    IL_0036:  ldarg.0
    IL_0037:  ldfld      float32 SpawnEffect::spawnEffectTime
    IL_003c:  call       instance void [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem/MainModule::set_duration(float32)
    IL_0041:  ldarg.0
    IL_0042:  ldfld      class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem SpawnEffect::ps
    IL_0047:  callvirt   instance void [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem::Play()
    IL_004c:  ret
  } // end of method SpawnEffect::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       119 (0x77)
    .maxstack  6
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32 SpawnEffect::timer
    IL_0006:  ldarg.0
    IL_0007:  ldfld      float32 SpawnEffect::spawnEffectTime
    IL_000c:  ldarg.0
    IL_000d:  ldfld      float32 SpawnEffect::pause
    IL_0012:  add
    IL_0013:  bge.un.s   IL_0029

    IL_0015:  ldarg.0
    IL_0016:  ldarg.0
    IL_0017:  ldfld      float32 SpawnEffect::timer
    IL_001c:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0021:  add
    IL_0022:  stfld      float32 SpawnEffect::timer
    IL_0027:  br.s       IL_003f

    IL_0029:  ldarg.0
    IL_002a:  ldfld      class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem SpawnEffect::ps
    IL_002f:  callvirt   instance void [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem::Play()
    IL_0034:  ldarg.0
    IL_0035:  ldc.r4     0.0
    IL_003a:  stfld      float32 SpawnEffect::timer
    IL_003f:  ldarg.0
    IL_0040:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Renderer SpawnEffect::_renderer
    IL_0045:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Material [UnityEngine.CoreModule]UnityEngine.Renderer::get_material()
    IL_004a:  ldarg.0
    IL_004b:  ldfld      int32 SpawnEffect::shaderProperty
    IL_0050:  ldarg.0
    IL_0051:  ldfld      class [UnityEngine.CoreModule]UnityEngine.AnimationCurve SpawnEffect::fadeIn
    IL_0056:  ldc.r4     0.0
    IL_005b:  ldarg.0
    IL_005c:  ldfld      float32 SpawnEffect::spawnEffectTime
    IL_0061:  ldarg.0
    IL_0062:  ldfld      float32 SpawnEffect::timer
    IL_0067:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::InverseLerp(float32,
                                                                                        float32,
                                                                                        float32)
    IL_006c:  callvirt   instance float32 [UnityEngine.CoreModule]UnityEngine.AnimationCurve::Evaluate(float32)
    IL_0071:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Material::SetFloat(int32,
                                                                                              float32)
    IL_0076:  ret
  } // end of method SpawnEffect::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       29 (0x1d)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     2.
    IL_0006:  stfld      float32 SpawnEffect::spawnEffectTime
    IL_000b:  ldarg.0
    IL_000c:  ldc.r4     1.
    IL_0011:  stfld      float32 SpawnEffect::pause
    IL_0016:  ldarg.0
    IL_0017:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_001c:  ret
  } // end of method SpawnEffect::.ctor

} // end of class SpawnEffect

.class public auto ansi beforefieldinit RampAsset
       extends [UnityEngine.CoreModule]UnityEngine.ScriptableObject
{
  .custom instance void [UnityEngine.CoreModule]UnityEngine.CreateAssetMenuAttribute::.ctor() = ( 01 00 00 00 ) 
  .field public class [UnityEngine.CoreModule]UnityEngine.Gradient gradient
  .field public int32 size
  .field public bool up
  .field public bool overwriteExisting
  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       33 (0x21)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Gradient::.ctor()
    IL_0006:  stfld      class [UnityEngine.CoreModule]UnityEngine.Gradient RampAsset::gradient
    IL_000b:  ldarg.0
    IL_000c:  ldc.i4.s   16
    IL_000e:  stfld      int32 RampAsset::size
    IL_0013:  ldarg.0
    IL_0014:  ldc.i4.1
    IL_0015:  stfld      bool RampAsset::overwriteExisting
    IL_001a:  ldarg.0
    IL_001b:  call       instance void [UnityEngine.CoreModule]UnityEngine.ScriptableObject::.ctor()
    IL_0020:  ret
  } // end of method RampAsset::.ctor

} // end of class RampAsset

.class public auto ansi beforefieldinit AdjustTimeScale
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field private class [Unity.TextMeshPro]TMPro.TextMeshProUGUI textMesh
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       13 (0xd)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.0
    IL_0002:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [Unity.TextMeshPro]TMPro.TextMeshProUGUI>()
    IL_0007:  stfld      class [Unity.TextMeshPro]TMPro.TextMeshProUGUI AdjustTimeScale::textMesh
    IL_000c:  ret
  } // end of method AdjustTimeScale::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       237 (0xed)
    .maxstack  4
    .locals init (float64 V_0)
    IL_0000:  ldstr      "Mouse ScrollWheel"
    IL_0005:  call       float32 [UnityEngine.InputLegacyModule]UnityEngine.Input::GetAxis(string)
    IL_000a:  ldc.r4     0.0
    IL_000f:  ble.un.s   IL_0078

    IL_0011:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_timeScale()
    IL_0016:  ldc.r4     1.
    IL_001b:  bge.un.s   IL_002d

    IL_001d:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_timeScale()
    IL_0022:  ldc.r4     0.1
    IL_0027:  add
    IL_0028:  call       void [UnityEngine.CoreModule]UnityEngine.Time::set_timeScale(float32)
    IL_002d:  ldc.r4     2.e-02
    IL_0032:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_timeScale()
    IL_0037:  mul
    IL_0038:  call       void [UnityEngine.CoreModule]UnityEngine.Time::set_fixedDeltaTime(float32)
    IL_003d:  ldarg.0
    IL_003e:  ldfld      class [Unity.TextMeshPro]TMPro.TextMeshProUGUI AdjustTimeScale::textMesh
    IL_0043:  ldnull
    IL_0044:  call       bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                        class [UnityEngine.CoreModule]UnityEngine.Object)
    IL_0049:  brfalse    IL_00ec

    IL_004e:  ldarg.0
    IL_004f:  ldfld      class [Unity.TextMeshPro]TMPro.TextMeshProUGUI AdjustTimeScale::textMesh
    IL_0054:  ldstr      "Time Scale : "
    IL_0059:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_timeScale()
    IL_005e:  conv.r8
    IL_005f:  ldc.i4.2
    IL_0060:  call       float64 [mscorlib]System.Math::Round(float64,
                                                              int32)
    IL_0065:  stloc.0
    IL_0066:  ldloca.s   V_0
    IL_0068:  call       instance string [mscorlib]System.Double::ToString()
    IL_006d:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0072:  callvirt   instance void [Unity.TextMeshPro]TMPro.TMP_Text::set_text(string)
    IL_0077:  ret

    IL_0078:  ldstr      "Mouse ScrollWheel"
    IL_007d:  call       float32 [UnityEngine.InputLegacyModule]UnityEngine.Input::GetAxis(string)
    IL_0082:  ldc.r4     0.0
    IL_0087:  bge.un.s   IL_00ec

    IL_0089:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_timeScale()
    IL_008e:  ldc.r4     0.2
    IL_0093:  blt.un.s   IL_00a5

    IL_0095:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_timeScale()
    IL_009a:  ldc.r4     0.1
    IL_009f:  sub
    IL_00a0:  call       void [UnityEngine.CoreModule]UnityEngine.Time::set_timeScale(float32)
    IL_00a5:  ldc.r4     2.e-02
    IL_00aa:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_timeScale()
    IL_00af:  mul
    IL_00b0:  call       void [UnityEngine.CoreModule]UnityEngine.Time::set_fixedDeltaTime(float32)
    IL_00b5:  ldarg.0
    IL_00b6:  ldfld      class [Unity.TextMeshPro]TMPro.TextMeshProUGUI AdjustTimeScale::textMesh
    IL_00bb:  ldnull
    IL_00bc:  call       bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                        class [UnityEngine.CoreModule]UnityEngine.Object)
    IL_00c1:  brfalse.s  IL_00ec

    IL_00c3:  ldarg.0
    IL_00c4:  ldfld      class [Unity.TextMeshPro]TMPro.TextMeshProUGUI AdjustTimeScale::textMesh
    IL_00c9:  ldstr      "Time Scale : "
    IL_00ce:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_timeScale()
    IL_00d3:  conv.r8
    IL_00d4:  ldc.i4.2
    IL_00d5:  call       float64 [mscorlib]System.Math::Round(float64,
                                                              int32)
    IL_00da:  stloc.0
    IL_00db:  ldloca.s   V_0
    IL_00dd:  call       instance string [mscorlib]System.Double::ToString()
    IL_00e2:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_00e7:  callvirt   instance void [Unity.TextMeshPro]TMPro.TMP_Text::set_text(string)
    IL_00ec:  ret
  } // end of method AdjustTimeScale::Update

  .method private hidebysig instance void 
          OnApplicationQuit() cil managed
  {
    // 코드 크기       21 (0x15)
    .maxstack  8
    IL_0000:  ldc.r4     1.
    IL_0005:  call       void [UnityEngine.CoreModule]UnityEngine.Time::set_timeScale(float32)
    IL_000a:  ldc.r4     2.e-02
    IL_000f:  call       void [UnityEngine.CoreModule]UnityEngine.Time::set_fixedDeltaTime(float32)
    IL_0014:  ret
  } // end of method AdjustTimeScale::OnApplicationQuit

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0006:  ret
  } // end of method AdjustTimeScale::.ctor

} // end of class AdjustTimeScale

.class public auto ansi beforefieldinit ProximityActivate
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public class [UnityEngine.CoreModule]UnityEngine.Transform distanceActivator
  .field public class [UnityEngine.CoreModule]UnityEngine.Transform lookAtActivator
  .field public float32 distance
  .field public class [UnityEngine.CoreModule]UnityEngine.Transform activator
  .field public bool activeState
  .field public class [UnityEngine.UIModule]UnityEngine.CanvasGroup target
  .field public bool lookAtCamera
  .field public bool enableInfoPanel
  .field public class [UnityEngine.CoreModule]UnityEngine.GameObject infoIcon
  .field private float32 alpha
  .field public class [UnityEngine.UIModule]UnityEngine.CanvasGroup infoPanel
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion originRotation
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion targetRotation
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       90 (0x5a)
    .maxstack  3
    IL_0000:  ldarg.0
    IL_0001:  ldarg.0
    IL_0002:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0007:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Transform::get_rotation()
    IL_000c:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion ProximityActivate::originRotation
    IL_0011:  ldarg.0
    IL_0012:  ldarg.0
    IL_0013:  ldfld      bool ProximityActivate::activeState
    IL_0018:  brtrue.s   IL_001d

    IL_001a:  ldc.i4.m1
    IL_001b:  br.s       IL_001e

    IL_001d:  ldc.i4.1
    IL_001e:  conv.r4
    IL_001f:  stfld      float32 ProximityActivate::alpha
    IL_0024:  ldarg.0
    IL_0025:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::activator
    IL_002a:  ldnull
    IL_002b:  call       bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                      class [UnityEngine.CoreModule]UnityEngine.Object)
    IL_0030:  brfalse.s  IL_0042

    IL_0032:  ldarg.0
    IL_0033:  call       class [UnityEngine.CoreModule]UnityEngine.Camera [UnityEngine.CoreModule]UnityEngine.Camera::get_main()
    IL_0038:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_003d:  stfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::activator
    IL_0042:  ldarg.0
    IL_0043:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject ProximityActivate::infoIcon
    IL_0048:  ldarg.0
    IL_0049:  ldfld      class [UnityEngine.UIModule]UnityEngine.CanvasGroup ProximityActivate::infoPanel
    IL_004e:  ldnull
    IL_004f:  call       bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                        class [UnityEngine.CoreModule]UnityEngine.Object)
    IL_0054:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SetActive(bool)
    IL_0059:  ret
  } // end of method ProximityActivate::Start

  .method private hidebysig instance bool 
          IsTargetNear() cil managed
  {
    // 코드 크기       194 (0xc2)
    .maxstack  3
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0,
             valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_1,
             valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_2)
    IL_0000:  ldarg.0
    IL_0001:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::distanceActivator
    IL_0006:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_000b:  ldarg.0
    IL_000c:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::activator
    IL_0011:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0016:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Subtraction(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_001b:  stloc.0
    IL_001c:  ldloca.s   V_0
    IL_001e:  call       instance float32 [UnityEngine.CoreModule]UnityEngine.Vector3::get_sqrMagnitude()
    IL_0023:  ldarg.0
    IL_0024:  ldfld      float32 ProximityActivate::distance
    IL_0029:  ldarg.0
    IL_002a:  ldfld      float32 ProximityActivate::distance
    IL_002f:  mul
    IL_0030:  bge.un     IL_00c0

    IL_0035:  ldarg.0
    IL_0036:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::lookAtActivator
    IL_003b:  ldnull
    IL_003c:  call       bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                        class [UnityEngine.CoreModule]UnityEngine.Object)
    IL_0041:  brfalse.s  IL_007f

    IL_0043:  ldarg.0
    IL_0044:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::lookAtActivator
    IL_0049:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_004e:  ldarg.0
    IL_004f:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::activator
    IL_0054:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0059:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Subtraction(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_005e:  stloc.2
    IL_005f:  ldarg.0
    IL_0060:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::activator
    IL_0065:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_forward()
    IL_006a:  ldloca.s   V_2
    IL_006c:  call       instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_normalized()
    IL_0071:  call       float32 [UnityEngine.CoreModule]UnityEngine.Vector3::Dot(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                  valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0076:  ldc.r4     0.94999999
    IL_007b:  ble.un.s   IL_007f

    IL_007d:  ldc.i4.1
    IL_007e:  ret

    IL_007f:  ldarg.0
    IL_0080:  ldfld      class [UnityEngine.UIModule]UnityEngine.CanvasGroup ProximityActivate::target
    IL_0085:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_008a:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_008f:  ldarg.0
    IL_0090:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::activator
    IL_0095:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_009a:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Subtraction(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_009f:  stloc.1
    IL_00a0:  ldarg.0
    IL_00a1:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::activator
    IL_00a6:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_forward()
    IL_00ab:  ldloca.s   V_1
    IL_00ad:  call       instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_normalized()
    IL_00b2:  call       float32 [UnityEngine.CoreModule]UnityEngine.Vector3::Dot(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                  valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_00b7:  ldc.r4     0.94999999
    IL_00bc:  ble.un.s   IL_00c0

    IL_00be:  ldc.i4.1
    IL_00bf:  ret

    IL_00c0:  ldc.i4.0
    IL_00c1:  ret
  } // end of method ProximityActivate::IsTargetNear

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       318 (0x13e)
    .maxstack  5
    IL_0000:  ldarg.0
    IL_0001:  ldfld      bool ProximityActivate::activeState
    IL_0006:  brtrue.s   IL_0024

    IL_0008:  ldarg.0
    IL_0009:  call       instance bool ProximityActivate::IsTargetNear()
    IL_000e:  brfalse.s  IL_0045

    IL_0010:  ldarg.0
    IL_0011:  ldc.r4     1.
    IL_0016:  stfld      float32 ProximityActivate::alpha
    IL_001b:  ldarg.0
    IL_001c:  ldc.i4.1
    IL_001d:  stfld      bool ProximityActivate::activeState
    IL_0022:  br.s       IL_0045

    IL_0024:  ldarg.0
    IL_0025:  call       instance bool ProximityActivate::IsTargetNear()
    IL_002a:  brtrue.s   IL_0045

    IL_002c:  ldarg.0
    IL_002d:  ldc.r4     -1.
    IL_0032:  stfld      float32 ProximityActivate::alpha
    IL_0037:  ldarg.0
    IL_0038:  ldc.i4.0
    IL_0039:  stfld      bool ProximityActivate::activeState
    IL_003e:  ldarg.0
    IL_003f:  ldc.i4.0
    IL_0040:  stfld      bool ProximityActivate::enableInfoPanel
    IL_0045:  ldarg.0
    IL_0046:  ldfld      class [UnityEngine.UIModule]UnityEngine.CanvasGroup ProximityActivate::target
    IL_004b:  ldarg.0
    IL_004c:  ldfld      class [UnityEngine.UIModule]UnityEngine.CanvasGroup ProximityActivate::target
    IL_0051:  callvirt   instance float32 [UnityEngine.UIModule]UnityEngine.CanvasGroup::get_alpha()
    IL_0056:  ldarg.0
    IL_0057:  ldfld      float32 ProximityActivate::alpha
    IL_005c:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0061:  mul
    IL_0062:  add
    IL_0063:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp01(float32)
    IL_0068:  callvirt   instance void [UnityEngine.UIModule]UnityEngine.CanvasGroup::set_alpha(float32)
    IL_006d:  ldarg.0
    IL_006e:  ldfld      class [UnityEngine.UIModule]UnityEngine.CanvasGroup ProximityActivate::infoPanel
    IL_0073:  ldnull
    IL_0074:  call       bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                        class [UnityEngine.CoreModule]UnityEngine.Object)
    IL_0079:  brfalse.s  IL_00d3

    IL_007b:  ldc.i4.s   32
    IL_007d:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKeyDown(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_0082:  brfalse.s  IL_0093

    IL_0084:  ldarg.0
    IL_0085:  ldarg.0
    IL_0086:  ldfld      bool ProximityActivate::enableInfoPanel
    IL_008b:  ldc.i4.0
    IL_008c:  ceq
    IL_008e:  stfld      bool ProximityActivate::enableInfoPanel
    IL_0093:  ldarg.0
    IL_0094:  ldfld      class [UnityEngine.UIModule]UnityEngine.CanvasGroup ProximityActivate::infoPanel
    IL_0099:  ldarg.0
    IL_009a:  ldfld      class [UnityEngine.UIModule]UnityEngine.CanvasGroup ProximityActivate::infoPanel
    IL_009f:  callvirt   instance float32 [UnityEngine.UIModule]UnityEngine.CanvasGroup::get_alpha()
    IL_00a4:  ldarg.0
    IL_00a5:  ldfld      bool ProximityActivate::enableInfoPanel
    IL_00aa:  brtrue.s   IL_00b3

    IL_00ac:  ldc.r4     0.0
    IL_00b1:  br.s       IL_00b9

    IL_00b3:  ldarg.0
    IL_00b4:  ldfld      float32 ProximityActivate::alpha
    IL_00b9:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Clamp01(float32)
    IL_00be:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_00c3:  ldc.r4     10.
    IL_00c8:  mul
    IL_00c9:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Lerp(float32,
                                                                                 float32,
                                                                                 float32)
    IL_00ce:  callvirt   instance void [UnityEngine.UIModule]UnityEngine.CanvasGroup::set_alpha(float32)
    IL_00d3:  ldarg.0
    IL_00d4:  ldfld      bool ProximityActivate::lookAtCamera
    IL_00d9:  brfalse.s  IL_013d

    IL_00db:  ldarg.0
    IL_00dc:  ldfld      bool ProximityActivate::activeState
    IL_00e1:  brfalse.s  IL_010b

    IL_00e3:  ldarg.0
    IL_00e4:  ldarg.0
    IL_00e5:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ProximityActivate::activator
    IL_00ea:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_00ef:  ldarg.0
    IL_00f0:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_00f5:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_00fa:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Subtraction(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_00ff:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::LookRotation(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0104:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion ProximityActivate::targetRotation
    IL_0109:  br.s       IL_0117

    IL_010b:  ldarg.0
    IL_010c:  ldarg.0
    IL_010d:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion ProximityActivate::originRotation
    IL_0112:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion ProximityActivate::targetRotation
    IL_0117:  ldarg.0
    IL_0118:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_011d:  ldarg.0
    IL_011e:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0123:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Transform::get_rotation()
    IL_0128:  ldarg.0
    IL_0129:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion ProximityActivate::targetRotation
    IL_012e:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0133:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::Slerp(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                        float32)
    IL_0138:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_rotation(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion)
    IL_013d:  ret
  } // end of method ProximityActivate::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       14 (0xe)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.1
    IL_0002:  stfld      bool ProximityActivate::lookAtCamera
    IL_0007:  ldarg.0
    IL_0008:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_000d:  ret
  } // end of method ProximityActivate::.ctor

} // end of class ProximityActivate

.class public auto ansi beforefieldinit SimpleCharacterMotor
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .custom instance void [UnityEngine.CoreModule]UnityEngine.RequireComponent::.ctor(class [mscorlib]System.Type) = ( 01 00 71 55 6E 69 74 79 45 6E 67 69 6E 65 2E 43   // ..qUnityEngine.C
                                                                                                                     68 61 72 61 63 74 65 72 43 6F 6E 74 72 6F 6C 6C   // haracterControll
                                                                                                                     65 72 2C 20 55 6E 69 74 79 45 6E 67 69 6E 65 2E   // er, UnityEngine.
                                                                                                                     50 68 79 73 69 63 73 4D 6F 64 75 6C 65 2C 20 56   // PhysicsModule, V
                                                                                                                     65 72 73 69 6F 6E 3D 30 2E 30 2E 30 2E 30 2C 20   // ersion=0.0.0.0, 
                                                                                                                     43 75 6C 74 75 72 65 3D 6E 65 75 74 72 61 6C 2C   // Culture=neutral,
                                                                                                                     20 50 75 62 6C 69 63 4B 65 79 54 6F 6B 65 6E 3D   //  PublicKeyToken=
                                                                                                                     6E 75 6C 6C 00 00 )                               // null..
  .field public valuetype [UnityEngine.CoreModule]UnityEngine.CursorLockMode cursorLockMode
  .field public bool cursorVisible
  .field public float32 walkSpeed
  .custom instance void [UnityEngine.CoreModule]UnityEngine.HeaderAttribute::.ctor(string) = ( 01 00 08 4D 6F 76 65 6D 65 6E 74 00 00 )          // ...Movement..
  .field public float32 runSpeed
  .field public float32 gravity
  .field public class [UnityEngine.CoreModule]UnityEngine.Transform cameraPivot
  .custom instance void [UnityEngine.CoreModule]UnityEngine.SpaceAttribute::.ctor() = ( 01 00 00 00 ) 
  .custom instance void [UnityEngine.CoreModule]UnityEngine.HeaderAttribute::.ctor(string) = ( 01 00 04 4C 6F 6F 6B 00 00 )                      // ...Look..
  .field public float32 lookSpeed
  .field public bool invertY
  .field public float32 movementAcceleration
  .custom instance void [UnityEngine.CoreModule]UnityEngine.SpaceAttribute::.ctor() = ( 01 00 00 00 ) 
  .custom instance void [UnityEngine.CoreModule]UnityEngine.HeaderAttribute::.ctor(string) = ( 01 00 09 53 6D 6F 6F 74 68 69 6E 67 00 00 )       // ...Smoothing..
  .field private class [UnityEngine.PhysicsModule]UnityEngine.CharacterController controller
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 movement
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 finalMovement
  .field private float32 speed
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion targetRotation
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion targetPivotRotation
  .method private hidebysig instance void 
          Awake() cil managed
  {
    // 코드 크기       55 (0x37)
    .maxstack  4
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion V_0)
    IL_0000:  ldarg.0
    IL_0001:  ldarg.0
    IL_0002:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.PhysicsModule]UnityEngine.CharacterController>()
    IL_0007:  stfld      class [UnityEngine.PhysicsModule]UnityEngine.CharacterController SimpleCharacterMotor::controller
    IL_000c:  ldarg.0
    IL_000d:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.CursorLockMode SimpleCharacterMotor::cursorLockMode
    IL_0012:  call       void [UnityEngine.CoreModule]UnityEngine.Cursor::set_lockState(valuetype [UnityEngine.CoreModule]UnityEngine.CursorLockMode)
    IL_0017:  ldarg.0
    IL_0018:  ldfld      bool SimpleCharacterMotor::cursorVisible
    IL_001d:  call       void [UnityEngine.CoreModule]UnityEngine.Cursor::set_visible(bool)
    IL_0022:  ldarg.0
    IL_0023:  ldarg.0
    IL_0024:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::get_identity()
    IL_0029:  dup
    IL_002a:  stloc.0
    IL_002b:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion SimpleCharacterMotor::targetPivotRotation
    IL_0030:  ldloc.0
    IL_0031:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion SimpleCharacterMotor::targetRotation
    IL_0036:  ret
  } // end of method SimpleCharacterMotor::Awake

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       13 (0xd)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void SimpleCharacterMotor::UpdateTranslation()
    IL_0006:  ldarg.0
    IL_0007:  call       instance void SimpleCharacterMotor::UpdateLookRotation()
    IL_000c:  ret
  } // end of method SimpleCharacterMotor::Update

  .method private hidebysig instance void 
          UpdateLookRotation() cil managed
  {
    // 코드 크기       219 (0xdb)
    .maxstack  5
    .locals init (float32 V_0,
             float32 V_1)
    IL_0000:  ldstr      "Mouse Y"
    IL_0005:  call       float32 [UnityEngine.InputLegacyModule]UnityEngine.Input::GetAxis(string)
    IL_000a:  stloc.0
    IL_000b:  ldstr      "Mouse X"
    IL_0010:  call       float32 [UnityEngine.InputLegacyModule]UnityEngine.Input::GetAxis(string)
    IL_0015:  stloc.1
    IL_0016:  ldloc.0
    IL_0017:  ldarg.0
    IL_0018:  ldfld      bool SimpleCharacterMotor::invertY
    IL_001d:  brtrue.s   IL_0022

    IL_001f:  ldc.i4.1
    IL_0020:  br.s       IL_0023

    IL_0022:  ldc.i4.m1
    IL_0023:  conv.r4
    IL_0024:  mul
    IL_0025:  stloc.0
    IL_0026:  ldarg.0
    IL_0027:  ldarg.0
    IL_0028:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_002d:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Transform::get_localRotation()
    IL_0032:  ldloc.1
    IL_0033:  ldarg.0
    IL_0034:  ldfld      float32 SimpleCharacterMotor::lookSpeed
    IL_0039:  mul
    IL_003a:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_003f:  mul
    IL_0040:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_up()
    IL_0045:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::AngleAxis(float32,
                                                                                                                                            valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_004a:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::op_Multiply(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                              valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion)
    IL_004f:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion SimpleCharacterMotor::targetRotation
    IL_0054:  ldarg.0
    IL_0055:  ldarg.0
    IL_0056:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform SimpleCharacterMotor::cameraPivot
    IL_005b:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Transform::get_localRotation()
    IL_0060:  ldloc.0
    IL_0061:  ldarg.0
    IL_0062:  ldfld      float32 SimpleCharacterMotor::lookSpeed
    IL_0067:  mul
    IL_0068:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_006d:  mul
    IL_006e:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_right()
    IL_0073:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::AngleAxis(float32,
                                                                                                                                            valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0078:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::op_Multiply(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                              valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion)
    IL_007d:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion SimpleCharacterMotor::targetPivotRotation
    IL_0082:  ldarg.0
    IL_0083:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0088:  ldarg.0
    IL_0089:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_008e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Transform::get_localRotation()
    IL_0093:  ldarg.0
    IL_0094:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion SimpleCharacterMotor::targetRotation
    IL_0099:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_009e:  ldc.r4     15.
    IL_00a3:  mul
    IL_00a4:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::Slerp(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                        float32)
    IL_00a9:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_localRotation(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion)
    IL_00ae:  ldarg.0
    IL_00af:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform SimpleCharacterMotor::cameraPivot
    IL_00b4:  ldarg.0
    IL_00b5:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform SimpleCharacterMotor::cameraPivot
    IL_00ba:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Transform::get_localRotation()
    IL_00bf:  ldarg.0
    IL_00c0:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion SimpleCharacterMotor::targetPivotRotation
    IL_00c5:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_00ca:  ldc.r4     15.
    IL_00cf:  mul
    IL_00d0:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::Slerp(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                        float32)
    IL_00d5:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_localRotation(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion)
    IL_00da:  ret
  } // end of method SimpleCharacterMotor::UpdateLookRotation

  .method private hidebysig instance void 
          UpdateTranslation() cil managed
  {
    // 코드 크기       205 (0xcd)
    .maxstack  5
    .locals init (float32 V_0,
             float32 V_1,
             bool V_2,
             valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_3)
    IL_0000:  ldarg.0
    IL_0001:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.CharacterController SimpleCharacterMotor::controller
    IL_0006:  callvirt   instance bool [UnityEngine.PhysicsModule]UnityEngine.CharacterController::get_isGrounded()
    IL_000b:  brfalse.s  IL_0072

    IL_000d:  ldstr      "Horizontal"
    IL_0012:  call       float32 [UnityEngine.InputLegacyModule]UnityEngine.Input::GetAxis(string)
    IL_0017:  stloc.0
    IL_0018:  ldstr      "Vertical"
    IL_001d:  call       float32 [UnityEngine.InputLegacyModule]UnityEngine.Input::GetAxis(string)
    IL_0022:  stloc.1
    IL_0023:  ldc.i4     0x130
    IL_0028:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_002d:  stloc.2
    IL_002e:  ldloca.s   V_3
    IL_0030:  ldloc.0
    IL_0031:  ldc.r4     0.0
    IL_0036:  ldloc.1
    IL_0037:  call       instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_003c:  ldarg.0
    IL_003d:  ldloc.2
    IL_003e:  brtrue.s   IL_0048

    IL_0040:  ldarg.0
    IL_0041:  ldfld      float32 SimpleCharacterMotor::walkSpeed
    IL_0046:  br.s       IL_004e

    IL_0048:  ldarg.0
    IL_0049:  ldfld      float32 SimpleCharacterMotor::runSpeed
    IL_004e:  stfld      float32 SimpleCharacterMotor::speed
    IL_0053:  ldarg.0
    IL_0054:  ldarg.0
    IL_0055:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_005a:  ldloc.3
    IL_005b:  ldarg.0
    IL_005c:  ldfld      float32 SimpleCharacterMotor::speed
    IL_0061:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Multiply(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_0066:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::TransformDirection(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_006b:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 SimpleCharacterMotor::movement
    IL_0070:  br.s       IL_008d

    IL_0072:  ldarg.0
    IL_0073:  ldflda     valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 SimpleCharacterMotor::movement
    IL_0078:  ldflda     float32 [UnityEngine.CoreModule]UnityEngine.Vector3::y
    IL_007d:  dup
    IL_007e:  ldind.r4
    IL_007f:  ldarg.0
    IL_0080:  ldfld      float32 SimpleCharacterMotor::gravity
    IL_0085:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_008a:  mul
    IL_008b:  sub
    IL_008c:  stind.r4
    IL_008d:  ldarg.0
    IL_008e:  ldarg.0
    IL_008f:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 SimpleCharacterMotor::finalMovement
    IL_0094:  ldarg.0
    IL_0095:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 SimpleCharacterMotor::movement
    IL_009a:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_009f:  ldarg.0
    IL_00a0:  ldfld      float32 SimpleCharacterMotor::movementAcceleration
    IL_00a5:  mul
    IL_00a6:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::Lerp(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                 valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                 float32)
    IL_00ab:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 SimpleCharacterMotor::finalMovement
    IL_00b0:  ldarg.0
    IL_00b1:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.CharacterController SimpleCharacterMotor::controller
    IL_00b6:  ldarg.0
    IL_00b7:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 SimpleCharacterMotor::finalMovement
    IL_00bc:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_00c1:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Multiply(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_00c6:  callvirt   instance valuetype [UnityEngine.PhysicsModule]UnityEngine.CollisionFlags [UnityEngine.PhysicsModule]UnityEngine.CharacterController::Move(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_00cb:  pop
    IL_00cc:  ret
  } // end of method SimpleCharacterMotor::UpdateTranslation

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       76 (0x4c)
    .maxstack  2
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.1
    IL_0002:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.CursorLockMode SimpleCharacterMotor::cursorLockMode
    IL_0007:  ldarg.0
    IL_0008:  ldc.r4     2.
    IL_000d:  stfld      float32 SimpleCharacterMotor::walkSpeed
    IL_0012:  ldarg.0
    IL_0013:  ldc.r4     4.
    IL_0018:  stfld      float32 SimpleCharacterMotor::runSpeed
    IL_001d:  ldarg.0
    IL_001e:  ldc.r4     9.8000002
    IL_0023:  stfld      float32 SimpleCharacterMotor::gravity
    IL_0028:  ldarg.0
    IL_0029:  ldc.r4     45.
    IL_002e:  stfld      float32 SimpleCharacterMotor::lookSpeed
    IL_0033:  ldarg.0
    IL_0034:  ldc.i4.1
    IL_0035:  stfld      bool SimpleCharacterMotor::invertY
    IL_003a:  ldarg.0
    IL_003b:  ldc.r4     1.
    IL_0040:  stfld      float32 SimpleCharacterMotor::movementAcceleration
    IL_0045:  ldarg.0
    IL_0046:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_004b:  ret
  } // end of method SimpleCharacterMotor::.ctor

} // end of class SimpleCharacterMotor

.class public auto ansi beforefieldinit Readme
       extends [UnityEngine.CoreModule]UnityEngine.ScriptableObject
{
  .class auto ansi serializable nested public beforefieldinit Section
         extends [mscorlib]System.Object
  {
    .field public string heading
    .field public string text
    .field public string linkText
    .field public string url
    .method public hidebysig specialname rtspecialname 
            instance void  .ctor() cil managed
    {
      // 코드 크기       7 (0x7)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0006:  ret
    } // end of method Section::.ctor

  } // end of class Section

  .field public class [UnityEngine.CoreModule]UnityEngine.Texture2D icon
  .field public string title
  .field public class Readme/Section[] sections
  .field public bool loadedLayout
  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [UnityEngine.CoreModule]UnityEngine.ScriptableObject::.ctor()
    IL_0006:  ret
  } // end of method Readme::.ctor

} // end of class Readme

.class public auto ansi beforefieldinit BoxReload
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public float32 yPosition
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method BoxReload::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method BoxReload::Update

  .method private hidebysig instance void 
          OnMouseDown() cil managed
  {
    // 코드 크기       84 (0x54)
    .maxstack  4
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0)
    IL_0000:  ldloca.s   V_0
    IL_0002:  ldarg.0
    IL_0003:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0008:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_000d:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0012:  ldc.r4     0.0
    IL_0017:  ldarg.0
    IL_0018:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001d:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0022:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::z
    IL_0027:  call       instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_002c:  ldarg.0
    IL_002d:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0032:  ldarg.0
    IL_0033:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0038:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_003d:  ldloc.0
    IL_003e:  ldc.r4     0.30000001
    IL_0043:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_0048:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_004d:  ldarg.0
    IL_004e:  call       instance void BoxReload::Reload()
    IL_0053:  ret
  } // end of method BoxReload::OnMouseDown

  .method private hidebysig instance void 
          OnMouseUp() cil managed
  {
    // 코드 크기       78 (0x4e)
    .maxstack  4
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0)
    IL_0000:  ldloca.s   V_0
    IL_0002:  ldarg.0
    IL_0003:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0008:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_000d:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0012:  ldc.r4     0.30000001
    IL_0017:  ldarg.0
    IL_0018:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001d:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0022:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::z
    IL_0027:  call       instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_002c:  ldarg.0
    IL_002d:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0032:  ldarg.0
    IL_0033:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0038:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_003d:  ldloc.0
    IL_003e:  ldc.r4     0.30000001
    IL_0043:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_0048:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_004d:  ret
  } // end of method BoxReload::OnMouseUp

  .method public hidebysig instance void 
          Reload() cil managed
  {
    // 코드 크기       63 (0x3f)
    .maxstack  8
    IL_0000:  ldstr      "BoxObject"
    IL_0005:  call       class [UnityEngine.CoreModule]UnityEngine.GameObject[] [UnityEngine.CoreModule]UnityEngine.GameObject::FindGameObjectsWithTag(string)
    IL_000a:  ldlen
    IL_000b:  conv.i4
    IL_000c:  ldc.i4.3
    IL_000d:  bge.s      IL_003e

    IL_000f:  ldstr      "Box"
    IL_0014:  call       class [UnityEngine.CoreModule]UnityEngine.Object [UnityEngine.CoreModule]UnityEngine.Resources::Load(string)
    IL_0019:  castclass  [UnityEngine.CoreModule]UnityEngine.GameObject
    IL_001e:  ldc.r4     0.0
    IL_0023:  ldarg.0
    IL_0024:  ldfld      float32 BoxReload::yPosition
    IL_0029:  ldc.r4     0.0
    IL_002e:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_0033:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::get_identity()
    IL_0038:  call       !!0 [UnityEngine.CoreModule]UnityEngine.Object::Instantiate<class [UnityEngine.CoreModule]UnityEngine.GameObject>(!!0,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion)
    IL_003d:  pop
    IL_003e:  ret
  } // end of method BoxReload::Reload

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       18 (0x12)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     5.
    IL_0006:  stfld      float32 BoxReload::yPosition
    IL_000b:  ldarg.0
    IL_000c:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0011:  ret
  } // end of method BoxReload::.ctor

} // end of class BoxReload

.class public auto ansi beforefieldinit CameraMoving
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public float32 speed
  .field private bool is_complete
  .field public float32 x
  .field public float32 y
  .field public float32 z
  .field public float32 x_angle
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 cameraPosition
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 cameraAngle
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       57 (0x39)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.0
    IL_0002:  ldfld      float32 CameraMoving::x
    IL_0007:  ldarg.0
    IL_0008:  ldfld      float32 CameraMoving::y
    IL_000d:  ldarg.0
    IL_000e:  ldfld      float32 CameraMoving::z
    IL_0013:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_0018:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 CameraMoving::cameraPosition
    IL_001d:  ldarg.0
    IL_001e:  ldarg.0
    IL_001f:  ldfld      float32 CameraMoving::x_angle
    IL_0024:  ldc.r4     0.0
    IL_0029:  ldc.r4     0.0
    IL_002e:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_0033:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 CameraMoving::cameraAngle
    IL_0038:  ret
  } // end of method CameraMoving::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       15 (0xf)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      bool CameraMoving::is_complete
    IL_0006:  brtrue.s   IL_000e

    IL_0008:  ldarg.0
    IL_0009:  call       instance void CameraMoving::CameraMovingShot()
    IL_000e:  ret
  } // end of method CameraMoving::Update

  .method private hidebysig instance void 
          CameraMovingShot() cil managed
  {
    // 코드 크기       152 (0x98)
    .maxstack  5
    IL_0000:  ldarg.0
    IL_0001:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0006:  ldarg.0
    IL_0007:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_000c:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0011:  ldarg.0
    IL_0012:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 CameraMoving::cameraPosition
    IL_0017:  ldarg.0
    IL_0018:  ldfld      float32 CameraMoving::speed
    IL_001d:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0022:  mul
    IL_0023:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_0028:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_002d:  ldarg.0
    IL_002e:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0033:  ldarg.0
    IL_0034:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0039:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
    IL_003e:  ldarg.0
    IL_003f:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 CameraMoving::cameraAngle
    IL_0044:  ldarg.0
    IL_0045:  ldfld      float32 CameraMoving::speed
    IL_004a:  ldc.r4     4.
    IL_004f:  mul
    IL_0050:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0055:  mul
    IL_0056:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_005b:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_eulerAngles(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0060:  ldarg.0
    IL_0061:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0066:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_006b:  ldarg.0
    IL_006c:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 CameraMoving::cameraPosition
    IL_0071:  call       bool [UnityEngine.CoreModule]UnityEngine.Vector3::op_Equality(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0076:  brfalse.s  IL_0097

    IL_0078:  ldarg.0
    IL_0079:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_007e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
    IL_0083:  ldarg.0
    IL_0084:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 CameraMoving::cameraAngle
    IL_0089:  call       bool [UnityEngine.CoreModule]UnityEngine.Vector3::op_Equality(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_008e:  brfalse.s  IL_0097

    IL_0090:  ldarg.0
    IL_0091:  ldc.i4.1
    IL_0092:  stfld      bool CameraMoving::is_complete
    IL_0097:  ret
  } // end of method CameraMoving::CameraMovingShot

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       62 (0x3e)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     1.
    IL_0006:  stfld      float32 CameraMoving::speed
    IL_000b:  ldarg.0
    IL_000c:  ldc.r4     3.9000001
    IL_0011:  stfld      float32 CameraMoving::x
    IL_0016:  ldarg.0
    IL_0017:  ldc.r4     5.6999998
    IL_001c:  stfld      float32 CameraMoving::y
    IL_0021:  ldarg.0
    IL_0022:  ldc.r4     -11.8
    IL_0027:  stfld      float32 CameraMoving::z
    IL_002c:  ldarg.0
    IL_002d:  ldc.r4     20.5
    IL_0032:  stfld      float32 CameraMoving::x_angle
    IL_0037:  ldarg.0
    IL_0038:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_003d:  ret
  } // end of method CameraMoving::.ctor

} // end of class CameraMoving

.class public auto ansi beforefieldinit ConveyorBelt
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public class [UnityEngine.CoreModule]UnityEngine.Transform endpoint
  .field public float32 speed
  .method private hidebysig instance void 
          OnTriggerStay(class [UnityEngine.PhysicsModule]UnityEngine.Collider other) cil managed
  {
    // 코드 크기       69 (0x45)
    .maxstack  5
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_0006:  ldstr      "BoxObject"
    IL_000b:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0010:  brfalse.s  IL_0044

    IL_0012:  ldarg.1
    IL_0013:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0018:  ldarg.1
    IL_0019:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0023:  ldarg.0
    IL_0024:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform ConveyorBelt::endpoint
    IL_0029:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_002e:  ldarg.0
    IL_002f:  ldfld      float32 ConveyorBelt::speed
    IL_0034:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0039:  mul
    IL_003a:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_003f:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0044:  ret
  } // end of method ConveyorBelt::OnTriggerStay

  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method ConveyorBelt::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method ConveyorBelt::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0006:  ret
  } // end of method ConveyorBelt::.ctor

} // end of class ConveyorBelt

.class public auto ansi beforefieldinit Cylinder
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public bool push
  .field private class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody rigidbody
  .field public class [UnityEngine.CoreModule]UnityEngine.Transform StartPoint
  .field public class [UnityEngine.CoreModule]UnityEngine.Transform EndPoint
  .field public float32 direction
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       13 (0xd)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.0
    IL_0002:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody>()
    IL_0007:  stfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_000c:  ret
  } // end of method Cylinder::Start

  .method private hidebysig instance void 
          FixedUpdate() cil managed
  {
    // 코드 크기       358 (0x166)
    .maxstack  4
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32 Cylinder::direction
    IL_0006:  ldc.r4     0.0
    IL_000b:  ble.un     IL_00c2

    IL_0010:  ldarg.0
    IL_0011:  ldfld      bool Cylinder::push
    IL_0016:  brfalse.s  IL_006d

    IL_0018:  ldarg.0
    IL_0019:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0023:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0028:  ldarg.0
    IL_0029:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform Cylinder::EndPoint
    IL_002e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0033:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0038:  bge.un.s   IL_005c

    IL_003a:  ldarg.0
    IL_003b:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_0040:  ldarg.0
    IL_0041:  ldfld      float32 Cylinder::direction
    IL_0046:  ldc.r4     10.
    IL_004b:  mul
    IL_004c:  ldc.r4     0.0
    IL_0051:  ldc.r4     0.0
    IL_0056:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::AddRelativeForce(float32,
                                                                                                          float32,
                                                                                                          float32)
    IL_005b:  ret

    IL_005c:  ldarg.0
    IL_005d:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_0062:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_zero()
    IL_0067:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::set_velocity(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_006c:  ret

    IL_006d:  ldarg.0
    IL_006e:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0073:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0078:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_007d:  ldarg.0
    IL_007e:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform Cylinder::StartPoint
    IL_0083:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0088:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_008d:  ble.un.s   IL_00b1

    IL_008f:  ldarg.0
    IL_0090:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_0095:  ldarg.0
    IL_0096:  ldfld      float32 Cylinder::direction
    IL_009b:  ldc.r4     -10.
    IL_00a0:  mul
    IL_00a1:  ldc.r4     0.0
    IL_00a6:  ldc.r4     0.0
    IL_00ab:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::AddRelativeForce(float32,
                                                                                                          float32,
                                                                                                          float32)
    IL_00b0:  ret

    IL_00b1:  ldarg.0
    IL_00b2:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_00b7:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_zero()
    IL_00bc:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::set_velocity(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_00c1:  ret

    IL_00c2:  ldarg.0
    IL_00c3:  ldfld      bool Cylinder::push
    IL_00c8:  brfalse.s  IL_0118

    IL_00ca:  ldarg.0
    IL_00cb:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_00d0:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_00d5:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_00da:  ldarg.0
    IL_00db:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform Cylinder::EndPoint
    IL_00e0:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_00e5:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_00ea:  ble.un.s   IL_0107

    IL_00ec:  ldarg.0
    IL_00ed:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_00f2:  ldc.r4     10.
    IL_00f7:  ldc.r4     0.0
    IL_00fc:  ldc.r4     0.0
    IL_0101:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::AddRelativeForce(float32,
                                                                                                          float32,
                                                                                                          float32)
    IL_0106:  ret

    IL_0107:  ldarg.0
    IL_0108:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_010d:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_zero()
    IL_0112:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::set_velocity(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0117:  ret

    IL_0118:  ldarg.0
    IL_0119:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_011e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0123:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0128:  ldarg.0
    IL_0129:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform Cylinder::StartPoint
    IL_012e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0133:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0138:  bge.un.s   IL_0155

    IL_013a:  ldarg.0
    IL_013b:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_0140:  ldc.r4     -10.
    IL_0145:  ldc.r4     0.0
    IL_014a:  ldc.r4     0.0
    IL_014f:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::AddRelativeForce(float32,
                                                                                                          float32,
                                                                                                          float32)
    IL_0154:  ret

    IL_0155:  ldarg.0
    IL_0156:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody Cylinder::rigidbody
    IL_015b:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_zero()
    IL_0160:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::set_velocity(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0165:  ret
  } // end of method Cylinder::FixedUpdate

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method Cylinder::Update

  .method public hidebysig instance void 
          BoolTrigger() cil managed
  {
    // 코드 크기       16 (0x10)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.0
    IL_0002:  ldfld      bool Cylinder::push
    IL_0007:  ldc.i4.0
    IL_0008:  ceq
    IL_000a:  stfld      bool Cylinder::push
    IL_000f:  ret
  } // end of method Cylinder::BoolTrigger

  .method public hidebysig instance void 
          Forward() cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.1
    IL_0002:  stfld      bool Cylinder::push
    IL_0007:  ret
  } // end of method Cylinder::Forward

  .method public hidebysig instance void 
          Backward() cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.0
    IL_0002:  stfld      bool Cylinder::push
    IL_0007:  ret
  } // end of method Cylinder::Backward

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       18 (0x12)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     1.
    IL_0006:  stfld      float32 Cylinder::direction
    IL_000b:  ldarg.0
    IL_000c:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0011:  ret
  } // end of method Cylinder::.ctor

} // end of class Cylinder

.class public auto ansi beforefieldinit CylinderBTN
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public class [UnityEngine.CoreModule]UnityEngine.GameObject TargetCylinder
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method CylinderBTN::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method CylinderBTN::Update

  .method private hidebysig instance void 
          OnMouseDown() cil managed
  {
    // 코드 크기       94 (0x5e)
    .maxstack  4
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0)
    IL_0000:  ldloca.s   V_0
    IL_0002:  ldarg.0
    IL_0003:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0008:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_000d:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0012:  ldc.r4     0.0
    IL_0017:  ldarg.0
    IL_0018:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001d:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0022:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::z
    IL_0027:  call       instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_002c:  ldarg.0
    IL_002d:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0032:  ldarg.0
    IL_0033:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0038:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_003d:  ldloc.0
    IL_003e:  ldc.r4     0.30000001
    IL_0043:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_0048:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_004d:  ldarg.0
    IL_004e:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject CylinderBTN::TargetCylinder
    IL_0053:  ldstr      "BoolTrigger"
    IL_0058:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string)
    IL_005d:  ret
  } // end of method CylinderBTN::OnMouseDown

  .method private hidebysig instance void 
          OnMouseUp() cil managed
  {
    // 코드 크기       78 (0x4e)
    .maxstack  4
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0)
    IL_0000:  ldloca.s   V_0
    IL_0002:  ldarg.0
    IL_0003:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0008:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_000d:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0012:  ldc.r4     0.30000001
    IL_0017:  ldarg.0
    IL_0018:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001d:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0022:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::z
    IL_0027:  call       instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_002c:  ldarg.0
    IL_002d:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0032:  ldarg.0
    IL_0033:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0038:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_003d:  ldloc.0
    IL_003e:  ldc.r4     0.30000001
    IL_0043:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_0048:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_004d:  ret
  } // end of method CylinderBTN::OnMouseUp

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0006:  ret
  } // end of method CylinderBTN::.ctor

} // end of class CylinderBTN

.class public auto ansi beforefieldinit EndExplossion
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       33 (0x21)
    .maxstack  2
    .locals init (class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem V_0,
             valuetype [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem/MainModule V_1)
    IL_0000:  ldarg.0
    IL_0001:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem>()
    IL_0006:  stloc.0
    IL_0007:  ldarg.0
    IL_0008:  call       instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.Component::get_gameObject()
    IL_000d:  ldloc.0
    IL_000e:  callvirt   instance valuetype [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem/MainModule [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem::get_main()
    IL_0013:  stloc.1
    IL_0014:  ldloca.s   V_1
    IL_0016:  call       instance float32 [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem/MainModule::get_duration()
    IL_001b:  call       void [UnityEngine.CoreModule]UnityEngine.Object::Destroy(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                  float32)
    IL_0020:  ret
  } // end of method EndExplossion::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method EndExplossion::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0006:  ret
  } // end of method EndExplossion::.ctor

} // end of class EndExplossion

.class public auto ansi beforefieldinit LiftControl
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public bool 'on'
  .field public class [UnityEngine.CoreModule]UnityEngine.Transform endpoint
  .field public float32 speed
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 startpoint
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       18 (0x12)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.0
    IL_0002:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0007:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_000c:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 LiftControl::startpoint
    IL_0011:  ret
  } // end of method LiftControl::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       125 (0x7d)
    .maxstack  5
    IL_0000:  ldarg.0
    IL_0001:  ldfld      bool LiftControl::'on'
    IL_0006:  brfalse.s  IL_0045

    IL_0008:  ldarg.0
    IL_0009:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_000e:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0013:  ldarg.0
    IL_0014:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0019:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0023:  ldarg.0
    IL_0024:  ldfld      class [UnityEngine.CoreModule]UnityEngine.Transform LiftControl::endpoint
    IL_0029:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_002e:  ldarg.0
    IL_002f:  ldfld      float32 LiftControl::speed
    IL_0034:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0039:  mul
    IL_003a:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_003f:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0044:  ret

    IL_0045:  ldarg.0
    IL_0046:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_004b:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0050:  ldarg.0
    IL_0051:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0056:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_005b:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0060:  ldarg.0
    IL_0061:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 LiftControl::startpoint
    IL_0066:  ldarg.0
    IL_0067:  ldfld      float32 LiftControl::speed
    IL_006c:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0071:  mul
    IL_0072:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::MoveTowards(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_0077:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_007c:  ret
  } // end of method LiftControl::Update

  .method public hidebysig instance void 
          BoolTrigger() cil managed
  {
    // 코드 크기       16 (0x10)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.0
    IL_0002:  ldfld      bool LiftControl::'on'
    IL_0007:  ldc.i4.0
    IL_0008:  ceq
    IL_000a:  stfld      bool LiftControl::'on'
    IL_000f:  ret
  } // end of method LiftControl::BoolTrigger

  .method public hidebysig instance void 
          Forward() cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.1
    IL_0002:  stfld      bool LiftControl::'on'
    IL_0007:  ret
  } // end of method LiftControl::Forward

  .method public hidebysig instance void 
          Backward() cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.0
    IL_0002:  stfld      bool LiftControl::'on'
    IL_0007:  ret
  } // end of method LiftControl::Backward

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       18 (0x12)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     1.
    IL_0006:  stfld      float32 LiftControl::speed
    IL_000b:  ldarg.0
    IL_000c:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0011:  ret
  } // end of method LiftControl::.ctor

} // end of class LiftControl

.class public auto ansi beforefieldinit LiftSensor
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Color color
  .field private class [UnityEngine.CoreModule]UnityEngine.GameObject SocketClient
  .method private hidebysig instance void 
          OnTriggerExit(class [UnityEngine.PhysicsModule]UnityEngine.Collider other) cil managed
  {
    // 코드 크기       73 (0x49)
    .maxstack  4
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_0006:  ldstr      "BoxObject"
    IL_000b:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0010:  brfalse.s  IL_0048

    IL_0012:  ldarg.0
    IL_0013:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.CoreModule]UnityEngine.MeshRenderer>()
    IL_0018:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Material [UnityEngine.CoreModule]UnityEngine.Renderer::get_material()
    IL_001d:  ldarg.0
    IL_001e:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Color LiftSensor::color
    IL_0023:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Material::set_color(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
    IL_0028:  ldarg.0
    IL_0029:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject LiftSensor::SocketClient
    IL_002e:  ldstr      "SendtoServerMyState"
    IL_0033:  ldarg.0
    IL_0034:  call       instance string [UnityEngine.CoreModule]UnityEngine.Object::get_name()
    IL_0039:  ldstr      "_0"
    IL_003e:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0043:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string,
                                                                                                   object)
    IL_0048:  ret
  } // end of method LiftSensor::OnTriggerExit

  .method private hidebysig instance void 
          OnTriggerEnter(class [UnityEngine.PhysicsModule]UnityEngine.Collider other) cil managed
  {
    // 코드 크기       72 (0x48)
    .maxstack  4
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_0006:  ldstr      "BoxObject"
    IL_000b:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0010:  brfalse.s  IL_0047

    IL_0012:  ldarg.0
    IL_0013:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.CoreModule]UnityEngine.MeshRenderer>()
    IL_0018:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Material [UnityEngine.CoreModule]UnityEngine.Renderer::get_material()
    IL_001d:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Color [UnityEngine.CoreModule]UnityEngine.Color::get_red()
    IL_0022:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Material::set_color(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
    IL_0027:  ldarg.0
    IL_0028:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject LiftSensor::SocketClient
    IL_002d:  ldstr      "SendtoServerMyState"
    IL_0032:  ldarg.0
    IL_0033:  call       instance string [UnityEngine.CoreModule]UnityEngine.Object::get_name()
    IL_0038:  ldstr      "_1"
    IL_003d:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0042:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string,
                                                                                                   object)
    IL_0047:  ret
  } // end of method LiftSensor::OnTriggerEnter

  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       17 (0x11)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldstr      "ClientSocket"
    IL_0006:  call       class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.GameObject::Find(string)
    IL_000b:  stfld      class [UnityEngine.CoreModule]UnityEngine.GameObject LiftSensor::SocketClient
    IL_0010:  ret
  } // end of method LiftSensor::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method LiftSensor::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       38 (0x26)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     0.39622641
    IL_0006:  ldc.r4     0.0
    IL_000b:  ldc.r4     0.0
    IL_0010:  ldc.r4     1.e-03
    IL_0015:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Color::.ctor(float32,
                                                                                        float32,
                                                                                        float32,
                                                                                        float32)
    IL_001a:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Color LiftSensor::color
    IL_001f:  ldarg.0
    IL_0020:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0025:  ret
  } // end of method LiftSensor::.ctor

} // end of class LiftSensor

.class public auto ansi beforefieldinit LiftUpDownSensor
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field private class [UnityEngine.CoreModule]UnityEngine.GameObject SocketClient
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Color color
  .method private hidebysig instance void 
          OnTriggerExit(class [UnityEngine.PhysicsModule]UnityEngine.Collider other) cil managed
  {
    // 코드 크기       73 (0x49)
    .maxstack  4
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_0006:  ldstr      "Lift"
    IL_000b:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0010:  brfalse.s  IL_0048

    IL_0012:  ldarg.0
    IL_0013:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.CoreModule]UnityEngine.MeshRenderer>()
    IL_0018:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Material [UnityEngine.CoreModule]UnityEngine.Renderer::get_material()
    IL_001d:  ldarg.0
    IL_001e:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Color LiftUpDownSensor::color
    IL_0023:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Material::set_color(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
    IL_0028:  ldarg.0
    IL_0029:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject LiftUpDownSensor::SocketClient
    IL_002e:  ldstr      "SendtoServerMyState"
    IL_0033:  ldarg.0
    IL_0034:  call       instance string [UnityEngine.CoreModule]UnityEngine.Object::get_name()
    IL_0039:  ldstr      "_0"
    IL_003e:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0043:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string,
                                                                                                   object)
    IL_0048:  ret
  } // end of method LiftUpDownSensor::OnTriggerExit

  .method private hidebysig instance void 
          OnTriggerEnter(class [UnityEngine.PhysicsModule]UnityEngine.Collider other) cil managed
  {
    // 코드 크기       72 (0x48)
    .maxstack  4
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_0006:  ldstr      "Lift"
    IL_000b:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0010:  brfalse.s  IL_0047

    IL_0012:  ldarg.0
    IL_0013:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.CoreModule]UnityEngine.MeshRenderer>()
    IL_0018:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Material [UnityEngine.CoreModule]UnityEngine.Renderer::get_material()
    IL_001d:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Color [UnityEngine.CoreModule]UnityEngine.Color::get_red()
    IL_0022:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Material::set_color(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
    IL_0027:  ldarg.0
    IL_0028:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject LiftUpDownSensor::SocketClient
    IL_002d:  ldstr      "SendtoServerMyState"
    IL_0032:  ldarg.0
    IL_0033:  call       instance string [UnityEngine.CoreModule]UnityEngine.Object::get_name()
    IL_0038:  ldstr      "_1"
    IL_003d:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0042:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string,
                                                                                                   object)
    IL_0047:  ret
  } // end of method LiftUpDownSensor::OnTriggerEnter

  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       17 (0x11)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldstr      "ClientSocket"
    IL_0006:  call       class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.GameObject::Find(string)
    IL_000b:  stfld      class [UnityEngine.CoreModule]UnityEngine.GameObject LiftUpDownSensor::SocketClient
    IL_0010:  ret
  } // end of method LiftUpDownSensor::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method LiftUpDownSensor::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       38 (0x26)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     1.
    IL_0006:  ldc.r4     1.
    IL_000b:  ldc.r4     1.
    IL_0010:  ldc.r4     1.e-03
    IL_0015:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Color::.ctor(float32,
                                                                                        float32,
                                                                                        float32,
                                                                                        float32)
    IL_001a:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Color LiftUpDownSensor::color
    IL_001f:  ldarg.0
    IL_0020:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0025:  ret
  } // end of method LiftUpDownSensor::.ctor

} // end of class LiftUpDownSensor

.class public auto ansi beforefieldinit MouseClickEvent
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .method private hidebysig instance void 
          OnCollisionEnter(class [UnityEngine.PhysicsModule]UnityEngine.Collision collision) cil managed
  {
    // 코드 크기       40 (0x28)
    .maxstack  8
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.PhysicsModule]UnityEngine.Collision::get_transform()
    IL_0006:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_000b:  ldstr      "Ground"
    IL_0010:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0015:  brfalse.s  IL_0027

    IL_0017:  ldarg.0
    IL_0018:  call       instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.Component::get_gameObject()
    IL_001d:  ldc.r4     0.0
    IL_0022:  call       void [UnityEngine.CoreModule]UnityEngine.Object::Destroy(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                  float32)
    IL_0027:  ret
  } // end of method MouseClickEvent::OnCollisionEnter

  .method private hidebysig instance void 
          OnTriggerEnter(class [UnityEngine.PhysicsModule]UnityEngine.Collider other) cil managed
  {
    // 코드 크기       88 (0x58)
    .maxstack  4
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_0006:  ldstr      "Accident"
    IL_000b:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0010:  brfalse.s  IL_0057

    IL_0012:  ldstr      "SmallExplosion"
    IL_0017:  call       class [UnityEngine.CoreModule]UnityEngine.Object [UnityEngine.CoreModule]UnityEngine.Resources::Load(string)
    IL_001c:  castclass  [UnityEngine.CoreModule]UnityEngine.GameObject
    IL_0021:  dup
    IL_0022:  ldarg.0
    IL_0023:  call       instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.Component::get_gameObject()
    IL_0028:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.GameObject::get_transform()
    IL_002d:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0032:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::get_identity()
    IL_0037:  call       !!0 [UnityEngine.CoreModule]UnityEngine.Object::Instantiate<class [UnityEngine.CoreModule]UnityEngine.GameObject>(!!0,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion)
    IL_003c:  pop
    IL_003d:  callvirt   instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponent<class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem>()
    IL_0042:  callvirt   instance void [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem::Play()
    IL_0047:  ldarg.0
    IL_0048:  call       instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.Component::get_gameObject()
    IL_004d:  ldc.r4     0.0
    IL_0052:  call       void [UnityEngine.CoreModule]UnityEngine.Object::Destroy(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                  float32)
    IL_0057:  ret
  } // end of method MouseClickEvent::OnTriggerEnter

  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method MouseClickEvent::Start

  .method private hidebysig instance void 
          OnMouseDown() cil managed
  {
    // 코드 크기       70 (0x46)
    .maxstack  4
    IL_0000:  ldstr      "SmallExplosion"
    IL_0005:  call       class [UnityEngine.CoreModule]UnityEngine.Object [UnityEngine.CoreModule]UnityEngine.Resources::Load(string)
    IL_000a:  castclass  [UnityEngine.CoreModule]UnityEngine.GameObject
    IL_000f:  dup
    IL_0010:  ldarg.0
    IL_0011:  call       instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.Component::get_gameObject()
    IL_0016:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.GameObject::get_transform()
    IL_001b:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
    IL_0020:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::get_identity()
    IL_0025:  call       !!0 [UnityEngine.CoreModule]UnityEngine.Object::Instantiate<class [UnityEngine.CoreModule]UnityEngine.GameObject>(!!0,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                           valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion)
    IL_002a:  pop
    IL_002b:  callvirt   instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponent<class [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem>()
    IL_0030:  callvirt   instance void [UnityEngine.ParticleSystemModule]UnityEngine.ParticleSystem::Play()
    IL_0035:  ldarg.0
    IL_0036:  call       instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.Component::get_gameObject()
    IL_003b:  ldc.r4     0.0
    IL_0040:  call       void [UnityEngine.CoreModule]UnityEngine.Object::Destroy(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                  float32)
    IL_0045:  ret
  } // end of method MouseClickEvent::OnMouseDown

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method MouseClickEvent::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0006:  ret
  } // end of method MouseClickEvent::.ctor

} // end of class MouseClickEvent

.class public auto ansi beforefieldinit Sensors
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field private valuetype [UnityEngine.CoreModule]UnityEngine.Color color
  .field private class [UnityEngine.CoreModule]UnityEngine.GameObject SocketClient
  .method private hidebysig instance void 
          OnTriggerExit(class [UnityEngine.PhysicsModule]UnityEngine.Collider other) cil managed
  {
    // 코드 크기       73 (0x49)
    .maxstack  4
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_0006:  ldstr      "SensorTarget"
    IL_000b:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0010:  brfalse.s  IL_0048

    IL_0012:  ldarg.0
    IL_0013:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.CoreModule]UnityEngine.MeshRenderer>()
    IL_0018:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Material [UnityEngine.CoreModule]UnityEngine.Renderer::get_material()
    IL_001d:  ldarg.0
    IL_001e:  ldfld      valuetype [UnityEngine.CoreModule]UnityEngine.Color Sensors::color
    IL_0023:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Material::set_color(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
    IL_0028:  ldarg.0
    IL_0029:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject Sensors::SocketClient
    IL_002e:  ldstr      "SendtoServerMyState"
    IL_0033:  ldarg.0
    IL_0034:  call       instance string [UnityEngine.CoreModule]UnityEngine.Object::get_name()
    IL_0039:  ldstr      "_0"
    IL_003e:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0043:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string,
                                                                                                   object)
    IL_0048:  ret
  } // end of method Sensors::OnTriggerExit

  .method private hidebysig instance void 
          OnTriggerEnter(class [UnityEngine.PhysicsModule]UnityEngine.Collider other) cil managed
  {
    // 코드 크기       72 (0x48)
    .maxstack  4
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance string [UnityEngine.CoreModule]UnityEngine.Component::get_tag()
    IL_0006:  ldstr      "SensorTarget"
    IL_000b:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0010:  brfalse.s  IL_0047

    IL_0012:  ldarg.0
    IL_0013:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.CoreModule]UnityEngine.MeshRenderer>()
    IL_0018:  callvirt   instance class [UnityEngine.CoreModule]UnityEngine.Material [UnityEngine.CoreModule]UnityEngine.Renderer::get_material()
    IL_001d:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Color [UnityEngine.CoreModule]UnityEngine.Color::get_green()
    IL_0022:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Material::set_color(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
    IL_0027:  ldarg.0
    IL_0028:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject Sensors::SocketClient
    IL_002d:  ldstr      "SendtoServerMyState"
    IL_0032:  ldarg.0
    IL_0033:  call       instance string [UnityEngine.CoreModule]UnityEngine.Object::get_name()
    IL_0038:  ldstr      "_1"
    IL_003d:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0042:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string,
                                                                                                   object)
    IL_0047:  ret
  } // end of method Sensors::OnTriggerEnter

  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       17 (0x11)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldstr      "ClientSocket"
    IL_0006:  call       class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.GameObject::Find(string)
    IL_000b:  stfld      class [UnityEngine.CoreModule]UnityEngine.GameObject Sensors::SocketClient
    IL_0010:  ret
  } // end of method Sensors::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method Sensors::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       38 (0x26)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     0.0
    IL_0006:  ldc.r4     0.0
    IL_000b:  ldc.r4     0.0
    IL_0010:  ldc.r4     0.0
    IL_0015:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Color::.ctor(float32,
                                                                                        float32,
                                                                                        float32,
                                                                                        float32)
    IL_001a:  stfld      valuetype [UnityEngine.CoreModule]UnityEngine.Color Sensors::color
    IL_001f:  ldarg.0
    IL_0020:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0025:  ret
  } // end of method Sensors::.ctor

} // end of class Sensors

.class public auto ansi beforefieldinit SocketClient
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field private class ChatClient.Network.ClientSession client
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       34 (0x22)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldstr      "127.0.0.1"
    IL_0006:  ldc.i4     0x1f40
    IL_000b:  newobj     instance void ChatClient.Network.ClientSession::.ctor(string,
                                                                               int32)
    IL_0010:  stfld      class ChatClient.Network.ClientSession SocketClient::client
    IL_0015:  ldarg.0
    IL_0016:  ldfld      class ChatClient.Network.ClientSession SocketClient::client
    IL_001b:  callvirt   instance bool ChatClient.Network.ClientSession::Start()
    IL_0020:  pop
    IL_0021:  ret
  } // end of method SocketClient::Start

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void SocketClient::CommandProcess()
    IL_0006:  ret
  } // end of method SocketClient::Update

  .method private hidebysig instance void 
          CommandProcess() cil managed
  {
    // 코드 크기       110 (0x6e)
    .maxstack  3
    .locals init (int32 V_0,
             int32 V_1,
             string V_2,
             string V_3,
             class [UnityEngine.CoreModule]UnityEngine.GameObject V_4)
    IL_0000:  ldsfld     class [mscorlib]System.Collections.Generic.List`1<string> CommModel.CommModel::RecvDataList
    IL_0005:  callvirt   instance int32 class [mscorlib]System.Collections.Generic.List`1<string>::get_Count()
    IL_000a:  stloc.0
    IL_000b:  ldc.i4.0
    IL_000c:  stloc.1
    IL_000d:  br.s       IL_005d

    IL_000f:  ldsfld     class [mscorlib]System.Collections.Generic.List`1<string> CommModel.CommModel::RecvDataList
    IL_0014:  ldloc.1
    IL_0015:  callvirt   instance !0 class [mscorlib]System.Collections.Generic.List`1<string>::get_Item(int32)
    IL_001a:  ldc.i4.s   44
    IL_001c:  ldc.i4.0
    IL_001d:  callvirt   instance string[] [mscorlib]System.String::Split(char,
                                                                          valuetype [mscorlib]System.StringSplitOptions)
    IL_0022:  dup
    IL_0023:  ldc.i4.0
    IL_0024:  ldelem.ref
    IL_0025:  stloc.2
    IL_0026:  ldc.i4.1
    IL_0027:  ldelem.ref
    IL_0028:  stloc.3
    IL_0029:  ldloc.2
    IL_002a:  ldstr      "Scene"
    IL_002f:  call       bool [mscorlib]System.String::op_Equality(string,
                                                                   string)
    IL_0034:  brfalse.s  IL_003f

    IL_0036:  ldloc.3
    IL_0037:  ldc.i4.0
    IL_0038:  call       void [UnityEngine.CoreModule]UnityEngine.SceneManagement.SceneManager::LoadScene(string,
                                                                                                          valuetype [UnityEngine.CoreModule]UnityEngine.SceneManagement.LoadSceneMode)
    IL_003d:  br.s       IL_0059

    IL_003f:  ldloc.2
    IL_0040:  call       class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.GameObject::Find(string)
    IL_0045:  stloc.s    V_4
    IL_0047:  ldloc.s    V_4
    IL_0049:  ldnull
    IL_004a:  call       bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object,
                                                                                        class [UnityEngine.CoreModule]UnityEngine.Object)
    IL_004f:  brfalse.s  IL_0059

    IL_0051:  ldloc.s    V_4
    IL_0053:  ldloc.3
    IL_0054:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string)
    IL_0059:  ldloc.1
    IL_005a:  ldc.i4.1
    IL_005b:  add
    IL_005c:  stloc.1
    IL_005d:  ldloc.1
    IL_005e:  ldloc.0
    IL_005f:  blt.s      IL_000f

    IL_0061:  ldsfld     class [mscorlib]System.Collections.Generic.List`1<string> CommModel.CommModel::RecvDataList
    IL_0066:  ldc.i4.0
    IL_0067:  ldloc.0
    IL_0068:  callvirt   instance void class [mscorlib]System.Collections.Generic.List`1<string>::RemoveRange(int32,
                                                                                                              int32)
    IL_006d:  ret
  } // end of method SocketClient::CommandProcess

  .method public hidebysig instance void 
          SendtoServerMyState(string msg) cil managed
  {
    // 코드 크기       14 (0xe)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      class ChatClient.Network.ClientSession SocketClient::client
    IL_0006:  ldarg.1
    IL_0007:  callvirt   instance bool ChatClient.Network.ClientSession::SendMessage(string)
    IL_000c:  pop
    IL_000d:  ret
  } // end of method SocketClient::SendtoServerMyState

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0006:  ret
  } // end of method SocketClient::.ctor

} // end of class SocketClient

.class public auto ansi beforefieldinit WheelControl
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .field public bool DirectControl
  .field public bool push
  .field private float32 addTorque
  .field private class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody rigidbody
  .field public float32 target
  .field public float32 KP
  .field public float32 KI
  .field public float32 KD
  .field private float32 P
  .field private float32 I
  .field private float32 D
  .field private class [UnityEngine.CoreModule]UnityEngine.GameObject SocketClient
  .field public float32 'error'
  .field private float32 old_error
  .method private hidebysig instance void 
          Start() cil managed
  {
    // 코드 크기       45 (0x2d)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldstr      "ClientSocket"
    IL_0006:  call       class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.GameObject::Find(string)
    IL_000b:  stfld      class [UnityEngine.CoreModule]UnityEngine.GameObject WheelControl::SocketClient
    IL_0010:  ldarg.0
    IL_0011:  ldarg.0
    IL_0012:  call       instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody>()
    IL_0017:  stfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody WheelControl::rigidbody
    IL_001c:  ldarg.0
    IL_001d:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody WheelControl::rigidbody
    IL_0022:  ldc.r4     100.
    IL_0027:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::set_maxAngularVelocity(float32)
    IL_002c:  ret
  } // end of method WheelControl::Start

  .method private hidebysig instance void 
          FixedUpdate() cil managed
  {
    // 코드 크기       482 (0x1e2)
    .maxstack  4
    .locals init (float32 V_0)
    IL_0000:  ldarg.0
    IL_0001:  ldfld      float32 WheelControl::target
    IL_0006:  ldc.r4     45.
    IL_000b:  ble.un.s   IL_0018

    IL_000d:  ldarg.0
    IL_000e:  ldc.r4     45.
    IL_0013:  stfld      float32 WheelControl::target
    IL_0018:  ldarg.0
    IL_0019:  ldfld      float32 WheelControl::target
    IL_001e:  ldc.r4     0.0
    IL_0023:  bge.un.s   IL_0030

    IL_0025:  ldarg.0
    IL_0026:  ldc.r4     0.0
    IL_002b:  stfld      float32 WheelControl::target
    IL_0030:  ldarg.0
    IL_0031:  ldfld      float32 WheelControl::target
    IL_0036:  ldc.r4     180.
    IL_003b:  bge.un.s   IL_009d

    IL_003d:  ldarg.0
    IL_003e:  ldfld      float32 WheelControl::target
    IL_0043:  ldc.r4     180.
    IL_0048:  add
    IL_0049:  ldarg.0
    IL_004a:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_004f:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
    IL_0054:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0059:  bge.un.s   IL_0080

    IL_005b:  ldarg.0
    IL_005c:  ldc.r4     360.
    IL_0061:  ldarg.0
    IL_0062:  ldfld      float32 WheelControl::target
    IL_0067:  add
    IL_0068:  ldarg.0
    IL_0069:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_006e:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
    IL_0073:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0078:  sub
    IL_0079:  stfld      float32 WheelControl::'error'
    IL_007e:  br.s       IL_009d

    IL_0080:  ldarg.0
    IL_0081:  ldarg.0
    IL_0082:  ldfld      float32 WheelControl::target
    IL_0087:  ldarg.0
    IL_0088:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_008d:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
    IL_0092:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0097:  sub
    IL_0098:  stfld      float32 WheelControl::'error'
    IL_009d:  ldarg.0
    IL_009e:  ldfld      bool WheelControl::push
    IL_00a3:  brfalse    IL_014d

    IL_00a8:  ldarg.0
    IL_00a9:  ldfld      bool WheelControl::DirectControl
    IL_00ae:  brtrue     IL_013f

    IL_00b3:  ldc.r4     2.0000001e-03
    IL_00b8:  stloc.0
    IL_00b9:  ldarg.0
    IL_00ba:  ldarg.0
    IL_00bb:  ldfld      float32 WheelControl::KP
    IL_00c0:  ldarg.0
    IL_00c1:  ldfld      float32 WheelControl::'error'
    IL_00c6:  mul
    IL_00c7:  stfld      float32 WheelControl::P
    IL_00cc:  ldarg.0
    IL_00cd:  ldarg.0
    IL_00ce:  ldfld      float32 WheelControl::I
    IL_00d3:  ldarg.0
    IL_00d4:  ldfld      float32 WheelControl::KI
    IL_00d9:  ldarg.0
    IL_00da:  ldfld      float32 WheelControl::'error'
    IL_00df:  mul
    IL_00e0:  ldloc.0
    IL_00e1:  mul
    IL_00e2:  add
    IL_00e3:  stfld      float32 WheelControl::I
    IL_00e8:  ldarg.0
    IL_00e9:  ldarg.0
    IL_00ea:  ldfld      float32 WheelControl::KD
    IL_00ef:  ldarg.0
    IL_00f0:  ldfld      float32 WheelControl::'error'
    IL_00f5:  ldarg.0
    IL_00f6:  ldfld      float32 WheelControl::old_error
    IL_00fb:  sub
    IL_00fc:  mul
    IL_00fd:  ldloc.0
    IL_00fe:  ldc.r4     1000.
    IL_0103:  mul
    IL_0104:  div
    IL_0105:  stfld      float32 WheelControl::D
    IL_010a:  ldarg.0
    IL_010b:  ldarg.0
    IL_010c:  ldfld      float32 WheelControl::P
    IL_0111:  ldarg.0
    IL_0112:  ldfld      float32 WheelControl::I
    IL_0117:  add
    IL_0118:  ldarg.0
    IL_0119:  ldfld      float32 WheelControl::D
    IL_011e:  add
    IL_011f:  stfld      float32 WheelControl::addTorque
    IL_0124:  ldarg.0
    IL_0125:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody WheelControl::rigidbody
    IL_012a:  ldarg.0
    IL_012b:  ldfld      float32 WheelControl::addTorque
    IL_0130:  ldc.r4     0.0
    IL_0135:  ldc.r4     0.0
    IL_013a:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::AddRelativeTorque(float32,
                                                                                                           float32,
                                                                                                           float32)
    IL_013f:  ldarg.0
    IL_0140:  ldarg.0
    IL_0141:  ldfld      float32 WheelControl::'error'
    IL_0146:  stfld      float32 WheelControl::old_error
    IL_014b:  br.s       IL_0193

    IL_014d:  ldarg.0
    IL_014e:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0153:  ldc.r4     0.0
    IL_0158:  ldc.r4     90.
    IL_015d:  ldc.r4     0.0
    IL_0162:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                          float32,
                                                                                          float32)
    IL_0167:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_eulerAngles(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_016c:  ldarg.0
    IL_016d:  ldc.r4     0.0
    IL_0172:  stfld      float32 WheelControl::I
    IL_0177:  ldarg.0
    IL_0178:  ldarg.0
    IL_0179:  ldfld      float32 WheelControl::'error'
    IL_017e:  stfld      float32 WheelControl::old_error
    IL_0183:  ldarg.0
    IL_0184:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody WheelControl::rigidbody
    IL_0189:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_zero()
    IL_018e:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::set_angularVelocity(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0193:  ldarg.0
    IL_0194:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_0199:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
    IL_019e:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_01a3:  ldc.r4     90.
    IL_01a8:  ble.un.s   IL_01ba

    IL_01aa:  ldarg.0
    IL_01ab:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody WheelControl::rigidbody
    IL_01b0:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_zero()
    IL_01b5:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::set_angularVelocity(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_01ba:  ldarg.0
    IL_01bb:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_01c0:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
    IL_01c5:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_01ca:  ldc.r4     0.0
    IL_01cf:  bge.un.s   IL_01e1

    IL_01d1:  ldarg.0
    IL_01d2:  ldfld      class [UnityEngine.PhysicsModule]UnityEngine.Rigidbody WheelControl::rigidbody
    IL_01d7:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_zero()
    IL_01dc:  callvirt   instance void [UnityEngine.PhysicsModule]UnityEngine.Rigidbody::set_angularVelocity(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_01e1:  ret
  } // end of method WheelControl::FixedUpdate

  .method public hidebysig instance void 
          WheelON() cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.1
    IL_0002:  stfld      bool WheelControl::push
    IL_0007:  ret
  } // end of method WheelControl::WheelON

  .method public hidebysig instance void 
          WheelOFF() cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.i4.0
    IL_0002:  stfld      bool WheelControl::push
    IL_0007:  ret
  } // end of method WheelControl::WheelOFF

  .method public hidebysig instance void 
          SetKp(float32 'value') cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  stfld      float32 WheelControl::KP
    IL_0007:  ret
  } // end of method WheelControl::SetKp

  .method public hidebysig instance void 
          SetKd(float32 'value') cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  stfld      float32 WheelControl::KD
    IL_0007:  ret
  } // end of method WheelControl::SetKd

  .method public hidebysig instance void 
          SetKi(float32 'value') cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  stfld      float32 WheelControl::KI
    IL_0007:  ret
  } // end of method WheelControl::SetKi

  .method public hidebysig instance void 
          SetTarget(float32 'value') cil managed
  {
    // 코드 크기       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  stfld      float32 WheelControl::target
    IL_0007:  ret
  } // end of method WheelControl::SetTarget

  .method public hidebysig instance void 
          GetError() cil managed
  {
    // 코드 크기       44 (0x2c)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject WheelControl::SocketClient
    IL_0006:  ldstr      "SendtoServerMyState"
    IL_000b:  ldarg.0
    IL_000c:  call       instance string [UnityEngine.CoreModule]UnityEngine.Object::get_name()
    IL_0011:  ldstr      "Error_"
    IL_0016:  ldarg.0
    IL_0017:  ldflda     float32 WheelControl::'error'
    IL_001c:  call       instance string [mscorlib]System.Single::ToString()
    IL_0021:  call       string [mscorlib]System.String::Concat(string,
                                                                string,
                                                                string)
    IL_0026:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string,
                                                                                                   object)
    IL_002b:  ret
  } // end of method WheelControl::GetError

  .method public hidebysig instance void 
          GetPosition() cil managed
  {
    // 코드 크기       57 (0x39)
    .maxstack  5
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0)
    IL_0000:  ldarg.0
    IL_0001:  ldfld      class [UnityEngine.CoreModule]UnityEngine.GameObject WheelControl::SocketClient
    IL_0006:  ldstr      "SendtoServerMyState"
    IL_000b:  ldarg.0
    IL_000c:  call       instance string [UnityEngine.CoreModule]UnityEngine.Object::get_name()
    IL_0011:  ldstr      "Position_"
    IL_0016:  ldarg.0
    IL_0017:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001c:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
    IL_0021:  stloc.0
    IL_0022:  ldloca.s   V_0
    IL_0024:  ldflda     float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
    IL_0029:  call       instance string [mscorlib]System.Single::ToString()
    IL_002e:  call       string [mscorlib]System.String::Concat(string,
                                                                string,
                                                                string)
    IL_0033:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SendMessage(string,
                                                                                                   object)
    IL_0038:  ret
  } // end of method WheelControl::GetPosition

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       1 (0x1)
    .maxstack  8
    IL_0000:  ret
  } // end of method WheelControl::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       18 (0x12)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldc.r4     20.
    IL_0006:  stfld      float32 WheelControl::addTorque
    IL_000b:  ldarg.0
    IL_000c:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_0011:  ret
  } // end of method WheelControl::.ctor

} // end of class WheelControl

.class private auto ansi beforefieldinit UnitySourceGeneratedAssemblyMonoScriptTypes_v1
       extends [mscorlib]System.Object
{
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = ( 01 00 00 00 ) 
  .custom instance void [System]System.ComponentModel.EditorBrowsableAttribute::.ctor(valuetype [System]System.ComponentModel.EditorBrowsableState) = ( 01 00 01 00 00 00 00 00 ) 
  .custom instance void [System]System.CodeDom.Compiler.GeneratedCodeAttribute::.ctor(string,
                                                                                      string) = ( 01 00 31 55 6E 69 74 79 2E 4D 6F 6E 6F 53 63 72   // ..1Unity.MonoScr
                                                                                                  69 70 74 47 65 6E 65 72 61 74 6F 72 2E 4D 6F 6E   // iptGenerator.Mon
                                                                                                  6F 53 63 72 69 70 74 49 6E 66 6F 47 65 6E 65 72   // oScriptInfoGener
                                                                                                  61 74 6F 72 FF 00 00 )                            // ator...
  .class sequential ansi sealed nested private beforefieldinit MonoScriptData
         extends [mscorlib]System.ValueType
  {
    .field public uint8[] FilePathsData
    .field public uint8[] TypesData
    .field public int32 TotalTypes
    .field public int32 TotalFiles
    .field public bool IsEditorOnly
  } // end of class MonoScriptData

  .method private hidebysig static valuetype UnitySourceGeneratedAssemblyMonoScriptTypes_v1/MonoScriptData 
          Get() cil managed aggressiveinlining
  {
    // 코드 크기       92 (0x5c)
    .maxstack  4
    .locals init (valuetype UnitySourceGeneratedAssemblyMonoScriptTypes_v1/MonoScriptData V_0)
    IL_0000:  ldloca.s   V_0
    IL_0002:  initobj    UnitySourceGeneratedAssemblyMonoScriptTypes_v1/MonoScriptData
    IL_0008:  ldloca.s   V_0
    IL_000a:  ldc.i4     0x443
    IL_000f:  newarr     [mscorlib]System.Byte
    IL_0014:  dup
    IL_0015:  ldtoken    field valuetype '<PrivateImplementationDetails>'/'__StaticArrayInitTypeSize=1091' '<PrivateImplementationDetails>'::'744A9C297184D8C8EC7FEC9C2BEF4C2160A899C7C9BC841300B91AA011E8E369'
    IL_001a:  call       void [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::InitializeArray(class [mscorlib]System.Array,
                                                                                                        valuetype [mscorlib]System.RuntimeFieldHandle)
    IL_001f:  stfld      uint8[] UnitySourceGeneratedAssemblyMonoScriptTypes_v1/MonoScriptData::FilePathsData
    IL_0024:  ldloca.s   V_0
    IL_0026:  ldc.i4     0x25a
    IL_002b:  newarr     [mscorlib]System.Byte
    IL_0030:  dup
    IL_0031:  ldtoken    field valuetype '<PrivateImplementationDetails>'/'__StaticArrayInitTypeSize=602' '<PrivateImplementationDetails>'::CBD2B5F4E66323E55A667182BC95F69804B28257B395037C183F3902730D2C6A
    IL_0036:  call       void [mscorlib]System.Runtime.CompilerServices.RuntimeHelpers::InitializeArray(class [mscorlib]System.Array,
                                                                                                        valuetype [mscorlib]System.RuntimeFieldHandle)
    IL_003b:  stfld      uint8[] UnitySourceGeneratedAssemblyMonoScriptTypes_v1/MonoScriptData::TypesData
    IL_0040:  ldloca.s   V_0
    IL_0042:  ldc.i4.s   23
    IL_0044:  stfld      int32 UnitySourceGeneratedAssemblyMonoScriptTypes_v1/MonoScriptData::TotalFiles
    IL_0049:  ldloca.s   V_0
    IL_004b:  ldc.i4.s   26
    IL_004d:  stfld      int32 UnitySourceGeneratedAssemblyMonoScriptTypes_v1/MonoScriptData::TotalTypes
    IL_0052:  ldloca.s   V_0
    IL_0054:  ldc.i4.0
    IL_0055:  stfld      bool UnitySourceGeneratedAssemblyMonoScriptTypes_v1/MonoScriptData::IsEditorOnly
    IL_005a:  ldloc.0
    IL_005b:  ret
  } // end of method UnitySourceGeneratedAssemblyMonoScriptTypes_v1::Get

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  ret
  } // end of method UnitySourceGeneratedAssemblyMonoScriptTypes_v1::.ctor

} // end of class UnitySourceGeneratedAssemblyMonoScriptTypes_v1

.class private auto ansi beforefieldinit ChatClient.Network.AsyncObject
       extends [mscorlib]System.Object
{
  .field public uint8[] buffer
  .field public class [System]System.Net.Sockets.Socket workingSocket
  .method public hidebysig specialname rtspecialname 
          instance void  .ctor(int32 bufferSize) cil managed
  {
    // 코드 크기       26 (0x1a)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  ldarg.0
    IL_0007:  ldarg.1
    IL_0008:  newarr     [mscorlib]System.Byte
    IL_000d:  stfld      uint8[] ChatClient.Network.AsyncObject::buffer
    IL_0012:  ldarg.0
    IL_0013:  ldnull
    IL_0014:  stfld      class [System]System.Net.Sockets.Socket ChatClient.Network.AsyncObject::workingSocket
    IL_0019:  ret
  } // end of method AsyncObject::.ctor

} // end of class ChatClient.Network.AsyncObject

.class private auto ansi beforefieldinit ChatClient.Network.ClientSession
       extends [mscorlib]System.Object
{
  .field private class [System]System.Net.Sockets.Socket clientSocket
  .field private string serverIp
  .field private int32 serverPort
  .field private class [mscorlib]System.AsyncCallback handleReceiveData
  .field private class [mscorlib]System.AsyncCallback handleSendData
  .field private string Tmprecv
  .method public hidebysig specialname rtspecialname 
          instance void  .ctor(string serverIp,
                               int32 serverPort) cil managed
  {
    // 코드 크기       68 (0x44)
    .maxstack  3
    IL_0000:  ldarg.0
    IL_0001:  ldstr      ""
    IL_0006:  stfld      string ChatClient.Network.ClientSession::Tmprecv
    IL_000b:  ldarg.0
    IL_000c:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0011:  ldarg.0
    IL_0012:  ldarg.1
    IL_0013:  stfld      string ChatClient.Network.ClientSession::serverIp
    IL_0018:  ldarg.0
    IL_0019:  ldarg.2
    IL_001a:  stfld      int32 ChatClient.Network.ClientSession::serverPort
    IL_001f:  ldarg.0
    IL_0020:  ldarg.0
    IL_0021:  ldftn      instance void ChatClient.Network.ClientSession::OnReceiveData(class [mscorlib]System.IAsyncResult)
    IL_0027:  newobj     instance void [mscorlib]System.AsyncCallback::.ctor(object,
                                                                             native int)
    IL_002c:  stfld      class [mscorlib]System.AsyncCallback ChatClient.Network.ClientSession::handleReceiveData
    IL_0031:  ldarg.0
    IL_0032:  ldarg.0
    IL_0033:  ldftn      instance void ChatClient.Network.ClientSession::OnSendData(class [mscorlib]System.IAsyncResult)
    IL_0039:  newobj     instance void [mscorlib]System.AsyncCallback::.ctor(object,
                                                                             native int)
    IL_003e:  stfld      class [mscorlib]System.AsyncCallback ChatClient.Network.ClientSession::handleSendData
    IL_0043:  ret
  } // end of method ClientSession::.ctor

  .method public hidebysig instance bool 
          Start() cil managed
  {
    // 코드 크기       120 (0x78)
    .maxstack  7
    .locals init (class ChatClient.Network.AsyncObject V_0,
             bool V_1)
    IL_0000:  ldc.i4     0x1000
    IL_0005:  newobj     instance void ChatClient.Network.AsyncObject::.ctor(int32)
    IL_000a:  stloc.0
    IL_000b:  ldarg.0
    IL_000c:  ldc.i4.2
    IL_000d:  ldc.i4.1
    IL_000e:  ldc.i4.0
    IL_000f:  newobj     instance void [System]System.Net.Sockets.Socket::.ctor(valuetype [System]System.Net.Sockets.AddressFamily,
                                                                                valuetype [System]System.Net.Sockets.SocketType,
                                                                                valuetype [System]System.Net.Sockets.ProtocolType)
    IL_0014:  stfld      class [System]System.Net.Sockets.Socket ChatClient.Network.ClientSession::clientSocket
    .try
    {
      IL_0019:  ldarg.0
      IL_001a:  ldfld      class [System]System.Net.Sockets.Socket ChatClient.Network.ClientSession::clientSocket
      IL_001f:  ldarg.0
      IL_0020:  ldfld      string ChatClient.Network.ClientSession::serverIp
      IL_0025:  call       class [System]System.Net.IPAddress [System]System.Net.IPAddress::Parse(string)
      IL_002a:  ldarg.0
      IL_002b:  ldfld      int32 ChatClient.Network.ClientSession::serverPort
      IL_0030:  callvirt   instance void [System]System.Net.Sockets.Socket::Connect(class [System]System.Net.IPAddress,
                                                                                    int32)
      IL_0035:  ldloc.0
      IL_0036:  ldarg.0
      IL_0037:  ldfld      class [System]System.Net.Sockets.Socket ChatClient.Network.ClientSession::clientSocket
      IL_003c:  stfld      class [System]System.Net.Sockets.Socket ChatClient.Network.AsyncObject::workingSocket
      IL_0041:  ldarg.0
      IL_0042:  ldfld      class [System]System.Net.Sockets.Socket ChatClient.Network.ClientSession::clientSocket
      IL_0047:  ldloc.0
      IL_0048:  ldfld      uint8[] ChatClient.Network.AsyncObject::buffer
      IL_004d:  ldc.i4.0
      IL_004e:  ldloc.0
      IL_004f:  ldfld      uint8[] ChatClient.Network.AsyncObject::buffer
      IL_0054:  ldlen
      IL_0055:  conv.i4
      IL_0056:  ldc.i4.0
      IL_0057:  ldarg.0
      IL_0058:  ldfld      class [mscorlib]System.AsyncCallback ChatClient.Network.ClientSession::handleReceiveData
      IL_005d:  ldloc.0
      IL_005e:  callvirt   instance class [mscorlib]System.IAsyncResult [System]System.Net.Sockets.Socket::BeginReceive(uint8[],
                                                                                                                        int32,
                                                                                                                        int32,
                                                                                                                        valuetype [System]System.Net.Sockets.SocketFlags,
                                                                                                                        class [mscorlib]System.AsyncCallback,
                                                                                                                        object)
      IL_0063:  pop
      IL_0064:  leave.s    IL_0074

    }  // end .try
    catch [mscorlib]System.Exception 
    {
      IL_0066:  callvirt   instance string [mscorlib]System.Exception::get_Message()
      IL_006b:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_0070:  ldc.i4.0
      IL_0071:  stloc.1
      IL_0072:  leave.s    IL_0076

    }  // end handler
    IL_0074:  ldc.i4.1
    IL_0075:  ret

    IL_0076:  ldloc.1
    IL_0077:  ret
  } // end of method ClientSession::Start

  .method private hidebysig instance bool 
          SendData(class ChatClient.Network.AsyncObject asyncObject) cil managed
  {
    // 코드 크기       55 (0x37)
    .maxstack  7
    .locals init (bool V_0)
    .try
    {
      IL_0000:  ldarg.0
      IL_0001:  ldfld      class [System]System.Net.Sockets.Socket ChatClient.Network.ClientSession::clientSocket
      IL_0006:  ldarg.1
      IL_0007:  ldfld      uint8[] ChatClient.Network.AsyncObject::buffer
      IL_000c:  ldc.i4.0
      IL_000d:  ldarg.1
      IL_000e:  ldfld      uint8[] ChatClient.Network.AsyncObject::buffer
      IL_0013:  ldlen
      IL_0014:  conv.i4
      IL_0015:  ldc.i4.0
      IL_0016:  ldarg.0
      IL_0017:  ldfld      class [mscorlib]System.AsyncCallback ChatClient.Network.ClientSession::handleSendData
      IL_001c:  ldarg.1
      IL_001d:  callvirt   instance class [mscorlib]System.IAsyncResult [System]System.Net.Sockets.Socket::BeginSend(uint8[],
                                                                                                                     int32,
                                                                                                                     int32,
                                                                                                                     valuetype [System]System.Net.Sockets.SocketFlags,
                                                                                                                     class [mscorlib]System.AsyncCallback,
                                                                                                                     object)
      IL_0022:  pop
      IL_0023:  leave.s    IL_0033

    }  // end .try
    catch [mscorlib]System.Exception 
    {
      IL_0025:  callvirt   instance string [mscorlib]System.Exception::get_Message()
      IL_002a:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_002f:  ldc.i4.0
      IL_0030:  stloc.0
      IL_0031:  leave.s    IL_0035

    }  // end handler
    IL_0033:  ldc.i4.1
    IL_0034:  ret

    IL_0035:  ldloc.0
    IL_0036:  ret
  } // end of method ClientSession::SendData

  .method public hidebysig instance bool 
          SendMessage(string message) cil managed
  {
    // 코드 크기       54 (0x36)
    .maxstack  4
    .locals init (class ChatClient.Network.AsyncObject V_0)
    IL_0000:  ldc.i4.1
    IL_0001:  newobj     instance void ChatClient.Network.AsyncObject::.ctor(int32)
    IL_0006:  stloc.0
    IL_0007:  ldloc.0
    IL_0008:  call       class [mscorlib]System.Text.Encoding [mscorlib]System.Text.Encoding::get_Unicode()
    IL_000d:  ldarg.1
    IL_000e:  ldstr      "\n"
    IL_0013:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0018:  callvirt   instance uint8[] [mscorlib]System.Text.Encoding::GetBytes(string)
    IL_001d:  stfld      uint8[] ChatClient.Network.AsyncObject::buffer
    IL_0022:  ldloc.0
    IL_0023:  ldarg.0
    IL_0024:  ldfld      class [System]System.Net.Sockets.Socket ChatClient.Network.ClientSession::clientSocket
    IL_0029:  stfld      class [System]System.Net.Sockets.Socket ChatClient.Network.AsyncObject::workingSocket
    IL_002e:  ldarg.0
    IL_002f:  ldloc.0
    IL_0030:  call       instance bool ChatClient.Network.ClientSession::SendData(class ChatClient.Network.AsyncObject)
    IL_0035:  ret
  } // end of method ClientSession::SendMessage

  .method private hidebysig instance void 
          OnReceiveData(class [mscorlib]System.IAsyncResult ar) cil managed
  {
    // 코드 크기       218 (0xda)
    .maxstack  7
    .locals init (class ChatClient.Network.AsyncObject V_0,
             int32 V_1,
             uint8[] V_2,
             int32 V_3,
             string V_4)
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance object [mscorlib]System.IAsyncResult::get_AsyncState()
    IL_0006:  castclass  ChatClient.Network.AsyncObject
    IL_000b:  stloc.0
    .try
    {
      IL_000c:  ldloc.0
      IL_000d:  ldfld      class [System]System.Net.Sockets.Socket ChatClient.Network.AsyncObject::workingSocket
      IL_0012:  ldarg.1
      IL_0013:  callvirt   instance int32 [System]System.Net.Sockets.Socket::EndReceive(class [mscorlib]System.IAsyncResult)
      IL_0018:  stloc.1
      IL_0019:  leave.s    IL_002a

    }  // end .try
    catch [mscorlib]System.Exception 
    {
      IL_001b:  callvirt   instance string [mscorlib]System.Exception::get_Message()
      IL_0020:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_0025:  leave      IL_00d9

    }  // end handler
    IL_002a:  ldloc.1
    IL_002b:  ldc.i4.0
    IL_002c:  ble.s      IL_00a7

    IL_002e:  ldloc.1
    IL_002f:  newarr     [mscorlib]System.Byte
    IL_0034:  stloc.2
    IL_0035:  ldloc.0
    IL_0036:  ldfld      uint8[] ChatClient.Network.AsyncObject::buffer
    IL_003b:  ldloc.2
    IL_003c:  ldloc.1
    IL_003d:  call       void [mscorlib]System.Array::Copy(class [mscorlib]System.Array,
                                                           class [mscorlib]System.Array,
                                                           int32)
    IL_0042:  ldarg.0
    IL_0043:  ldarg.0
    IL_0044:  ldfld      string ChatClient.Network.ClientSession::Tmprecv
    IL_0049:  call       class [mscorlib]System.Text.Encoding [mscorlib]System.Text.Encoding::get_Unicode()
    IL_004e:  ldloc.2
    IL_004f:  callvirt   instance string [mscorlib]System.Text.Encoding::GetString(uint8[])
    IL_0054:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0059:  stfld      string ChatClient.Network.ClientSession::Tmprecv
    IL_005e:  ldc.i4.0
    IL_005f:  stloc.3
    IL_0060:  br.s       IL_0092

    IL_0062:  ldarg.0
    IL_0063:  ldfld      string ChatClient.Network.ClientSession::Tmprecv
    IL_0068:  ldc.i4.0
    IL_0069:  ldloc.3
    IL_006a:  callvirt   instance string [mscorlib]System.String::Substring(int32,
                                                                            int32)
    IL_006f:  stloc.s    V_4
    IL_0071:  ldsfld     class [mscorlib]System.Collections.Generic.List`1<string> CommModel.CommModel::RecvDataList
    IL_0076:  ldloc.s    V_4
    IL_0078:  callvirt   instance void class [mscorlib]System.Collections.Generic.List`1<string>::Add(!0)
    IL_007d:  ldarg.0
    IL_007e:  ldarg.0
    IL_007f:  ldfld      string ChatClient.Network.ClientSession::Tmprecv
    IL_0084:  ldc.i4.0
    IL_0085:  ldloc.3
    IL_0086:  ldc.i4.1
    IL_0087:  add
    IL_0088:  callvirt   instance string [mscorlib]System.String::Remove(int32,
                                                                         int32)
    IL_008d:  stfld      string ChatClient.Network.ClientSession::Tmprecv
    IL_0092:  ldarg.0
    IL_0093:  ldfld      string ChatClient.Network.ClientSession::Tmprecv
    IL_0098:  ldstr      "\n"
    IL_009d:  callvirt   instance int32 [mscorlib]System.String::IndexOf(string)
    IL_00a2:  dup
    IL_00a3:  stloc.3
    IL_00a4:  ldc.i4.0
    IL_00a5:  bgt.s      IL_0062

    IL_00a7:  nop
    .try
    {
      IL_00a8:  ldloc.0
      IL_00a9:  ldfld      class [System]System.Net.Sockets.Socket ChatClient.Network.AsyncObject::workingSocket
      IL_00ae:  ldloc.0
      IL_00af:  ldfld      uint8[] ChatClient.Network.AsyncObject::buffer
      IL_00b4:  ldc.i4.0
      IL_00b5:  ldloc.0
      IL_00b6:  ldfld      uint8[] ChatClient.Network.AsyncObject::buffer
      IL_00bb:  ldlen
      IL_00bc:  conv.i4
      IL_00bd:  ldc.i4.0
      IL_00be:  ldarg.0
      IL_00bf:  ldfld      class [mscorlib]System.AsyncCallback ChatClient.Network.ClientSession::handleReceiveData
      IL_00c4:  ldloc.0
      IL_00c5:  callvirt   instance class [mscorlib]System.IAsyncResult [System]System.Net.Sockets.Socket::BeginReceive(uint8[],
                                                                                                                        int32,
                                                                                                                        int32,
                                                                                                                        valuetype [System]System.Net.Sockets.SocketFlags,
                                                                                                                        class [mscorlib]System.AsyncCallback,
                                                                                                                        object)
      IL_00ca:  pop
      IL_00cb:  leave.s    IL_00d9

    }  // end .try
    catch [mscorlib]System.Exception 
    {
      IL_00cd:  callvirt   instance string [mscorlib]System.Exception::get_Message()
      IL_00d2:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_00d7:  leave.s    IL_00d9

    }  // end handler
    IL_00d9:  ret
  } // end of method ClientSession::OnReceiveData

  .method private hidebysig instance void 
          OnSendData(class [mscorlib]System.IAsyncResult ar) cil managed
  {
    // 코드 크기       64 (0x40)
    .maxstack  3
    .locals init (class ChatClient.Network.AsyncObject V_0,
             int32 V_1,
             uint8[] V_2)
    IL_0000:  ldarg.1
    IL_0001:  callvirt   instance object [mscorlib]System.IAsyncResult::get_AsyncState()
    IL_0006:  castclass  ChatClient.Network.AsyncObject
    IL_000b:  stloc.0
    .try
    {
      IL_000c:  ldloc.0
      IL_000d:  ldfld      class [System]System.Net.Sockets.Socket ChatClient.Network.AsyncObject::workingSocket
      IL_0012:  ldarg.1
      IL_0013:  callvirt   instance int32 [System]System.Net.Sockets.Socket::EndSend(class [mscorlib]System.IAsyncResult)
      IL_0018:  stloc.1
      IL_0019:  leave.s    IL_0027

    }  // end .try
    catch [mscorlib]System.Exception 
    {
      IL_001b:  callvirt   instance string [mscorlib]System.Exception::get_Message()
      IL_0020:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_0025:  leave.s    IL_003f

    }  // end handler
    IL_0027:  ldloc.1
    IL_0028:  ldc.i4.0
    IL_0029:  ble.s      IL_003f

    IL_002b:  ldloc.1
    IL_002c:  newarr     [mscorlib]System.Byte
    IL_0031:  stloc.2
    IL_0032:  ldloc.0
    IL_0033:  ldfld      uint8[] ChatClient.Network.AsyncObject::buffer
    IL_0038:  ldloc.2
    IL_0039:  ldloc.1
    IL_003a:  call       void [mscorlib]System.Array::Copy(class [mscorlib]System.Array,
                                                           class [mscorlib]System.Array,
                                                           int32)
    IL_003f:  ret
  } // end of method ClientSession::OnSendData

} // end of class ChatClient.Network.ClientSession

.class private auto ansi beforefieldinit CommModel.CommModel
       extends [mscorlib]System.Object
{
  .field public static class [mscorlib]System.Collections.Generic.List`1<string> RecvDataList
  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  ret
  } // end of method CommModel::.ctor

  .method private hidebysig specialname rtspecialname static 
          void  .cctor() cil managed
  {
    // 코드 크기       11 (0xb)
    .maxstack  8
    IL_0000:  newobj     instance void class [mscorlib]System.Collections.Generic.List`1<string>::.ctor()
    IL_0005:  stsfld     class [mscorlib]System.Collections.Generic.List`1<string> CommModel.CommModel::RecvDataList
    IL_000a:  ret
  } // end of method CommModel::.cctor

} // end of class CommModel.CommModel

.class public auto ansi beforefieldinit UnityTemplateProjects.SimpleCameraController
       extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
  .class auto ansi nested private beforefieldinit CameraState
         extends [mscorlib]System.Object
  {
    .field public float32 yaw
    .field public float32 pitch
    .field public float32 roll
    .field public float32 x
    .field public float32 y
    .field public float32 z
    .method public hidebysig instance void 
            SetFromTransform(class [UnityEngine.CoreModule]UnityEngine.Transform t) cil managed
    {
      // 코드 크기       103 (0x67)
      .maxstack  2
      IL_0000:  ldarg.0
      IL_0001:  ldarg.1
      IL_0002:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
      IL_0007:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
      IL_000c:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::pitch
      IL_0011:  ldarg.0
      IL_0012:  ldarg.1
      IL_0013:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
      IL_0018:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::y
      IL_001d:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::yaw
      IL_0022:  ldarg.0
      IL_0023:  ldarg.1
      IL_0024:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_eulerAngles()
      IL_0029:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::z
      IL_002e:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::roll
      IL_0033:  ldarg.0
      IL_0034:  ldarg.1
      IL_0035:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
      IL_003a:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
      IL_003f:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::x
      IL_0044:  ldarg.0
      IL_0045:  ldarg.1
      IL_0046:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
      IL_004b:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::y
      IL_0050:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::y
      IL_0055:  ldarg.0
      IL_0056:  ldarg.1
      IL_0057:  callvirt   instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
      IL_005c:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::z
      IL_0061:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::z
      IL_0066:  ret
    } // end of method CameraState::SetFromTransform

    .method public hidebysig instance void 
            Translate(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 translation) cil managed
    {
      // 코드 크기       88 (0x58)
      .maxstack  3
      .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0)
      IL_0000:  ldarg.0
      IL_0001:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::pitch
      IL_0006:  ldarg.0
      IL_0007:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::yaw
      IL_000c:  ldarg.0
      IL_000d:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::roll
      IL_0012:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion [UnityEngine.CoreModule]UnityEngine.Quaternion::Euler(float32,
                                                                                                                                          float32,
                                                                                                                                          float32)
      IL_0017:  ldarg.1
      IL_0018:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Quaternion::op_Multiply(valuetype [UnityEngine.CoreModule]UnityEngine.Quaternion,
                                                                                                                                             valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
      IL_001d:  stloc.0
      IL_001e:  ldarg.0
      IL_001f:  ldarg.0
      IL_0020:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::x
      IL_0025:  ldloc.0
      IL_0026:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::x
      IL_002b:  add
      IL_002c:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::x
      IL_0031:  ldarg.0
      IL_0032:  ldarg.0
      IL_0033:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::y
      IL_0038:  ldloc.0
      IL_0039:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::y
      IL_003e:  add
      IL_003f:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::y
      IL_0044:  ldarg.0
      IL_0045:  ldarg.0
      IL_0046:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::z
      IL_004b:  ldloc.0
      IL_004c:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector3::z
      IL_0051:  add
      IL_0052:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::z
      IL_0057:  ret
    } // end of method CameraState::Translate

    .method public hidebysig instance void 
            LerpTowards(class UnityTemplateProjects.SimpleCameraController/CameraState target,
                        float32 positionLerpPct,
                        float32 rotationLerpPct) cil managed
    {
      // 코드 크기       145 (0x91)
      .maxstack  4
      IL_0000:  ldarg.0
      IL_0001:  ldarg.0
      IL_0002:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::yaw
      IL_0007:  ldarg.1
      IL_0008:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::yaw
      IL_000d:  ldarg.3
      IL_000e:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Lerp(float32,
                                                                                   float32,
                                                                                   float32)
      IL_0013:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::yaw
      IL_0018:  ldarg.0
      IL_0019:  ldarg.0
      IL_001a:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::pitch
      IL_001f:  ldarg.1
      IL_0020:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::pitch
      IL_0025:  ldarg.3
      IL_0026:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Lerp(float32,
                                                                                   float32,
                                                                                   float32)
      IL_002b:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::pitch
      IL_0030:  ldarg.0
      IL_0031:  ldarg.0
      IL_0032:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::roll
      IL_0037:  ldarg.1
      IL_0038:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::roll
      IL_003d:  ldarg.3
      IL_003e:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Lerp(float32,
                                                                                   float32,
                                                                                   float32)
      IL_0043:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::roll
      IL_0048:  ldarg.0
      IL_0049:  ldarg.0
      IL_004a:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::x
      IL_004f:  ldarg.1
      IL_0050:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::x
      IL_0055:  ldarg.2
      IL_0056:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Lerp(float32,
                                                                                   float32,
                                                                                   float32)
      IL_005b:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::x
      IL_0060:  ldarg.0
      IL_0061:  ldarg.0
      IL_0062:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::y
      IL_0067:  ldarg.1
      IL_0068:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::y
      IL_006d:  ldarg.2
      IL_006e:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Lerp(float32,
                                                                                   float32,
                                                                                   float32)
      IL_0073:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::y
      IL_0078:  ldarg.0
      IL_0079:  ldarg.0
      IL_007a:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::z
      IL_007f:  ldarg.1
      IL_0080:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::z
      IL_0085:  ldarg.2
      IL_0086:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Lerp(float32,
                                                                                   float32,
                                                                                   float32)
      IL_008b:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::z
      IL_0090:  ret
    } // end of method CameraState::LerpTowards

    .method public hidebysig instance void 
            UpdateTransform(class [UnityEngine.CoreModule]UnityEngine.Transform t) cil managed
    {
      // 코드 크기       59 (0x3b)
      .maxstack  8
      IL_0000:  ldarg.1
      IL_0001:  ldarg.0
      IL_0002:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::pitch
      IL_0007:  ldarg.0
      IL_0008:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::yaw
      IL_000d:  ldarg.0
      IL_000e:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::roll
      IL_0013:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                            float32,
                                                                                            float32)
      IL_0018:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_eulerAngles(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
      IL_001d:  ldarg.1
      IL_001e:  ldarg.0
      IL_001f:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::x
      IL_0024:  ldarg.0
      IL_0025:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::y
      IL_002a:  ldarg.0
      IL_002b:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::z
      IL_0030:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Vector3::.ctor(float32,
                                                                                            float32,
                                                                                            float32)
      IL_0035:  callvirt   instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
      IL_003a:  ret
    } // end of method CameraState::UpdateTransform

    .method public hidebysig specialname rtspecialname 
            instance void  .ctor() cil managed
    {
      // 코드 크기       7 (0x7)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0006:  ret
    } // end of method CameraState::.ctor

  } // end of class CameraState

  .field private class UnityTemplateProjects.SimpleCameraController/CameraState m_TargetCameraState
  .field private class UnityTemplateProjects.SimpleCameraController/CameraState m_InterpolatingCameraState
  .field public float32 boost
  .custom instance void [UnityEngine.CoreModule]UnityEngine.HeaderAttribute::.ctor(string) = ( 01 00 11 4D 6F 76 65 6D 65 6E 74 20 53 65 74 74   // ...Movement Sett
                                                                                               69 6E 67 73 00 00 )                               // ings..
  .custom instance void [UnityEngine.CoreModule]UnityEngine.TooltipAttribute::.ctor(string) = ( 01 00 45 45 78 70 6F 6E 65 6E 74 69 61 6C 20 62   // ..EExponential b
                                                                                                6F 6F 73 74 20 66 61 63 74 6F 72 20 6F 6E 20 74   // oost factor on t
                                                                                                72 61 6E 73 6C 61 74 69 6F 6E 2C 20 63 6F 6E 74   // ranslation, cont
                                                                                                72 6F 6C 6C 61 62 6C 65 20 62 79 20 6D 6F 75 73   // rollable by mous
                                                                                                65 20 77 68 65 65 6C 2E 00 00 )                   // e wheel...
  .field public float32 positionLerpTime
  .custom instance void [UnityEngine.CoreModule]UnityEngine.TooltipAttribute::.ctor(string) = ( 01 00 4A 54 69 6D 65 20 69 74 20 74 61 6B 65 73   // ..JTime it takes
                                                                                                20 74 6F 20 69 6E 74 65 72 70 6F 6C 61 74 65 20   //  to interpolate 
                                                                                                63 61 6D 65 72 61 20 70 6F 73 69 74 69 6F 6E 20   // camera position 
                                                                                                39 39 25 20 6F 66 20 74 68 65 20 77 61 79 20 74   // 99% of the way t
                                                                                                6F 20 74 68 65 20 74 61 72 67 65 74 2E 00 00 )    // o the target...
  .custom instance void [UnityEngine.CoreModule]UnityEngine.RangeAttribute::.ctor(float32,
                                                                                  float32) = ( 01 00 6F 12 83 3A 00 00 80 3F 00 00 )             // ..o..:...?..
  .field public class [UnityEngine.CoreModule]UnityEngine.AnimationCurve mouseSensitivityCurve
  .custom instance void [UnityEngine.CoreModule]UnityEngine.HeaderAttribute::.ctor(string) = ( 01 00 11 52 6F 74 61 74 69 6F 6E 20 53 65 74 74   // ...Rotation Sett
                                                                                               69 6E 67 73 00 00 )                               // ings..
  .custom instance void [UnityEngine.CoreModule]UnityEngine.TooltipAttribute::.ctor(string) = ( 01 00 4C 58 20 3D 20 43 68 61 6E 67 65 20 69 6E   // ..LX = Change in
                                                                                                20 6D 6F 75 73 65 20 70 6F 73 69 74 69 6F 6E 2E   //  mouse position.
                                                                                                0A 59 20 3D 20 4D 75 6C 74 69 70 6C 69 63 61 74   // .Y = Multiplicat
                                                                                                69 76 65 20 66 61 63 74 6F 72 20 66 6F 72 20 63   // ive factor for c
                                                                                                61 6D 65 72 61 20 72 6F 74 61 74 69 6F 6E 2E 00   // amera rotation..
                                                                                                00 ) 
  .field public float32 rotationLerpTime
  .custom instance void [UnityEngine.CoreModule]UnityEngine.TooltipAttribute::.ctor(string) = ( 01 00 4A 54 69 6D 65 20 69 74 20 74 61 6B 65 73   // ..JTime it takes
                                                                                                20 74 6F 20 69 6E 74 65 72 70 6F 6C 61 74 65 20   //  to interpolate 
                                                                                                63 61 6D 65 72 61 20 72 6F 74 61 74 69 6F 6E 20   // camera rotation 
                                                                                                39 39 25 20 6F 66 20 74 68 65 20 77 61 79 20 74   // 99% of the way t
                                                                                                6F 20 74 68 65 20 74 61 72 67 65 74 2E 00 00 )    // o the target...
  .custom instance void [UnityEngine.CoreModule]UnityEngine.RangeAttribute::.ctor(float32,
                                                                                  float32) = ( 01 00 6F 12 83 3A 00 00 80 3F 00 00 )             // ..o..:...?..
  .field public bool invertY
  .custom instance void [UnityEngine.CoreModule]UnityEngine.TooltipAttribute::.ctor(string) = ( 01 00 40 57 68 65 74 68 65 72 20 6F 72 20 6E 6F   // ..@Whether or no
                                                                                                74 20 74 6F 20 69 6E 76 65 72 74 20 6F 75 72 20   // t to invert our 
                                                                                                59 20 61 78 69 73 20 66 6F 72 20 6D 6F 75 73 65   // Y axis for mouse
                                                                                                20 69 6E 70 75 74 20 74 6F 20 72 6F 74 61 74 69   //  input to rotati
                                                                                                6F 6E 2E 00 00 )                                  // on...
  .method private hidebysig instance void 
          OnEnable() cil managed
  {
    // 코드 크기       35 (0x23)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  ldfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_TargetCameraState
    IL_0006:  ldarg.0
    IL_0007:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_000c:  callvirt   instance void UnityTemplateProjects.SimpleCameraController/CameraState::SetFromTransform(class [UnityEngine.CoreModule]UnityEngine.Transform)
    IL_0011:  ldarg.0
    IL_0012:  ldfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_InterpolatingCameraState
    IL_0017:  ldarg.0
    IL_0018:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_001d:  callvirt   instance void UnityTemplateProjects.SimpleCameraController/CameraState::SetFromTransform(class [UnityEngine.CoreModule]UnityEngine.Transform)
    IL_0022:  ret
  } // end of method SimpleCameraController::OnEnable

  .method private hidebysig instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 
          GetInputTranslationDirection() cil managed
  {
    // 코드 크기       136 (0x88)
    .maxstack  2
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0)
    IL_0000:  ldloca.s   V_0
    IL_0002:  initobj    [UnityEngine.CoreModule]UnityEngine.Vector3
    IL_0008:  ldc.i4.s   119
    IL_000a:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_000f:  brfalse.s  IL_001d

    IL_0011:  ldloc.0
    IL_0012:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_forward()
    IL_0017:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Addition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_001c:  stloc.0
    IL_001d:  ldc.i4.s   115
    IL_001f:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_0024:  brfalse.s  IL_0032

    IL_0026:  ldloc.0
    IL_0027:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_back()
    IL_002c:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Addition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0031:  stloc.0
    IL_0032:  ldc.i4.s   97
    IL_0034:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_0039:  brfalse.s  IL_0047

    IL_003b:  ldloc.0
    IL_003c:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_left()
    IL_0041:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Addition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0046:  stloc.0
    IL_0047:  ldc.i4.s   100
    IL_0049:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_004e:  brfalse.s  IL_005c

    IL_0050:  ldloc.0
    IL_0051:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_right()
    IL_0056:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Addition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_005b:  stloc.0
    IL_005c:  ldc.i4.s   113
    IL_005e:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_0063:  brfalse.s  IL_0071

    IL_0065:  ldloc.0
    IL_0066:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_down()
    IL_006b:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Addition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0070:  stloc.0
    IL_0071:  ldc.i4.s   101
    IL_0073:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_0078:  brfalse.s  IL_0086

    IL_007a:  ldloc.0
    IL_007b:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_up()
    IL_0080:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Addition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0085:  stloc.0
    IL_0086:  ldloc.0
    IL_0087:  ret
  } // end of method SimpleCameraController::GetInputTranslationDirection

  .method private hidebysig instance void 
          Update() cil managed
  {
    // 코드 크기       369 (0x171)
    .maxstack  4
    .locals init (valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 V_0,
             float32 V_1,
             float32 V_2,
             valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 V_3,
             float32 V_4)
    IL_0000:  ldc.i4.1
    IL_0001:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButtonDown(int32)
    IL_0006:  brfalse.s  IL_000e

    IL_0008:  ldc.i4.1
    IL_0009:  call       void [UnityEngine.CoreModule]UnityEngine.Cursor::set_lockState(valuetype [UnityEngine.CoreModule]UnityEngine.CursorLockMode)
    IL_000e:  ldc.i4.1
    IL_000f:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButtonUp(int32)
    IL_0014:  brfalse.s  IL_0022

    IL_0016:  ldc.i4.1
    IL_0017:  call       void [UnityEngine.CoreModule]UnityEngine.Cursor::set_visible(bool)
    IL_001c:  ldc.i4.0
    IL_001d:  call       void [UnityEngine.CoreModule]UnityEngine.Cursor::set_lockState(valuetype [UnityEngine.CoreModule]UnityEngine.CursorLockMode)
    IL_0022:  ldc.i4.1
    IL_0023:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButton(int32)
    IL_0028:  brfalse.s  IL_009d

    IL_002a:  ldloca.s   V_3
    IL_002c:  ldstr      "Mouse X"
    IL_0031:  call       float32 [UnityEngine.InputLegacyModule]UnityEngine.Input::GetAxis(string)
    IL_0036:  ldstr      "Mouse Y"
    IL_003b:  call       float32 [UnityEngine.InputLegacyModule]UnityEngine.Input::GetAxis(string)
    IL_0040:  ldarg.0
    IL_0041:  ldfld      bool UnityTemplateProjects.SimpleCameraController::invertY
    IL_0046:  brtrue.s   IL_004b

    IL_0048:  ldc.i4.m1
    IL_0049:  br.s       IL_004c

    IL_004b:  ldc.i4.1
    IL_004c:  conv.r4
    IL_004d:  mul
    IL_004e:  call       instance void [UnityEngine.CoreModule]UnityEngine.Vector2::.ctor(float32,
                                                                                          float32)
    IL_0053:  ldarg.0
    IL_0054:  ldfld      class [UnityEngine.CoreModule]UnityEngine.AnimationCurve UnityTemplateProjects.SimpleCameraController::mouseSensitivityCurve
    IL_0059:  ldloca.s   V_3
    IL_005b:  call       instance float32 [UnityEngine.CoreModule]UnityEngine.Vector2::get_magnitude()
    IL_0060:  callvirt   instance float32 [UnityEngine.CoreModule]UnityEngine.AnimationCurve::Evaluate(float32)
    IL_0065:  stloc.s    V_4
    IL_0067:  ldarg.0
    IL_0068:  ldfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_TargetCameraState
    IL_006d:  dup
    IL_006e:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::yaw
    IL_0073:  ldloc.3
    IL_0074:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector2::x
    IL_0079:  ldloc.s    V_4
    IL_007b:  mul
    IL_007c:  add
    IL_007d:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::yaw
    IL_0082:  ldarg.0
    IL_0083:  ldfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_TargetCameraState
    IL_0088:  dup
    IL_0089:  ldfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::pitch
    IL_008e:  ldloc.3
    IL_008f:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector2::y
    IL_0094:  ldloc.s    V_4
    IL_0096:  mul
    IL_0097:  add
    IL_0098:  stfld      float32 UnityTemplateProjects.SimpleCameraController/CameraState::pitch
    IL_009d:  ldarg.0
    IL_009e:  call       instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 UnityTemplateProjects.SimpleCameraController::GetInputTranslationDirection()
    IL_00a3:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_00a8:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Multiply(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_00ad:  stloc.0
    IL_00ae:  ldc.i4     0x130
    IL_00b3:  call       bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
    IL_00b8:  brfalse.s  IL_00c6

    IL_00ba:  ldloc.0
    IL_00bb:  ldc.r4     10.
    IL_00c0:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Multiply(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_00c5:  stloc.0
    IL_00c6:  ldarg.0
    IL_00c7:  ldarg.0
    IL_00c8:  ldfld      float32 UnityTemplateProjects.SimpleCameraController::boost
    IL_00cd:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.InputLegacyModule]UnityEngine.Input::get_mouseScrollDelta()
    IL_00d2:  ldfld      float32 [UnityEngine.CoreModule]UnityEngine.Vector2::y
    IL_00d7:  ldc.r4     0.2
    IL_00dc:  mul
    IL_00dd:  add
    IL_00de:  stfld      float32 UnityTemplateProjects.SimpleCameraController::boost
    IL_00e3:  ldloc.0
    IL_00e4:  ldc.r4     2.
    IL_00e9:  ldarg.0
    IL_00ea:  ldfld      float32 UnityTemplateProjects.SimpleCameraController::boost
    IL_00ef:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Pow(float32,
                                                                                float32)
    IL_00f4:  call       valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::op_Multiply(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
                                                                                                                                        float32)
    IL_00f9:  stloc.0
    IL_00fa:  ldarg.0
    IL_00fb:  ldfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_TargetCameraState
    IL_0100:  ldloc.0
    IL_0101:  callvirt   instance void UnityTemplateProjects.SimpleCameraController/CameraState::Translate(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
    IL_0106:  ldc.r4     1.
    IL_010b:  ldc.r4     9.9999905e-03
    IL_0110:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Log(float32)
    IL_0115:  ldarg.0
    IL_0116:  ldfld      float32 UnityTemplateProjects.SimpleCameraController::positionLerpTime
    IL_011b:  div
    IL_011c:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0121:  mul
    IL_0122:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Exp(float32)
    IL_0127:  sub
    IL_0128:  stloc.1
    IL_0129:  ldc.r4     1.
    IL_012e:  ldc.r4     9.9999905e-03
    IL_0133:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Log(float32)
    IL_0138:  ldarg.0
    IL_0139:  ldfld      float32 UnityTemplateProjects.SimpleCameraController::rotationLerpTime
    IL_013e:  div
    IL_013f:  call       float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
    IL_0144:  mul
    IL_0145:  call       float32 [UnityEngine.CoreModule]UnityEngine.Mathf::Exp(float32)
    IL_014a:  sub
    IL_014b:  stloc.2
    IL_014c:  ldarg.0
    IL_014d:  ldfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_InterpolatingCameraState
    IL_0152:  ldarg.0
    IL_0153:  ldfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_TargetCameraState
    IL_0158:  ldloc.1
    IL_0159:  ldloc.2
    IL_015a:  callvirt   instance void UnityTemplateProjects.SimpleCameraController/CameraState::LerpTowards(class UnityTemplateProjects.SimpleCameraController/CameraState,
                                                                                                             float32,
                                                                                                             float32)
    IL_015f:  ldarg.0
    IL_0160:  ldfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_InterpolatingCameraState
    IL_0165:  ldarg.0
    IL_0166:  call       instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
    IL_016b:  callvirt   instance void UnityTemplateProjects.SimpleCameraController/CameraState::UpdateTransform(class [UnityEngine.CoreModule]UnityEngine.Transform)
    IL_0170:  ret
  } // end of method SimpleCameraController::Update

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 코드 크기       143 (0x8f)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  newobj     instance void UnityTemplateProjects.SimpleCameraController/CameraState::.ctor()
    IL_0006:  stfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_TargetCameraState
    IL_000b:  ldarg.0
    IL_000c:  newobj     instance void UnityTemplateProjects.SimpleCameraController/CameraState::.ctor()
    IL_0011:  stfld      class UnityTemplateProjects.SimpleCameraController/CameraState UnityTemplateProjects.SimpleCameraController::m_InterpolatingCameraState
    IL_0016:  ldarg.0
    IL_0017:  ldc.r4     3.5
    IL_001c:  stfld      float32 UnityTemplateProjects.SimpleCameraController::boost
    IL_0021:  ldarg.0
    IL_0022:  ldc.r4     0.2
    IL_0027:  stfld      float32 UnityTemplateProjects.SimpleCameraController::positionLerpTime
    IL_002c:  ldarg.0
    IL_002d:  ldc.i4.2
    IL_002e:  newarr     [UnityEngine.CoreModule]UnityEngine.Keyframe
    IL_0033:  dup
    IL_0034:  ldc.i4.0
    IL_0035:  ldc.r4     0.0
    IL_003a:  ldc.r4     0.5
    IL_003f:  ldc.r4     0.0
    IL_0044:  ldc.r4     5.
    IL_0049:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Keyframe::.ctor(float32,
                                                                                           float32,
                                                                                           float32,
                                                                                           float32)
    IL_004e:  stelem     [UnityEngine.CoreModule]UnityEngine.Keyframe
    IL_0053:  dup
    IL_0054:  ldc.i4.1
    IL_0055:  ldc.r4     1.
    IL_005a:  ldc.r4     2.5
    IL_005f:  ldc.r4     0.0
    IL_0064:  ldc.r4     0.0
    IL_0069:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.Keyframe::.ctor(float32,
                                                                                           float32,
                                                                                           float32,
                                                                                           float32)
    IL_006e:  stelem     [UnityEngine.CoreModule]UnityEngine.Keyframe
    IL_0073:  newobj     instance void [UnityEngine.CoreModule]UnityEngine.AnimationCurve::.ctor(valuetype [UnityEngine.CoreModule]UnityEngine.Keyframe[])
    IL_0078:  stfld      class [UnityEngine.CoreModule]UnityEngine.AnimationCurve UnityTemplateProjects.SimpleCameraController::mouseSensitivityCurve
    IL_007d:  ldarg.0
    IL_007e:  ldc.r4     9.9999998e-03
    IL_0083:  stfld      float32 UnityTemplateProjects.SimpleCameraController::rotationLerpTime
    IL_0088:  ldarg.0
    IL_0089:  call       instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
    IL_008e:  ret
  } // end of method SimpleCameraController::.ctor

} // end of class UnityTemplateProjects.SimpleCameraController

.class private auto ansi sealed '<PrivateImplementationDetails>'
       extends [mscorlib]System.Object
{
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = ( 01 00 00 00 ) 
  .class explicit ansi sealed nested private '__StaticArrayInitTypeSize=602'
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 602
  } // end of class '__StaticArrayInitTypeSize=602'

  .class explicit ansi sealed nested private '__StaticArrayInitTypeSize=1091'
         extends [mscorlib]System.ValueType
  {
    .pack 1
    .size 1091
  } // end of class '__StaticArrayInitTypeSize=1091'

  .field static assembly initonly valuetype '<PrivateImplementationDetails>'/'__StaticArrayInitTypeSize=1091' '744A9C297184D8C8EC7FEC9C2BEF4C2160A899C7C9BC841300B91AA011E8E369' at I_00006C08
  .field static assembly initonly valuetype '<PrivateImplementationDetails>'/'__StaticArrayInitTypeSize=602' CBD2B5F4E66323E55A667182BC95F69804B28257B395037C183F3902730D2C6A at I_00007050
} // end of class '<PrivateImplementationDetails>'


// =============================================================

.data cil I_00006C08 = bytearray (
                 00 00 00 01 00 00 00 47 5C 41 73 73 65 74 73 5C  // .......G\Assets\
                 50 61 72 74 69 63 6C 65 50 61 63 6B 5C 45 66 66  // ParticlePack\Eff
                 65 63 74 45 78 61 6D 70 6C 65 73 5C 4D 69 73 63  // ectExamples\Misc
                 20 45 66 66 65 63 74 73 5C 53 63 72 69 70 74 73  //  Effects\Scripts
                 5C 53 70 61 77 6E 45 66 66 65 63 74 2E 63 73 00  // \SpawnEffect.cs.
                 00 00 01 00 00 00 36 5C 41 73 73 65 74 73 5C 50  // ......6\Assets\P
                 61 72 74 69 63 6C 65 50 61 63 6B 5C 53 68 61 72  // articlePack\Shar
                 65 64 5C 52 61 6D 70 73 5C 52 75 6E 74 69 6D 65  // ed\Ramps\Runtime
                 5C 52 61 6D 70 41 73 73 65 74 2E 63 73 00 00 00  // \RampAsset.cs...
                 01 00 00 00 36 5C 41 73 73 65 74 73 5C 50 61 72  // ....6\Assets\Par
                 74 69 63 6C 65 50 61 63 6B 5C 53 68 61 72 65 64  // ticlePack\Shared
                 5C 53 63 72 69 70 74 73 5C 41 64 6A 75 73 74 54  // \Scripts\AdjustT
                 69 6D 65 53 63 61 6C 65 2E 63 73 00 00 00 01 00  // imeScale.cs.....
                 00 00 38 5C 41 73 73 65 74 73 5C 50 61 72 74 69  // ..8\Assets\Parti
                 63 6C 65 50 61 63 6B 5C 53 68 61 72 65 64 5C 53  // clePack\Shared\S
                 63 72 69 70 74 73 5C 50 72 6F 78 69 6D 69 74 79  // cripts\Proximity
                 41 63 74 69 76 61 74 65 2E 63 73 00 00 00 02 00  // Activate.cs.....
                 00 00 3D 5C 41 73 73 65 74 73 5C 50 61 72 74 69  // ..=\Assets\Parti
                 63 6C 65 50 61 63 6B 5C 53 68 61 72 65 64 5C 53  // clePack\Shared\S
                 63 72 69 70 74 73 5C 53 69 6D 70 6C 65 43 61 6D  // cripts\SimpleCam
                 65 72 61 43 6F 6E 74 72 6F 6C 6C 65 72 2E 63 73  // eraController.cs
                 00 00 00 01 00 00 00 3B 5C 41 73 73 65 74 73 5C  // .......;\Assets\
                 50 61 72 74 69 63 6C 65 50 61 63 6B 5C 53 68 61  // ParticlePack\Sha
                 72 65 64 5C 53 63 72 69 70 74 73 5C 53 69 6D 70  // red\Scripts\Simp
                 6C 65 43 68 61 72 61 63 74 65 72 4D 6F 74 6F 72  // leCharacterMotor
                 2E 63 73 00 00 00 02 00 00 00 33 5C 41 73 73 65  // .cs.......3\Asse
                 74 73 5C 50 61 72 74 69 63 6C 65 50 61 63 6B 5C  // ts\ParticlePack\
                 54 75 74 6F 72 69 61 6C 49 6E 66 6F 5C 53 63 72  // TutorialInfo\Scr
                 69 70 74 73 5C 52 65 61 64 6D 65 2E 63 73 00 00  // ipts\Readme.cs..
                 00 01 00 00 00 1C 5C 41 73 73 65 74 73 5C 53 63  // ......\Assets\Sc
                 72 69 70 74 73 5C 42 6F 78 52 65 6C 6F 61 64 2E  // ripts\BoxReload.
                 63 73 00 00 00 01 00 00 00 1F 5C 41 73 73 65 74  // cs........\Asset
                 73 5C 53 63 72 69 70 74 73 5C 43 61 6D 65 72 61  // s\Scripts\Camera
                 4D 6F 76 69 6E 67 2E 63 73 00 00 00 01 00 00 00  // Moving.cs.......
                 1C 5C 41 73 73 65 74 73 5C 53 63 72 69 70 74 73  // .\Assets\Scripts
                 5C 43 6F 6D 6D 4D 6F 64 65 6C 2E 63 73 00 00 00  // \CommModel.cs...
                 01 00 00 00 1F 5C 41 73 73 65 74 73 5C 53 63 72  // .....\Assets\Scr
                 69 70 74 73 5C 43 6F 6E 76 65 79 6F 72 42 65 6C  // ipts\ConveyorBel
                 74 2E 63 73 00 00 00 01 00 00 00 1B 5C 41 73 73  // t.cs........\Ass
                 65 74 73 5C 53 63 72 69 70 74 73 5C 43 79 6C 69  // ets\Scripts\Cyli
                 6E 64 65 72 2E 63 73 00 00 00 01 00 00 00 1E 5C  // nder.cs........\
                 41 73 73 65 74 73 5C 53 63 72 69 70 74 73 5C 43  // Assets\Scripts\C
                 79 6C 69 6E 64 65 72 42 54 4E 2E 63 73 00 00 00  // ylinderBTN.cs...
                 01 00 00 00 20 5C 41 73 73 65 74 73 5C 53 63 72  // .... \Assets\Scr
                 69 70 74 73 5C 45 6E 64 45 78 70 6C 6F 73 73 69  // ipts\EndExplossi
                 6F 6E 2E 63 73 00 00 00 01 00 00 00 1E 5C 41 73  // on.cs........\As
                 73 65 74 73 5C 53 63 72 69 70 74 73 5C 4C 69 66  // sets\Scripts\Lif
                 74 43 6F 6E 74 72 6F 6C 2E 63 73 00 00 00 01 00  // tControl.cs.....
                 00 00 1D 5C 41 73 73 65 74 73 5C 53 63 72 69 70  // ...\Assets\Scrip
                 74 73 5C 4C 69 66 74 53 65 6E 73 6F 72 2E 63 73  // ts\LiftSensor.cs
                 00 00 00 01 00 00 00 23 5C 41 73 73 65 74 73 5C  // .......#\Assets\
                 53 63 72 69 70 74 73 5C 4C 69 66 74 55 70 44 6F  // Scripts\LiftUpDo
                 77 6E 53 65 6E 73 6F 72 2E 63 73 00 00 00 01 00  // wnSensor.cs.....
                 00 00 22 5C 41 73 73 65 74 73 5C 53 63 72 69 70  // .."\Assets\Scrip
                 74 73 5C 4D 6F 75 73 65 43 6C 69 63 6B 45 76 65  // ts\MouseClickEve
                 6E 74 2E 63 73 00 00 00 01 00 00 00 26 5C 41 73  // nt.cs.......&\As
                 73 65 74 73 5C 53 63 72 69 70 74 73 5C 4E 65 74  // sets\Scripts\Net
                 77 6F 72 6B 5C 41 73 79 6E 63 4F 62 6A 65 63 74  // work\AsyncObject
                 2E 63 73 00 00 00 02 00 00 00 28 5C 41 73 73 65  // .cs.......(\Asse
                 74 73 5C 53 63 72 69 70 74 73 5C 4E 65 74 77 6F  // ts\Scripts\Netwo
                 72 6B 5C 43 6C 69 65 6E 74 53 65 73 73 69 6F 6E  // rk\ClientSession
                 2E 63 73 00 00 00 01 00 00 00 1A 5C 41 73 73 65  // .cs........\Asse
                 74 73 5C 53 63 72 69 70 74 73 5C 53 65 6E 73 6F  // ts\Scripts\Senso
                 72 73 2E 63 73 00 00 00 01 00 00 00 1F 5C 41 73  // rs.cs........\As
                 73 65 74 73 5C 53 63 72 69 70 74 73 5C 53 6F 63  // sets\Scripts\Soc
                 6B 65 74 43 6C 69 65 6E 74 2E 63 73 00 00 00 01  // ketClient.cs....
                 00 00 00 1F 5C 41 73 73 65 74 73 5C 53 63 72 69  // ....\Assets\Scri
                 70 74 73 5C 57 68 65 65 6C 43 6F 6E 74 72 6F 6C  // pts\WheelControl
                 2E 63 73)                                        // .cs
.data cil I_0000704B = int8[5]
.data cil I_00007050 = bytearray (
                 00 00 00 00 0C 7C 53 70 61 77 6E 45 66 66 65 63  // .....|SpawnEffec
                 74 00 00 00 00 0A 7C 52 61 6D 70 41 73 73 65 74  // t.....|RampAsset
                 00 00 00 00 10 7C 41 64 6A 75 73 74 54 69 6D 65  // .....|AdjustTime
                 53 63 61 6C 65 00 00 00 00 12 7C 50 72 6F 78 69  // Scale.....|Proxi
                 6D 69 74 79 41 63 74 69 76 61 74 65 00 00 00 00  // mityActivate....
                 2C 55 6E 69 74 79 54 65 6D 70 6C 61 74 65 50 72  // ,UnityTemplatePr
                 6F 6A 65 63 74 73 7C 53 69 6D 70 6C 65 43 61 6D  // ojects|SimpleCam
                 65 72 61 43 6F 6E 74 72 6F 6C 6C 65 72 00 00 00  // eraController...
                 00 38 55 6E 69 74 79 54 65 6D 70 6C 61 74 65 50  // .8UnityTemplateP
                 72 6F 6A 65 63 74 73 2E 53 69 6D 70 6C 65 43 61  // rojects.SimpleCa
                 6D 65 72 61 43 6F 6E 74 72 6F 6C 6C 65 72 7C 43  // meraController|C
                 61 6D 65 72 61 53 74 61 74 65 00 00 00 00 15 7C  // ameraState.....|
                 53 69 6D 70 6C 65 43 68 61 72 61 63 74 65 72 4D  // SimpleCharacterM
                 6F 74 6F 72 00 00 00 00 07 7C 52 65 61 64 6D 65  // otor.....|Readme
                 00 00 00 00 0E 52 65 61 64 6D 65 7C 53 65 63 74  // .....Readme|Sect
                 69 6F 6E 00 00 00 00 0A 7C 42 6F 78 52 65 6C 6F  // ion.....|BoxRelo
                 61 64 00 00 00 00 0D 7C 43 61 6D 65 72 61 4D 6F  // ad.....|CameraMo
                 76 69 6E 67 00 00 00 00 13 43 6F 6D 6D 4D 6F 64  // ving.....CommMod
                 65 6C 7C 43 6F 6D 6D 4D 6F 64 65 6C 00 00 00 00  // el|CommModel....
                 0D 7C 43 6F 6E 76 65 79 6F 72 42 65 6C 74 00 00  // .|ConveyorBelt..
                 00 00 09 7C 43 79 6C 69 6E 64 65 72 00 00 00 00  // ...|Cylinder....
                 0C 7C 43 79 6C 69 6E 64 65 72 42 54 4E 00 00 00  // .|CylinderBTN...
                 00 0E 7C 45 6E 64 45 78 70 6C 6F 73 73 69 6F 6E  // ..|EndExplossion
                 00 00 00 00 0C 7C 4C 69 66 74 43 6F 6E 74 72 6F  // .....|LiftContro
                 6C 00 00 00 00 0B 7C 4C 69 66 74 53 65 6E 73 6F  // l.....|LiftSenso
                 72 00 00 00 00 11 7C 4C 69 66 74 55 70 44 6F 77  // r.....|LiftUpDow
                 6E 53 65 6E 73 6F 72 00 00 00 00 10 7C 4D 6F 75  // nSensor.....|Mou
                 73 65 43 6C 69 63 6B 45 76 65 6E 74 00 00 00 00  // seClickEvent....
                 1E 43 68 61 74 43 6C 69 65 6E 74 2E 4E 65 74 77  // .ChatClient.Netw
                 6F 72 6B 7C 41 73 79 6E 63 4F 62 6A 65 63 74 01  // ork|AsyncObject.
                 00 00 00 20 43 68 61 74 43 6C 69 65 6E 74 2E 4E  // ... ChatClient.N
                 65 74 77 6F 72 6B 7C 43 6C 69 65 6E 74 53 65 73  // etwork|ClientSes
                 73 69 6F 6E 01 00 00 00 20 43 68 61 74 43 6C 69  // sion.... ChatCli
                 65 6E 74 2E 4E 65 74 77 6F 72 6B 7C 43 6C 69 65  // ent.Network|Clie
                 6E 74 53 65 73 73 69 6F 6E 00 00 00 00 08 7C 53  // ntSession.....|S
                 65 6E 73 6F 72 73 00 00 00 00 0D 7C 53 6F 63 6B  // ensors.....|Sock
                 65 74 43 6C 69 65 6E 74 00 00 00 00 0D 7C 57 68  // etClient.....|Wh
                 65 65 6C 43 6F 6E 74 72 6F 6C)                   // eelControl
// *********** 디스어셈블리 완료 ***********************
// 경고: Win32 리소스 파일 C:\study\Csharp-language\WindowsForms_0619\asmcs.res을(를) 만들었습니다.
