(

//patterns
//recursive load
var f;
f={arg p;
	p.entries.do { |x|
		//		x.postln;  // so we can check for errors
		if(x.isFolder){f.value(x)}
		{if(x.extension=="scd")
			{x.absolutePath.load}
			{"fichier évité => ".post; x.absolutePath.postln}
		}
};
};
f.value(PathName("patterns".resolveRelative));


//GUI
// "GUI/mel.scd".loadRelative;
// "GUI/son.scd".loadRelative;

//MIDI
//"extProg.scd".loadRelative;


)


