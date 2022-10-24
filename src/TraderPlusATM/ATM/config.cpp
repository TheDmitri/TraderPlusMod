////////////////////////////////////////////////////////////////////
//DeRap: TraderPlusATM\ATM\config.bin
//Produced from mikero's Dos Tools Dll version 8.57
//https://mikero.bytex.digital/Downloads
//'now' is Fri Aug 19 10:53:49 2022 : 'file' last modified on Thu Jan 01 01:00:01 1970
////////////////////////////////////////////////////////////////////

#define _ARMA_

class CfgPatches
{
	class TraderPlus_ATM
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"DZ_Data"};
	};
};
class CfgVehicles
{
	class HouseNoDestruct;
	class TraderPlus_BANK_ATM: HouseNoDestruct
	{
		scope = 1;
		model = "\TraderPlusATM\ATM\TraderPlus_ATM.p3d";
		hiddenSelections[] = {"box","screen"};
		hiddenSelectionsTextures[] = {"\TraderPlusATM\ATM\data\ATM_co.paa","\TraderPlusATM\ATM\data\ATM_SCREEN_co.paa"};
	};
};
