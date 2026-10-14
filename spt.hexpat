// *.spt
//
// game script.

enum Opcode : u32 {
  Dialogue = 0x01,
  PlayBgm = 0x06,
  FadeInBgm = 0x07,
  FadeOutBgm = 0x08,
  StopBgm = 0x09,
  PlaySfx = 0x0a,
  PlaySfxLoop = 0x0b,
  PlaySfxFadeOut = 0x0d,
  PlayMovie = 0x0f,
  Control = 0x14,
  WhiteOut = 0x18,
  Wait = 0x1d,
  SetFlag = 0x21,
  ConditionalFarJump = 0x22,
  ConditionalNearJump = 0x23,
  JumpLabelDummy = 0x26,
  CompareFlagEquals = 0x28,
};

fn line_no(u32 value) {
  return value + 1;
};

struct InstInfo {
  Opcode opcode;
  if (opcode == Opcode::Dialogue) {
    u32 characterID;
    u32 voiceID;
    s32 unk1;
    u32 debugLineNo [[format("line_no")]];
    u32 nOccupyLines;
    s32 unk2;
    u32 textID;
  } else if (opcode == Opcode::SetFlag) {
    s32 unk1[3];
    u32 newValue;
    s32 unk2[2];
    u32 flagID;
  } else if (opcode == Opcode::Wait) {
    s32 unk1[6];
    s32 milliseconds;
  } else if (opcode == Opcode::ConditionalFarJump) {
    s32 unk1[3];
    s32 trueScriptSubID;
    s32 falseScriptSubID;
    s32 unk2;
    s32 conditionFlagID;
  } else if (opcode == Opcode::JumpLabelDummy) {
    s32 unk1[6];
    u32 jumpLabelID;
  } else if (opcode == Opcode::ConditionalNearJump) {
    s32 unk1[3];
    s32 trueInstructionIndex;
    s32 falseInstructionIndex;
    s32 unk2;
    s32 conditionFlagID;
  } else if (opcode == Opcode::CompareFlagEquals) {
    s32 unk1[3];
    u32 flagID;
    u32 expectedValue;
    s32 unk2[2];
  } else if (opcode == Opcode::PlayMovie) {
    s32 unk1[6];
    u32 movieID;
  } else if (opcode == Opcode::Control) {
    s32 unk1[3];
    s32 arg2;
    s32 arg1;
    s32 unk2;
    u32 what;
  } else if (opcode == Opcode::PlaySfx
             || opcode == Opcode::PlaySfxFadeOut
             || opcode == Opcode::PlaySfxLoop) {
    s32 unk1[6];
    u32 soundEffectID;
  } else if (opcode == Opcode::FadeInBgm
             || opcode == Opcode::FadeOutBgm
             || opcode == Opcode::StopBgm
             || opcode == Opcode::PlayBgm) {
    s32 unk1[6];
    u32 backgroundMusicID;
  } else {
    s32 unk1[7];
  }
};

struct SptFile {
  u32 nInstruction;
  InstInfo instructions[nInstruction];
};

SptFile root @ 0x0;
