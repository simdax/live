(
var controller;

Pdefn(\root, 0);
// FlowView(Window("params", 300@300).front, 300@300)
// .flow{ arg w;
StaticText(w, 75@75).front
.background_(Color.blue)
.string_(Pdefn(\root).source)
.stringColor_(Color.white)
.mouseDownAction_{
	arg s;
	controller.value(s)
};
controller= { arg a;
	Pdefn(\root, 10000.rand);
	a.bounds_(a.bounds.setExtent(Pdefn(\root).source.asString.bounds));
	a.string_(Pdefn(\root).source)
};

)