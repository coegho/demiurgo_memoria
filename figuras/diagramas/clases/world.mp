input metauml;
beginfig(1);
Class.World("World")
      ("+name: String",
       "+currentObjId: long",
       "+currentRoomId: long",
       "+untraceableDecisions: Map<User, String>",
       "+pendingRooms: List<DemiurgoRoom>") %TODO
      ("+moveTo(origin: DemiurgoLocation, destination: DemiurgoLocation, obj: DemiurgoObject): void",
       "+newRoom(room: DemiurgoRoom): DemiurgoRoom",
       "+newRoom(roomLongName: String): DemiurgoRoom",
       "+getRoom(roomRelativeName: String, currentRoom: String): DemiurgoRoom",
       "+getRoom(roomLongName: String): DemiurgoRoom");

drawObject(World);
endfig;
end 