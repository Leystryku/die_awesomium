/*#include "sdk.h"

IVEngineClient *g_pEngine = 0;
ICvar *g_pCVar = 0;

std::string InitializeSdk()
{
	HMODULE g_EngineDLL = GetModuleHandle("engine.dll");
	HMODULE g_VstdLibDLL = GetModuleHandle("vstdlib.dll");

	if ( !g_EngineDLL || !g_VstdLibDLL )
	{
		Sleep(200);
		return InitializeSdk();
	}

	CreateInterfaceFn g_EngineFactory = (CreateInterfaceFn)GetProcAddress(g_EngineDLL, "CreateInterface");
	CreateInterfaceFn g_VstdFactory = (CreateInterfaceFn)GetProcAddress(g_VstdLibDLL, "CreateInterface");
	const char *has_Failed = NULL;

	if ( !g_EngineFactory || !g_VstdFactory )
	{
		has_Failed = "Could not get a factory";
		MessageBox(NULL, has_Failed, "grr", MB_OK);

		return 0;
	}

	//Get Interfaces
	g_pEngine = (IVEngineClient*)g_EngineFactory("VEngineClient015", 0);
	g_pCVar = (ICvar*)g_VstdFactory("VEngineCvar004", 0);


	if (!g_pEngine)
	{
		return "g_pEngine == NULL";
	}


	if (!g_pCVar)
	{
		return "g_pCVar == NULL";
	}

	return "";

}
*/