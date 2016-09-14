(
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
Pdefn(\rc, 
	Pn(Plazy{Pstep(
		Pchords(
			Pn(Plazy
				{Pseq(~rc.val)
			})
		), 4)})
	.wrap(-1,5).collect(_.sort)
	.collect(_.asRef);
)
)
