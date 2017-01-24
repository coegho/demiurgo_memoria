input metauml;
beginfig(1);
    Class.WO("DemiurgoObject") () ();
    
    Class.WL("DemiurgoLocation") () ();
      
    Class.WR("DemiurgoRoom") () ();
      
    Class.Action("Action")  () ();

    Class.Witness("Witness") () ();
    
    Class.World("World") () ();
	
    Class.Klass("DemiurgoClass") () ();
    
    Class.ROC("RootObjectClass") () ();
    
    Class.User("User") () ();
      
	
    Class.RP("RoomPath") () ();
      
    Class.Inv("Inventory") () ();
    
    Class.Method("ClassMethod") () ();

    
    Package.Universe("es.usc.rai.coego.martin.demiurgo.universe")(WO, WL, WR, World, Klass, User, ROC, RP, Inv, Method, Action, Witness);
    
    leftToRight(50)(Inv, WL);
    leftToRight(50)(WO, Witness, Action);
    leftToRight(50)(User, World, WR);
    leftToRight(50)(ROC, Klass, RP);
    
    topToBottom.left(40)(Inv, Action, World, Klass, Method);
    
    drawObject(Universe);
    
    
    link(inheritance)(WR.n -- WL.s);
    link(inheritance)(Inv.e -- WL.w);
    
    link(association)(Klass.nw -- WO.sw); %ownClass
    link(association)(User.nw -- WO.s); %user
    
    link(aggregation)(WO.e -- WL.sw); %objects
    
    link(aggregation)(Action.s -- WR.n); %actions
    
    link(aggregation)(Witness.e -- Action.w); %witnesses
    
    link(association)(User.n -- Witness.s); %user
    
    link(inheritance)(ROC.e -- Klass.w);
    %link(association)(Klass.se -- Klass.sw); %parentClass
    link(composition)(Method.n -- Klass.s); %methods TODO: constructor
    
    %link(composition)(RP.se -- RP.sw); %children
    link(association)(WR.se -- RP.n); %ownRoom
    
    link(association)(WO.ne -- Inv.w); %container
    
    link(composition)(Klass.n -- World.s);
    link(composition)(WO.se -- World.nw);
    link(composition)(WL.sw -- World.ne);
    link(composition)(User.e -- World.w);
    link(composition)(RP.nw -- World.se);
    
endfig;
end 
