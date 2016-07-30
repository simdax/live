(
Pdef(\_midi, Pbind(\type, \midi,
	\midiout, PlazyEnvir{arg midiout=MIDIOut(1); midiout.iter.repeat}
));
Pdef(\_midiVol,
	Pbind( 
		\ctlNum, 7, \chan, 2, 
		\midicmd, \control,
		\control, Pseg([110,215].pseq(inf), 4),
		\dur, 0.5
	).trace
)
)