let $q3_doc:= doc("posting.xml")

let $data3:=
for $po in $q3_doc//posting
	let $max:= max($po//reqSkill/@importance)
	
	
	let $reqSkills :=
	for $req in $po//reqSkill 
		where $req//@importance = $max
		return string-join((string(data($po/@pID)),string(data($req/@what)),string(data($req/@importance)))," ")
	
	return $reqSkills

return $data3