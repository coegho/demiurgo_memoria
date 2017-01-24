input metauml;
beginfig(1);
    Class.WO("DemiurgoObject")
      ("+id: long",
       "+fields: Map<String, ValueInterface>")
      ("+moveTo(location: DemiurgoLocation): void");
    
    Class.WL("DemiurgoLocation")
      ("+id: long",
       "+world: World")
      ("getRealLocation(): DemiurgoLocation",
       "isInsideOf(DemiurgoLocation): boolean");
      
    Class.WR("DemiurgoRoom")
      ("+longPath : String",
       "+variables : Map<String, ValueInterface>",
       "+prenarration: String")
      ();
      
    Class.Action("Action") 
      ("+id : long",
       "+narration: String",
       "+date: Date",
       "+published: boolean")
      ();

    Class.Witness("Witness")
      ("+decision: String")
      ();
    
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
	
    Class.Klass("DemiurgoClass")
      ("+className: String",
       "+fields: Map<String, ValueInterface>")
      ("+inheritFrom(tryParent: DemiurgoClass): boolean");
    
    Class.ROC("RootObjectClass") () ();
    
    Class.User("User")
      ("+username: String",
       "+role: UserRole",
       "+decision: String")
      ();
      
	
    Class.RP("RoomPath")
      ("+path: String")
      ("+getShortName(): String");
      
    Class.Inv("Inventory")
      ("+container: DemiurgoObject",
       "+varName : String")
      ();
    
    Class.Method("ClassMethod")
      ("+node: ParseTree",
       "+argNames: List<String>",
       "+args: Map<String, ValueInterface>",
       "+retVarName: String")
      ("+hasReturnArgument(): boolean",
       "+checkArgs(argValues: List<ValueInterface>): boolean");

    
    Package.Universe("es.usc.rai.coego.martin.demiurgo.universe")(WO, WL, WR, World, Klass, User, ROC, RP, Inv, Method, Action, Witness);
    
    leftToRight(20)(WO, User);
    leftToRight(20)(WL, WR, Inv);
    leftToRight(20)(Method,RP);
    leftToRight(20)(Klass, ROC);
    leftToRight(20)(Action, Witness);
    
    topToBottom.left(17)(WO, WL, World, Method, Klass, Action);
    
    drawObject(Universe);
    
    
    link(inheritance)(WR.w -- WL.e);
    
    link(association)(Klass.n-(10,0) -- WO.s); %ownClass
    link(association)(User.w -- WO.e); %user
    
    link(aggregation)(WO.s-(20,0) -- WL.n); %objects
    
    link(aggregation)(Action.s-(20,0) -- WR.n); %actions
    
    link(aggregation)(Witness.s-(20,0) -- Action.n); %witnesses
    
    link(association)(User.s-(20,0) -- Witness.n); %user
    
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
