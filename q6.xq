let $a:= doc("resume.xml")
let $b:= doc("resume.xml")


(:let $skills:= for $sk1 in $a//skill return $sk1:)

(:
let $result :=
for $sk1 in $a//skill
	for $sk2 in $b//skill
		where $sk1/@what = $sk2/@what and $sk1/../../@rID != $sk2/../../@rID and compare(string(data($sk1/../../@rID)),string(data($sk2/../../@rID))) = -1 and $sk1/@level = $sk2/@level
		order by $sk1/../../@rID
		return string-join((string(data($sk1/../../@rID)),string(data($sk2/../../@rID)))," ")
return distinct-values($result)
:)


(:string-join((string(data($sk1/../../@rID)),string(data($sk2/../../@rID)))," "):)

for $re1 in $a//resume
	let $order1 := for $sko1 in $re1//skill order by $sko1//@what return $sko1
	for $re2 in $b//resume
		let $order2 := for $sko2 in $re2//skill order by $sko2//@what return $sko2
		where deep-equal($order1,$order2) and $re1/@rID != $re2/@rID and count($order1) != 0 and compare(string(data($re1/@rID)),string(data($re2/@rID))) = -1
		return string-join((string(data($re1/@rID)),string(data($re2/@rID)))," ")
	
