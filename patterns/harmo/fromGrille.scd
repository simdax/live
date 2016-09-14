(
"appo.scd".loadRelative;
"harmoGUI.scd".loadRelative;	

Pdef(\harmo, Pbind(	
	\accords,Pdefn(\rc),
	\appo, Pdefn(\appo),
	\accords, Pfunc{arg ev; ev.appo[1..]},
	\degree, Pfunc{arg ev; ev.appo[0]},
)
);

)
