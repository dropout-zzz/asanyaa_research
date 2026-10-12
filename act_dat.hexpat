// ACT_*.DAT
//
// separate metadatas for managing *.spt files

enum ScriptType : u32 {
  Scenario = 0,
  Selection = 1,
};

fn script_letter(auto value) {
  return char(u8('A') + value);
};

struct SptDesc {
  char scriptTitle[]; $ += 80 - sizeof(scriptTitle);
  u32 firstLineNo;
  u32 lastLineNo;
  u32 scriptLetter [[format("script_letter")]];
  u32 scriptID;
  u32 scriptSubID;
  ScriptType scriptType;
  s32 unk1;
  u32 nextScriptLetter [[format("script_letter")]];
  u32 nextScriptID;
  s32 nextScriptSubID[10];
};

struct ActDat {
  u32 nSptFile;
  SptDesc entries[nSptFile];
};

ActDat root @ 0x0;
