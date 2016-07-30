(
w=FlowView(Window("params", 300@300).front, 300@300);
b=StaticText(w, 75@75)
.background_(Color.blue)
.string_(~root?0)
.stringColor_(Color.white)
.mouseDownAction_{
	arg s;
	 ~controller.value
};

~controller= { arg a;
	~root=10000.rand;
	b.bounds_(b.bounds.setExtent((~root?0).asString.bounds));
	b.string_((~root?0))
};

)