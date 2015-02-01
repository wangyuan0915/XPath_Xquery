<skills>
{for $psk in (distinct-values(
	for $reqsk in doc("posting.xml")//reqSkill
	return data($reqsk/@what)))
order by $psk
return <skill name="{data($psk)}">	   		
	   		
	   		<count level="1" n="{count(
				for $sk in doc("resume.xml")//skill
				where $sk/@what=$psk and $sk/@level="1"
				return $sk)}">
				</count>
	   		
	   		<count level="2" n="{count(
				for $sk in doc("resume.xml")//skill
				where $sk/@what=$psk and $sk/@level="2"
				return $sk)}">
				</count>
	   		
	   		<count level="3" n="{count(
				for $sk in doc("resume.xml")//skill
				where $sk/@what=$psk and $sk/@level="3"
				return $sk)}">
				</count>
	   		
	   		<count level="4" n="{count(
				for $sk in doc("resume.xml")//skill
				where $sk/@what=$psk and $sk/@level="4"
				return $sk)}">
				</count>
	   		
	   		<count level="5" n="{count(
				for $sk in doc("resume.xml")//skill
				where $sk/@what=$psk and $sk/@level="5"
				return $sk)}">
				</count>
	   </skill>}
</skills>