// =====================================================================
// SuperCollider Workspace
// =====================================================================

(

var portBat=0;
var a;
~searchMidi={ arg n;
	var res=MIDIClient.destinations//do(_.post)
	.detectIndex{|x|
		n.matchRegexp(x.name)
	};
	if(res.postln.notNil, {
		MIDIOut.connect(portBat, res)
	}, {"pas trouvé".postln});
};

a="ps -e | grep hydrogen".unixCmdGetStdOut;
a.isEmpty.if {b="hydrogen".unixCmd};

//~searchMidi.value(".ydrogen", portBat);

Pdef(\drums,
	Pdef(\_midi) <> (midiout:MIDIOut(portBat)) <>
	Pbind(
		\midinote,
		[40,40,50,40].pseq(inf),
		\dur, Pseq([4], inf).reciprocal,
		\amp, Pseg(Pxrand([0,1], inf), 16).repeat
	)
).quant_(4)


)

	