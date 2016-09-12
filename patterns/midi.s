
	// TODO TRANSFORME PDEFALLGUI
	// AVEC BOUTON POUR CONTROLER MIDI
	(
var midi=PlazyEnvir{arg port=0, chan=0;
	Pbind(\type, \midi, \midiout,MIDIOut(port),\chan,chan)
};
Window.closeAll;
a=PdefAllGui();
a.object.keysValuesDo{arg k,v;
v.source=Pchain(midi,v.source).repeat;
}


)
