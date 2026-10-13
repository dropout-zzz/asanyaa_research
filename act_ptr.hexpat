// *.PTR
//
// information for accessing *.TXD string table

import type.magic;

struct Entry {
  u32 textID;
  u32 offsetInTxd;
  u32 length;
};

struct ActPtrFile {
  type::Magic<"PTR "> magic;
  u32 nEntries;
  s32 unk1[2];
  Entry entries[nEntries];
};

ActPtrFile root @ 0x0;
