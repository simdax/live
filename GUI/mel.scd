(
var names="rythme,degree".split($,).collect(_.asSymbol);
var taille=names.collect{arg x; Pdef(x).envir.size}.sum.postln;
var w=FlowView(nil,265@(taille*22)).front;

(names).do{arg x,i; x.postln;
PdefGui(Pdef(x),Pdef(x).envir.size,w)
};
w
)

