(

//patterns
//recursive load

f={arg p;
	p.entries.do { |x|
		if(x.postln.isFolder){f.value(x)}
		{x.absolutePath.load}
};
};
f.value(PathName("./patterns".resolveRelative));


//GUI
"GUI/mel.scd".loadRelative;
"GUI/son.scd".loadRelative;

//MIDI
"extProg.scd".loadRelative;
"midiCtl.scd".loadRelative;

)


