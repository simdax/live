(
var w;
"../pspawn.scd".loadRelative;

w=FlowView(nil, 150@150).front;

CheckBox(w, 100@100)
.value_(Pdef(\dispatch).isPlaying)
.string_("go?")
.action_{ arg s;
	Pdef(\dispatch).toggle;
	~controller.value
};


)