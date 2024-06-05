.data
base: .double 5.85
altura: .double 13.47
dos: .double 2
res: .double 0.0
.text
l.d f1,base($0)
l.d f2,altura($0)
l.d f3,dos($0)
mul.d f4,f1,f2
div.d f4,f4,f3
s.d f4,res($0)
halt
