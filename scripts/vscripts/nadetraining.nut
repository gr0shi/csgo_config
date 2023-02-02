/* nadetraining.nut
 *
 * скинуть в /csgo/scripts/vscripts/
 *
 * Введите в консоли:
 *  script_execute nadetraining
 *	script fSetup()
 * 	bind "любая кнопка" "script fSave()"
 *	bind "другая любая кнопка" "script pScript()"
 * Нажмите первую кнопку, для сохранения траектории полета.
 * Чтобы остановить скрипт нажмите на вторую кнопку.
 */

this.nadePos		<- null;
this.nadeVel		<- null;
this.nadeSaveMode	<- true;
this.nadeLastNade	<- null;
this.isPaused 		<- false;

printl( @"Скрипт включен" );
printl( @"Введите в консоле: script fSetup()" );

function fSetup() {
	printl( @"[NT] Введите:" );
	printl( @"[NT] 	 bind ""любая кнопка"" ""script fSave()""" );
	printl( @"[NT] 	 bind ""другая любая кнопка"" ""script pScript()""" );
	printl( @"[NT] Нажмите первую кнопку, для сохранения траектории полета." );

	printl( @"[NT] Подготовка..." );
	SendToConsole( @"sv_cheats 1" );
	SendToConsole( @"ent_remove nadeTimer" );
	SendToConsole( @"ent_create logic_timer" );
	SendToConsole( @"ent_fire logic_timer addoutput ""targetname nadeTimer""" );
	SendToConsole( @"ent_fire nadeTimer toggle" );
	SendToConsole( @"ent_fire nadeTimer addoutput ""refiretime 0.05""" );
	SendToConsole( @"ent_fire nadeTimer enable" );
	SendToConsole( @" ent_fire nadeTimer addoutput ""startdisabled 0""" );
	SendToConsole( @" ent_fire nadeTimer addoutput ""UseRandomTime 0""" );
	SendToConsole( @" ent_fire nadeTimer addoutput ""ontimer nadeTimer,RunScriptCode,nadeThink()""" );
	printl( @"[NT] done. You can turn off sv_cheats now." );
}

function fSave() {
	nadeSaveMode = true;
	ScriptPrintMessageCenterAll( "Сохранение траектории" );
}
function nadeThink() {
	local nade = null;

	while ( Entities.FindByClassname(nade, "flashbang_projectile") != null ) {
		nade = Entities.FindByClassname(nade, "flashbang_projectile");
		saveRestore( nade );
	}
	
	nade = null;
	while ( Entities.FindByClassname(nade, "hegrenade_projectile") != null ) {
		nade = Entities.FindByClassname(nade, "hegrenade_projectile");
		saveRestore( nade );
	}
	nade = null;
	while ( Entities.FindByClassname(nade, "smokegrenade_projectile") != null ) {
		nade = Entities.FindByClassname(nade, "smokegrenade_projectile");
		saveRestore( nade );
	}
	nade = null;
	while ( Entities.FindByClassname(nade, "incgrenade_projectile") != null ) {
		nade = Entities.FindByClassname(nade, "incgrenade_projectile");
		saveRestore( nade );
	}
	nade = null;
	while ( Entities.FindByClassname(nade, "molotov_projectile") != null ) {
		nade = Entities.FindByClassname(nade, "molotov_projectile");
		saveRestore( nade );
	}
}
function pScript()
{
	if(isPaused == false)
	{
		isPaused = true;
		ScriptPrintMessageCenterAll( "Скрипт остановлен" );
	}
	else 
	{
		isPaused = false;
	ScriptPrintMessageCenterAll( "Скрипт снова работает, пошла новая запись" );
	}
}
function saveRestore( nade ) {
	if (isPaused == false){	
		if ( nadeLastNade != nade ) {
			if ( nadeSaveMode ) {
				ScriptPrintMessageCenterAll( "Сохранено" );
				nadePos = nade.GetCenter();
				nadeVel = nade.GetVelocity();
				nadeSaveMode = false;
			} else {
				nade.SetAbsOrigin( nadePos );
				nade.SetVelocity( nadeVel );
			}
			nadeLastNade = nade;
		}
	}
}