(
"appo.scd".loadRelative;

~rc=(val:[0,-2,1,4], spec:[0,6,0,0.1].asSpec, gBody:{
	arg s;
	FlowView(windowTitle:"harmo").front.flow{
		arg w;
		MultiSliderView(w, 200@200).elasticMode_(true)
		.step_(1/6)
		.value_(s.val.wrap(0,6)*(1/7))
		.action_{ arg self;
			s.val=s.spec.map(self.value).collect(_.asInt);
		}
	}
}
);

~rc.gBody;

~rythme=4;
//~listeGUI.value(~rc);
Pdef(\harmo, Pbind(	
	\accords,
	Pn(Plazy{Pstep(
		Pchords(
			Pn(Plazy
			{Pseq(~rc.val)//, Pstep(Pseries(), 16).iter)
				//				.trace
				// .collect({|x| 
				// switch(x%7,
				// 	6, 4,
				// 	x
				// )
				//	}) 
			})
		), 4)})
	.wrap(-1,5).collect(_.sort)
	.collect(_.asRef),
	\appo, Pdefn(\appo),
	\accords, Pfunc{arg ev; ev.appo[1..]},
	\degree, Pfunc{arg ev; ev.appo[0]},
)
);

)
