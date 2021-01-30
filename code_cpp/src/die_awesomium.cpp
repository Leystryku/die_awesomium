#pragma once
#pragma warning (disable : 4099 4075 4996)


#define _CRT_SECURE_NO_WARNINGS
#define WIN32_LEAN_AND_MEAN
#define _WIN32_WINNT 0x0600

#include <SDKDDKVer.h>
#include <windows.h>
#include <stdio.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <ctime>
#include <Shlobj.h>

#include "die_awesomium.h"

namespace DieAwesomium
{

	int DieAwesomium::Init()
	{
		//MessageBoxA(NULL, "Successfully loaded", "DieAwesomium", MB_OK);
		return 0;
	}

	int DieAwesomium::Detach()
	{
		//MessageBoxA(NULL, "Successfully loaded", "DieAwesomium", MB_OK);
		return 0;
	}

}

