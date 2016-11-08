input metauml;
beginfig(1);
    Class.WO("WorldObject")
      ("+id: long",
       "+fields: Map<String, ValueInterface>")
      ("+moveTo(location: WorldLocation): void",
       "+toJSON(): ObjectNode");
    
    Class.WL("WorldLocation")
      ("+id: long",
       "+world: World")
      ();
      
    Class.WR("WorldRoom")
      ("+longPath : String",
       "+variables : Map<String, ValueInterface>",
       "+narratedAction: String",
       "+decisions: Map<User, String>")
      ("+toJSON(): ObjectNode"); 

    
    Class.World("World")
      ("+name: String",
       "+currentObjId: long",
       "+currentRoomId: long",
       "+untraceableDecisions: Map<User, String>",
       "+pendingRooms: List<WorldRoom>") %TODO
      ("+moveTo(origin: WorldLocation, destination: WorldLocation, obj: WorldObject): void",
       "#searchRoomGroup(loc: String, constructive: boolean): RoomPath",
       "+newRoom(roomRelativeName: String, currentRoom: String): WorldRoom",
       "+newRoom(room: WorldRoom): WorldRoom",
       "+newRoom(roomLongName: String): WorldRoom",
       "+getRoom(roomRelativeName: String, currentRoom: String): WorldRoom",
       "+getRoom(roomLongName: String): WorldRoom",
       "+getPendingRoomsJSON(): ArrayNode");
	
    Class.Klass("UserDefinedClass")
      ("+className: String",
       "+fields: Map<String, ValueInterface>")
      ("+inheritFrom(tryParent: UserDefinedClass): boolean");
    
    Class.ROC("RootObjectClass") () ();
    
    Class.User("User")
      ("+username: String",
       "+admin: boolean")
      ("+toJSON(): ObjectNode");
      
	
    Class.RP("RoomPath")
      ("+path: String")
      ("+getShortName(): String",
       "+roomPathData(): ObjectNode");
      
    Class.Inv("Inventory") () ();
    
    Class.Method("ClassMethod")
      ("+node: ParseTree",
       "+argNames: List<String>",
       "+args: Map<String, ValueInterface>",
       "+retVarName: String")
      ("+hasReturnArgument(): boolean",
       "+checkArgs(argValues: List<ValueInterface>): boolean");

    
    Package.Universe("es.usc.rai.coego.martin.demiurgo.universe")(WO, WL, WR, World, Klass, User, ROC, RP, Inv, Method);
    
    leftToRight(20)(WO, User);
    leftToRight(20)(WL, WR, Inv);
    leftToRight(20)(Method,RP);
    leftToRight(20)(Klass, ROC);
    
    topToBottom.left(17)(WO, WL, World, Method, Klass);
    
    drawObject(Universe);
    
    
    link(inheritance)(WR.w -- WL.e);
    
    link(association)(Klass.n-(10,0) -- WO.s); %ownClass
    link(association)(User.w -- WO.e); %user
    
    link(aggregation)(WO.s-(20,0) -- WL.n); %objects
    
    link(inheritance)(ROC.w -- Klass.e);
    link(association)(Klass.se -- Klass.sw); %parentClass
    link(composition)(Method.sw+(30,0) -- Klass.nw+(30,0)); %methods TODO: constructor
    
    link(composition)(RP.se -- RP.sw); %children
    link(association)(WR.se+(0,20) -- RP.ne); %ownRoom
    
    link(association)(WO.e-(0,10) -- Inv.nw); %container
    
    link(composition)(Klass.n+(10,0) -- World.s);
    link(composition)(WO.s-(10,0) -- World.nw);
    link(composition)(WL.s -- World.nw+(20,0));
    link(composition)(User.se -- World.ne);
    link(composition)(RP.n -- World.se-(30,0));
    link(composition)(ROC.n - (10,0) -- World.s + (20,0));
    
endfig;
end 
