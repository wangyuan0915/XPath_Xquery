let $x := fn:doc("interview.xml")
let $result:=
for $inter in $x//interview
	where not(fn:exists($inter//collegiality))
	return $inter//@sID
return <sID>{distinct-values($result)}</sID>