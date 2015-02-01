 let $q1_doc:= doc("resume.xml")

 let $data:= 
 for $people in $q1_doc//resume
 	where count($people//skill) >=3
 	return string-join((string(data($people/@rID)),string(data($people//forename)),string(data(count($people//skill))))," ")

return $data
 