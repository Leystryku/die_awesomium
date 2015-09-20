//Engine Stuff
#pragma once
#pragma comment (linker, "/NODEFAULTLIB:LIBCMT")
#pragma warning (disable : 4099 4075 4996)
#define WIN32_LEAN_AND_MEAN
#define CLIENT_DLL

#define CLIENT_DLL


#include "stdafx.h"
#include <cbase.h>
#include <inetchannel.h>
#include <inetmsghandler.h>
#include <iclient.h>
#include <icvar.h>
#include <input.h>


extern IVEngineClient *g_pEngine;
extern ICvar *g_pCVar;

extern std::string(InitializeSdk)();
