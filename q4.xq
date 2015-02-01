let $x:= doc("posting.xml")
let $y:= doc("resume.xml")

let $result:=
for $po in $x//posting
	for $skill in $po/reqSkill
	let $resumeslist1 := (for $re in $y//resume where $re//skill[@what = $skill//@what and $skill//@level <= @level] return $re)
	let $resumeslistnum1 := count(distinct-values($resumeslist1))

	
	where ($resumeslistnum1 = 0)

	return $po/@pID

return <pIDs>{distinct-values($result)}</pIDs>