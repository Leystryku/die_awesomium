#pragma once

#include "die_awesomium.h"
#define _CRT_SECURE_NO_WARNINGS
#define WIN32_LEAN_AND_MEAN
#define _WIN32_WINNT 0x0600

#include <windows.h>

int DllInit()
{
	DieAwesomium::Init();
	return 0;
}

int __stdcall DllMain(void* hModule, unsigned long reason, void* lpReserved)
{
	if (reason == 1) // DLL_PROCESS_ATTACH
	{
		CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)DllInit, NULL, 0, 0);
	}

	return TRUE;
}