// =====================================================================
// SuperCollider Workspace
// =====================================================================

a.trace([ \degree]).play
(
d=();
a=Pbind(
	\degree, p{
		arg ev; var precDur;
		var section=ev.seed;
		var note;
		d.mel=d.mel.add(note);
		if(ev.seed)
		// while{ 
		// 	(try{(precDur)}{0} <= ev.dur.postln) // premier accent;
		// 	and: (ev.dur>=1)
		// }{
		// 	precDur=ev.dur;
		// 	ev=5.rand.yield
		// };
		// loop{ev=(-1.yield)}
	}
)
<>
Pdef(\rythme)
)



