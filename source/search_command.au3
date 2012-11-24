#include "analysis.au3"
#include "../conf/targets_ru.au3"

global $gTargetIndex

func SearchTarget()
	LogWrite("SearchTarget() - command")

	AttackNextTarget()

	while true
		NextTarget()
		PotionHealing()

		SendTextClient("/target " & $kTargetNames[$gTargetIndex])

		if $gTargetIndex == ($kTargetCount - 1) then
			$gTargetIndex = 0		
		else
			$gTargetIndex = $gTargetIndex + 1
		endif

		if IsTargetForAttack() then
			exitloop
		endif
	wend
endfunc