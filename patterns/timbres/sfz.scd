(

Event.addEventType(\sfz, {
	var amp=~amp.value; 
	var note=~midinote.value;
	if(amp<1){amp=60};
	r{
		~inst.noteOn(amp, note);
		(~dur*~legato).wait;
		~inst.noteOff(amp, note)
	}.play	
});
Pdef(\_sfz,
	Pfset(
		{ var ok=false;
			~inst=a.prepare({ok=true});
			while{ok.not}{0.1.wait};
		},
		Pbind(
			\type, \sfz,
		),
		{a.free}
	)
);
)