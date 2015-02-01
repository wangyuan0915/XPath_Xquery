<report>{
for $i in doc("interview.xml")//interview
return <interview>
			<who rID="{data($i/@rID)}"
				 forename="{data(doc("resume.xml")//resume[@rID=data($i/@rID)]//forename)}"
				 surname="{data(doc("resume.xml")//resume[@rID=data($i/@rID)]//surname)}">
				 </who>
			
			<position>{
				data(doc("posting.xml")//posting[@pID=data($i/@pID)]//position)
			}</position>
			
			<match>{
				sum(let $p := doc("posting.xml")//posting[@pID=data($i/@pID)]
					let $r := doc("resume.xml")//resume[@rID=data($i/@rID)]

					for $psk in $p//reqSkill
					
					return if (exists($r//skill[@what=data($psk/@what)]) and $psk/@level <= $r//skill[@what=$psk/@what]//@level)
						   then(data($psk/@importance) * 1)
						   else(data($psk/@importance) * -1))
			}</match>
			
			<average>{
				let $ac := count($i//answer)
				let $as := sum($i//answer)
				let $tp := $i//techProficiency
				let $cm := $i//communication
				let $en := $i//enthusiasm
				let $co := sum($i//collegiality)
				
				(:let $all := $as + $tp + $cm + $en + $co:)
				
				return if (exists($i//collegiality))
					   then (($as + $tp + $cm + $en + $co) div ($ac + 4))
					   else (($as + $tp + $cm + $en) div ($ac + 3))
			}</average>
	   </interview>
}</report>
