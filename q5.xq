let $x:= doc("posting.xml")
let $y:= doc("resume.xml")
let $numRes := number(fn:count($y//resume)) div 2


let $result:=
for $po in $x//posting
	for $skill in $po/reqSkill	
		
		let $resumeslist1 := (for $re in $y//resume where $re//skill[@what = $skill//@what] return $re)
		let $resumeslistnum1 := count(distinct-values($resumeslist1))
		
		
		let $resumeslist2 := (for $re in $y//resume where $re//skill[@what = $skill//@what and @level >3] return $re)
		let $resumeslistnum2 := count(distinct-values($resumeslist2))
		
		where ($resumeslistnum2<= $numRes or $resumeslistnum1<= $numRes)
	
	return <pID>{data($po/@pID)}</pID>
	
return <pIDs>{distinct-values($result)}</pIDs>